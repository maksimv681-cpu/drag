/* Шашки 3D — аркадные гонки в плотном потоке (three.js r159, без сборки). */
(() => {
  'use strict';

  // ---------------------------------------------------------------- constants
  const LANES = [-5.4, -1.8, 1.8, 5.4];
  const LANE_SPEED = [128, 110, 94, 80]; // км/ч, левые полосы быстрее
  const ROAD_W = 16.6;
  const EDGE_X = 7.2;
  const RAIL_X = 8.1;
  const KMH = 3.6;
  const MAX_SPEED = 300 / KMH;
  const NITRO_SPEED = 370 / KMH;
  const START_SPEED = 90 / KMH;
  const VIEW_AHEAD = 340;
  const NEAR_GAP = 1.2; // м между бортами — засчитывается «шашка»
  const TIGHT_GAP = 0.5;
  const MIN_NEAR_KMH = 90;
  const PLAYER_COLORS = [0xffc21a, 0xe8322e, 0x1f6fff, 0x1b1d22, 0xf2f2f2, 0x37d67a];
  const TRAFFIC_COLORS = [0xf2f2f2, 0xbfc3c8, 0x2a2d33, 0x8a8f96, 0x1d3a6b, 0x7a1f1f, 0xc9b79c, 0x2f5a3b, 0x4a6fa5, 0xe0c341];
  const CARGO_COLORS = [0xe9e9e9, 0xc8ccd2, 0x2f5d9b, 0xb3412f];
  const STORAGE = { best: 'shashki3d.best', color: 'shashki3d.color', mute: 'shashki3d.mute' };

  const $ = (id) => document.getElementById(id);
  const rnd = (a, b) => a + Math.random() * (b - a);
  const pick = (arr) => arr[(Math.random() * arr.length) | 0];
  const clamp = (v, a, b) => Math.max(a, Math.min(b, v));
  const frac = (v) => v - Math.floor(v);
  const hash = (k, salt) => frac(Math.sin(k * 127.1 + salt * 311.7) * 43758.5453);
  const damp = (cur, target, rate, dt) => cur + (target - cur) * (1 - Math.exp(-rate * dt));
  const store = {
    get(key, def) { try { const v = localStorage.getItem(key); return v === null ? def : v; } catch { return def; } },
    set(key, v) { try { localStorage.setItem(key, String(v)); } catch { /* приватный режим */ } },
  };
  const touchMode = window.matchMedia('(pointer: coarse)').matches;

  // ---------------------------------------------------------------- renderer
  const renderer = new THREE.WebGLRenderer({ antialias: true, powerPreference: 'high-performance' });
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
  renderer.setSize(window.innerWidth, window.innerHeight);
  renderer.shadowMap.enabled = true;
  renderer.shadowMap.type = THREE.PCFSoftShadowMap;
  $('game').appendChild(renderer.domElement);
  const maxAniso = renderer.capabilities.getMaxAnisotropy();

  const scene = new THREE.Scene();
  const HORIZON = 0xd98f78;
  scene.fog = new THREE.Fog(HORIZON, 70, VIEW_AHEAD);

  const camera = new THREE.PerspectiveCamera(62, window.innerWidth / window.innerHeight, 0.1, 800);

  scene.add(new THREE.HemisphereLight(0xffe0c8, 0x3c3a55, 1.5));
  const sun = new THREE.DirectionalLight(0xffcf9e, 2.4);
  sun.castShadow = true;
  sun.shadow.mapSize.set(2048, 2048);
  Object.assign(sun.shadow.camera, { left: -26, right: 26, top: 45, bottom: -45, near: 1, far: 160 });
  sun.shadow.bias = -0.0004;
  scene.add(sun, sun.target);

  function canvasTex(w, h, draw) {
    const c = document.createElement('canvas');
    c.width = w;
    c.height = h;
    draw(c.getContext('2d'), w, h);
    const t = new THREE.CanvasTexture(c);
    t.colorSpace = THREE.SRGBColorSpace;
    t.anisotropy = maxAniso;
    t.wrapS = t.wrapT = THREE.RepeatWrapping;
    return t;
  }

  scene.background = canvasTex(4, 512, (g, w, h) => {
    const grd = g.createLinearGradient(0, 0, 0, h);
    grd.addColorStop(0, '#101a40');
    grd.addColorStop(0.28, '#3b3f7a');
    grd.addColorStop(0.45, '#b9708a');
    grd.addColorStop(0.55, '#d98f78');
    grd.addColorStop(1, '#d98f78');
    g.fillStyle = grd;
    g.fillRect(0, 0, w, h);
  });

  // ---------------------------------------------------------------- world
  const ROAD_LEN = 640;
  const ROAD_SEG = 12;
  const roadTex = canvasTex(512, 512, (g, w, h) => {
    const px = (x) => ((x + ROAD_W / 2) / ROAD_W) * w;
    g.fillStyle = '#35373c';
    g.fillRect(0, 0, w, h);
    g.fillStyle = '#2b2c30';
    g.fillRect(0, 0, px(-EDGE_X), h);
    g.fillRect(px(EDGE_X), 0, w - px(EDGE_X), h);
    for (let i = 0; i < 9000; i++) {
      const v = (Math.random() * 45 + 28) | 0;
      g.fillStyle = `rgba(${v},${v},${v + 4},0.55)`;
      g.fillRect(Math.random() * w, Math.random() * h, 2, 2);
    }
    g.fillStyle = 'rgba(0,0,0,0.13)';
    for (const lx of LANES) for (const o of [-0.8, 0.8]) g.fillRect(px(lx + o) - 7, 0, 14, h);
    const lw = (0.18 / ROAD_W) * w;
    g.fillStyle = '#ece8dc';
    g.fillRect(px(-EDGE_X) - lw / 2, 0, lw, h);
    g.fillRect(px(EDGE_X) - lw / 2, 0, lw, h);
    const dash = (4 / ROAD_SEG) * h;
    for (const x of [-3.6, 0, 3.6]) g.fillRect(px(x) - lw / 2, h * 0.1, lw, dash);
  });
  roadTex.wrapS = THREE.ClampToEdgeWrapping;
  roadTex.repeat.set(1, ROAD_LEN / ROAD_SEG);
  const road = new THREE.Mesh(
    new THREE.PlaneGeometry(ROAD_W, ROAD_LEN),
    new THREE.MeshStandardMaterial({ map: roadTex, roughness: 0.9 }),
  );
  road.rotation.x = -Math.PI / 2;
  road.receiveShadow = true;
  scene.add(road);

  const GROUND_W = 700;
  const GROUND_SEG = 18;
  const groundTex = canvasTex(256, 256, (g, w, h) => {
    g.fillStyle = '#4b5638';
    g.fillRect(0, 0, w, h);
    for (let i = 0; i < 2500; i++) {
      const c = pick(['#56633f', '#3f4a2f', '#5e5a3c', '#46523a', '#646b44']);
      g.fillStyle = c;
      const s = rnd(2, 7);
      g.fillRect(Math.random() * w, Math.random() * h, s, s);
    }
  });
  groundTex.repeat.set(GROUND_W / GROUND_SEG, ROAD_LEN / GROUND_SEG);
  const ground = new THREE.Mesh(
    new THREE.PlaneGeometry(GROUND_W, ROAD_LEN),
    new THREE.MeshStandardMaterial({ map: groundTex, roughness: 1 }),
  );
  ground.rotation.x = -Math.PI / 2;
  ground.position.y = -0.08;
  ground.receiveShadow = true;
  scene.add(ground);

  const railMat = new THREE.MeshStandardMaterial({ color: 0xb9bec6, metalness: 0.7, roughness: 0.35 });
  const rails = [-1, 1].map((side) => {
    const m = new THREE.Mesh(new THREE.BoxGeometry(0.08, 0.32, ROAD_LEN), railMat);
    m.position.set(side * RAIL_X, 0.62, 0);
    m.castShadow = true;
    scene.add(m);
    return m;
  });

  // Повторяющиеся объекты вдоль дороги: индекс k ↔ позиция k*spacing, детерминированный «рандом» по k.
  class Strip {
    constructor(spacing, count, behind, place) {
      Object.assign(this, { spacing, count, behind, place, first: null });
    }
    update(pz, force) {
      const first = Math.floor((pz + this.behind) / this.spacing);
      if (first === this.first && !force) return;
      this.first = first;
      for (let i = 0; i < this.count; i++) this.place(first - i, i);
    }
  }

  const dummy = new THREE.Object3D();
  const strips = [];

  { // столбики отбойника
    const spacing = 4;
    const count = Math.ceil((VIEW_AHEAD + 40) / spacing);
    const posts = new THREE.InstancedMesh(new THREE.BoxGeometry(0.12, 0.8, 0.14), railMat, count * 2);
    scene.add(posts);
    strips.push(new Strip(spacing, count, 25, (k, i) => {
      for (const s of [0, 1]) {
        dummy.position.set((s ? 1 : -1) * (RAIL_X + 0.08), 0.4, k * spacing);
        dummy.rotation.set(0, 0, 0);
        dummy.scale.set(1, 1, 1);
        dummy.updateMatrix();
        posts.setMatrixAt(i * 2 + s, dummy.matrix);
      }
      posts.instanceMatrix.needsUpdate = true;
    }));
  }

  { // фонари
    const spacing = 48;
    const count = Math.ceil((VIEW_AHEAD + 40) / spacing) + 1;
    const poleMat = new THREE.MeshStandardMaterial({ color: 0x55595f, metalness: 0.6, roughness: 0.5 });
    const lampMat = new THREE.MeshStandardMaterial({ color: 0xfff1cc, emissive: 0xffd58a, emissiveIntensity: 2.2 });
    const poleGeo = new THREE.CylinderGeometry(0.08, 0.12, 8.5, 8).translate(0, 4.25, 0);
    const armGeo = new THREE.BoxGeometry(2.4, 0.1, 0.1).translate(1.2, 8.4, 0);
    const headGeo = new THREE.BoxGeometry(0.7, 0.14, 0.32).translate(2.3, 8.3, 0);
    const lamps = [];
    for (let i = 0; i < count * 2; i++) {
      const g = new THREE.Group();
      const pole = new THREE.Mesh(poleGeo, poleMat);
      pole.castShadow = true;
      g.add(pole, new THREE.Mesh(armGeo, poleMat), new THREE.Mesh(headGeo, lampMat));
      scene.add(g);
      lamps.push(g);
    }
    strips.push(new Strip(spacing, count, 25, (k, i) => {
      const l = lamps[i * 2];
      l.position.set(-RAIL_X - 0.6, 0, k * spacing);
      const r = lamps[i * 2 + 1];
      r.position.set(RAIL_X + 0.6, 0, k * spacing + spacing / 2);
      r.rotation.y = Math.PI;
    }));
  }

  { // деревья
    const spacing = 6;
    const count = Math.ceil((VIEW_AHEAD + 30) / spacing);
    const trunkGeo = new THREE.CylinderGeometry(0.16, 0.24, 1.6, 6).translate(0, 0.8, 0);
    const crownGeo = new THREE.ConeGeometry(1.7, 4.4, 7).translate(0, 3.7, 0);
    const trunks = new THREE.InstancedMesh(trunkGeo, new THREE.MeshStandardMaterial({ color: 0x4a3626, roughness: 1 }), count * 2);
    const crowns = new THREE.InstancedMesh(crownGeo, new THREE.MeshStandardMaterial({ color: 0xffffff, roughness: 0.95, flatShading: true }), count * 2);
    const tint = new THREE.Color();
    const greens = [0x2f5a2c, 0x3d6b33, 0x4f6f2a, 0x29482a, 0x5c7032];
    scene.add(trunks, crowns);
    strips.push(new Strip(spacing, count, 25, (k, i) => {
      for (const s of [0, 1]) {
        const salt = s * 10;
        const idx = i * 2 + s;
        const hidden = hash(k, salt) < 0.3;
        const sc = hidden ? 0.0001 : 0.75 + hash(k, salt + 1) * 1.0;
        dummy.position.set((s ? 1 : -1) * (11 + hash(k, salt + 2) * 32), 0, k * spacing + hash(k, salt + 3) * 4);
        dummy.rotation.set(0, hash(k, salt + 4) * 6, 0);
        dummy.scale.set(sc, sc * (0.85 + hash(k, salt + 5) * 0.4), sc);
        dummy.updateMatrix();
        trunks.setMatrixAt(idx, dummy.matrix);
        crowns.setMatrixAt(idx, dummy.matrix);
        crowns.setColorAt(idx, tint.setHex(greens[(hash(k, salt + 6) * greens.length) | 0]));
      }
      trunks.instanceMatrix.needsUpdate = true;
      crowns.instanceMatrix.needsUpdate = true;
      crowns.instanceColor.needsUpdate = true;
    }));
  }

  { // дома вдали
    const spacing = 26;
    const count = Math.ceil((VIEW_AHEAD + 30) / spacing);
    const winTex = canvasTex(128, 256, (g, w, h) => {
      g.fillStyle = '#3a3d4a';
      g.fillRect(0, 0, w, h);
      const cols = 6;
      const rows = 14;
      for (let r = 0; r < rows; r++) {
        for (let c = 0; c < cols; c++) {
          const lit = Math.random() < 0.38;
          g.fillStyle = lit ? pick(['#ffd98a', '#ffe9b8', '#f5c06a']) : '#1b2030';
          g.fillRect(c * (w / cols) + 5, r * (h / rows) + 4, w / cols - 10, h / rows - 8);
        }
      }
    });
    const mat = new THREE.MeshStandardMaterial({
      map: winTex, emissiveMap: winTex, emissive: 0xffffff, emissiveIntensity: 0.55, roughness: 0.85,
    });
    const houses = new THREE.InstancedMesh(new THREE.BoxGeometry(1, 1, 1).translate(0, 0.5, 0), mat, count * 2);
    const tint = new THREE.Color();
    scene.add(houses);
    strips.push(new Strip(spacing, count, 30, (k, i) => {
      for (const s of [0, 1]) {
        const salt = 40 + s * 10;
        const idx = i * 2 + s;
        const hidden = hash(k, salt) < 0.2;
        const w = 14 + hash(k, salt + 1) * 16;
        const hgt = hidden ? 0.0001 : 12 + Math.pow(hash(k, salt + 2), 2) * 55;
        dummy.position.set((s ? 1 : -1) * (58 + hash(k, salt + 3) * 45), 0, k * spacing);
        dummy.rotation.set(0, 0, 0);
        dummy.scale.set(w, hgt, 12 + hash(k, salt + 4) * 12);
        dummy.updateMatrix();
        houses.setMatrixAt(idx, dummy.matrix);
        houses.setColorAt(idx, tint.setHSL(0.6 + hash(k, salt + 5) * 0.12, 0.12, 0.55 + hash(k, salt + 6) * 0.3));
      }
      houses.instanceMatrix.needsUpdate = true;
      houses.instanceColor.needsUpdate = true;
    }));
  }

  function updateWorld(pz, force = false) {
    const cz = pz - ROAD_LEN / 2 + 40;
    road.position.z = cz;
    ground.position.z = cz;
    rails[0].position.z = rails[1].position.z = cz;
    roadTex.offset.y = frac(-cz / ROAD_SEG);
    groundTex.offset.y = frac(-cz / GROUND_SEG);
    for (const s of strips) s.update(pz, force);
  }

  // ---------------------------------------------------------------- cars
  const boxGeo = new THREE.BoxGeometry(1, 1, 1);
  const wheelGeo = new THREE.CylinderGeometry(0.34, 0.34, 0.26, 16).rotateZ(Math.PI / 2);
  const coneGeo = new THREE.ConeGeometry(0.11, 0.8, 8).rotateX(Math.PI / 2).translate(0, 0, 0.4);
  const mats = {
    glass: new THREE.MeshStandardMaterial({ color: 0x1a2330, metalness: 0.6, roughness: 0.15 }),
    tire: new THREE.MeshStandardMaterial({ color: 0x151515, roughness: 0.9 }),
    dark: new THREE.MeshStandardMaterial({ color: 0x1e2024, roughness: 0.7 }),
    chrome: new THREE.MeshStandardMaterial({ color: 0xaab0b8, metalness: 0.9, roughness: 0.25 }),
    head: new THREE.MeshStandardMaterial({ color: 0xffffff, emissive: 0xfff3d6, emissiveIntensity: 1.4 }),
    tail: new THREE.MeshStandardMaterial({ color: 0x4a0000, emissive: 0xff1a1a, emissiveIntensity: 1.0 }),
    blinkOn: new THREE.MeshStandardMaterial({ color: 0xffb02e, emissive: 0xffa31a, emissiveIntensity: 3 }),
    blinkOff: new THREE.MeshStandardMaterial({ color: 0x6b4512, roughness: 0.4 }),
    flame: new THREE.MeshBasicMaterial({ color: 0x66d9ff, transparent: true, opacity: 0.85, blending: THREE.AdditiveBlending, depthWrite: false }),
  };
  const bodyMats = new Map();
  const bodyMat = (color) => {
    if (!bodyMats.has(color)) bodyMats.set(color, new THREE.MeshStandardMaterial({ color, metalness: 0.45, roughness: 0.35 }));
    return bodyMats.get(color);
  };

  function addBox(parent, mat, w, h, l, x, y, z, shadow = false) {
    const m = new THREE.Mesh(boxGeo, mat);
    m.scale.set(w, h, l);
    m.position.set(x, y, z);
    m.castShadow = shadow;
    parent.add(m);
    return m;
  }

  const SPECS = {
    sedan: { w: 1.8, l: 4.5, h: 0.62, clear: 0.3, ch: 0.5, cl: 2.3, cz: 0.2, wheel: 1 },
    hatch: { w: 1.74, l: 3.95, h: 0.64, clear: 0.3, ch: 0.56, cl: 2.0, cz: 0.55, wheel: 1 },
    suv: { w: 1.95, l: 4.75, h: 0.82, clear: 0.42, ch: 0.64, cl: 2.75, cz: 0.45, wheel: 1.15 },
    van: { w: 2.0, l: 5.2, h: 1.0, clear: 0.38, ch: 0.85, cl: 3.9, cz: 0.55, wheel: 1.1 },
    truck: { w: 2.45, l: 9.2, truck: true, wheel: 1.45 },
    sport: { w: 1.92, l: 4.45, h: 0.5, clear: 0.24, ch: 0.42, cl: 1.85, cz: 0.4, wheel: 1.05, sport: true },
  };

  // Машина смотрит в −z (вперёд), задние фонари на +z.
  function buildCar(kind, color) {
    const s = SPECS[kind];
    const g = new THREE.Group();
    const body = bodyMat(color);
    const { w, l } = s;
    const car = { group: g, kind, w, l, blinkers: { '-1': [], '1': [] }, tailMat: mats.tail, flames: [] };
    let lightY;
    let rearZ = l / 2;

    if (s.truck) {
      const cabL = 2.3;
      addBox(g, mats.dark, w * 0.9, 0.35, l - 0.4, 0, 0.62, 0, true);
      addBox(g, body, 2.3, 1.85, cabL, 0, 0.6 + 0.92, -l / 2 + cabL / 2, true);
      addBox(g, mats.glass, 2.1, 0.75, 0.08, 0, 1.95, -l / 2 - 0.01);
      addBox(g, bodyMat(pick(CARGO_COLORS)), w, 2.7, l - cabL - 0.3, 0, 0.75 + 1.35, -l / 2 + cabL + 0.3 + (l - cabL - 0.3) / 2, true);
      lightY = 0.75;
    } else {
      addBox(g, body, w, s.h, l, 0, s.clear + s.h / 2, 0, true);
      addBox(g, mats.glass, w * 0.84, s.ch, s.cl, 0, s.clear + s.h + s.ch / 2, s.cz, true);
      addBox(g, body, w * 0.86, 0.06, s.cl * 0.9, 0, s.clear + s.h + s.ch + 0.03, s.cz);
      addBox(g, mats.dark, w * 1.01, 0.2, 0.14, 0, s.clear + 0.1, -l / 2);
      addBox(g, mats.dark, w * 1.01, 0.2, 0.14, 0, s.clear + 0.1, l / 2);
      lightY = s.clear + s.h * 0.66;
    }

    if (s.sport) {
      car.tailMat = mats.tail.clone();
      const top = s.clear + s.h;
      addBox(g, mats.dark, w * 0.95, 0.05, 0.36, 0, top + 0.34, l / 2 - 0.25, true);
      for (const x of [-0.6, 0.6]) addBox(g, mats.dark, 0.06, 0.32, 0.12, x, top + 0.16, l / 2 - 0.25);
      addBox(g, mats.dark, w * 1.02, 0.08, 0.4, 0, s.clear + 0.04, -l / 2 + 0.1);
      for (const x of [-0.45, 0.45]) {
        const pipe = addBox(g, mats.chrome, 0.12, 0.12, 0.2, x, s.clear + 0.08, l / 2 + 0.05);
        const flame = new THREE.Mesh(coneGeo, mats.flame);
        flame.position.set(x, pipe.position.y, l / 2 + 0.12);
        flame.visible = false;
        g.add(flame);
        car.flames.push(flame);
      }
      for (const x of [-0.25, 0.25]) addBox(g, mats.dark, 0.12, 0.012, l * 0.62, x, top + 0.006, -l * 0.16);
    }

    for (const side of [-1, 1]) {
      addBox(g, mats.head, 0.38, 0.14, 0.06, side * (w / 2 - 0.3), lightY, -l / 2);
      addBox(g, car.tailMat, 0.38, 0.14, 0.06, side * (w / 2 - 0.32), lightY, rearZ);
      car.blinkers[side].push(addBox(g, mats.blinkOff, 0.12, 0.13, 0.07, side * (w / 2 - 0.06), lightY, rearZ));
      car.blinkers[side].push(addBox(g, mats.blinkOff, 0.12, 0.12, 0.07, side * (w / 2 - 0.06), lightY, -l / 2));
    }

    const r = 0.34 * s.wheel;
    const axles = s.truck ? [-l / 2 + 1.2, l / 2 - 2.4, l / 2 - 1.2] : [-l / 2 + 0.85 * s.wheel, l / 2 - 0.85 * s.wheel];
    for (const z of axles) {
      for (const side of [-1, 1]) {
        const wheel = new THREE.Mesh(wheelGeo, mats.tire);
        wheel.scale.setScalar(s.wheel);
        wheel.position.set(side * (w / 2 - 0.12), r, z);
        g.add(wheel);
      }
    }
    return car;
  }

  function setBlinker(car, side) {
    for (const s of ['-1', '1']) {
      const on = String(side) === s;
      for (const m of car.blinkers[s]) m.material = on ? mats.blinkOn : mats.blinkOff;
    }
  }

  // ---------------------------------------------------------------- player
  let colorIndex = clamp(Number(store.get(STORAGE.color, 0)) | 0, 0, PLAYER_COLORS.length - 1);
  const playerCar = buildCar('sport', PLAYER_COLORS[colorIndex]);
  scene.add(playerCar.group);
  const PW = playerCar.w;
  const PL = playerCar.l;
  const player = { x: 0, y: 0, z: 0, vx: 0, vy: 0, speed: 0, yaw: 0, spin: 0, nitro: 0, nitroOn: false };

  function setPlayerColor(i) {
    colorIndex = i;
    store.set(STORAGE.color, i);
    const mat = bodyMat(PLAYER_COLORS[i]);
    playerCar.group.traverse((m) => {
      if (m.isMesh && m.userData.body) m.material = mat;
    });
  }
  playerCar.group.traverse((m) => {
    if (m.isMesh && m.material === bodyMat(PLAYER_COLORS[colorIndex])) m.userData.body = true;
  });

  // ---------------------------------------------------------------- traffic
  const traffic = [];
  {
    const kinds = ['sedan', 'sedan', 'sedan', 'hatch', 'hatch', 'suv', 'suv', 'van', 'truck', 'sedan', 'suv', 'hatch', 'truck', 'van'];
    for (let i = 0; i < 40; i++) {
      const car = buildCar(kinds[i % kinds.length], pick(TRAFFIC_COLORS));
      car.active = false;
      car.group.visible = false;
      scene.add(car.group);
      traffic.push(car);
    }
  }

  function laneBlocked(lane, z, self, margin) {
    for (const o of traffic) {
      if (!o.active || o === self) continue;
      if ((o.lane === lane || o.targetLane === lane) && Math.abs(o.z - z) < (o.l + self.l) / 2 + margin) return true;
    }
    return false;
  }

  function trySpawn(minAhead, maxAhead, lanes) {
    const free = traffic.filter((c) => !c.active);
    if (!free.length) return false;
    const c = pick(free);
    const lane = c.kind === 'truck' ? pick(lanes.filter((l) => l >= 2).length ? lanes.filter((l) => l >= 2) : lanes) : pick(lanes);
    const z = player.z - rnd(minAhead, maxAhead);
    if (laneBlocked(lane, z, c, 14)) return false;
    // Не даём перегородить все полосы сразу — всегда должен оставаться проезд.
    const busy = new Set([lane]);
    for (const o of traffic) {
      if (o.active && Math.abs(o.z - z) < 16) busy.add(o.lane).add(o.targetLane);
    }
    if (busy.size >= LANES.length) return false;

    Object.assign(c, {
      active: true, lane, targetLane: lane, x: LANES[lane], z, yaw: 0, blink: 0, changing: false,
      passed: false, crashed: false, spin: 0,
      cruise: ((LANE_SPEED[lane] + rnd(-12, 12)) / KMH) * (c.kind === 'truck' ? 0.85 : 1),
    });
    c.speed = c.cruise;
    c.group.visible = true;
    c.group.rotation.set(0, 0, 0);
    setBlinker(c, 0);
    return true;
  }

  function clearTraffic() {
    for (const c of traffic) {
      c.active = false;
      c.group.visible = false;
    }
  }

  function updateTraffic(dt) {
    const play = state === 'play';
    const changeRate = 0.05 + Math.min(0.1, distance / 40000);
    for (const c of traffic) {
      if (!c.active) continue;

      if (c.crashed) {
        c.speed = damp(c.speed, 0, 1.5, dt);
        c.spin = damp(c.spin, 0, 1.5, dt);
        c.yaw += c.spin * dt;
      } else {
        // Держим дистанцию до впереди идущего (включая игрока).
        let limit = c.cruise;
        const follow = (ox, oz, ol, ospeed) => {
          if (Math.abs(ox - c.x) < 2.3 && oz < c.z && c.z - oz < (ol + c.l) / 2 + 20) limit = Math.min(limit, ospeed * 0.97);
        };
        for (const o of traffic) if (o.active && o !== c) follow(o.x, o.z, o.l, o.speed);
        if (state !== 'menu') follow(player.x, player.z, PL, player.speed);
        c.speed = damp(c.speed, limit, limit < c.speed ? 4 : 1.2, dt);

        const ahead = player.z - c.z;
        if (play && !c.changing && c.blink <= 0 && ahead > 30 && ahead < 220 && Math.random() < dt * changeRate) {
          const dir = pick([-1, 1]);
          const nl = c.lane + dir;
          const truckOk = c.kind !== 'truck' || nl >= 1;
          const nearPlayer = Math.abs(player.x - LANES[nl]) < 2.6 && Math.abs(player.z - c.z) < 14;
          if (nl >= 0 && nl < LANES.length && truckOk && !nearPlayer && !laneBlocked(nl, c.z, c, 10)) {
            c.targetLane = nl;
            c.blink = 1.0;
          }
        }
        if (c.targetLane !== c.lane) {
          const dir = Math.sign(c.targetLane - c.lane);
          if (c.blink > 0) {
            c.blink -= dt;
            if (c.blink <= 0) c.changing = true;
          }
          if (c.changing) {
            const tx = LANES[c.targetLane];
            c.x += clamp(tx - c.x, -2.4 * dt, 2.4 * dt);
            c.yaw = damp(c.yaw, -dir * 0.07, 6, dt);
            if (Math.abs(tx - c.x) < 0.01) {
              c.x = tx;
              c.lane = c.targetLane;
              c.changing = false;
            }
          }
          setBlinker(c, frac(time * 2.5 + c.z * 0.01) < 0.5 ? dir : 0);
        } else {
          c.yaw = damp(c.yaw, 0, 6, dt);
          setBlinker(c, 0);
        }
      }

      c.z -= c.speed * dt;
      c.group.position.set(c.x, 0, c.z);
      c.group.rotation.y = c.yaw;

      if (c.z > player.z + 30 || c.z < player.z - 480) {
        c.active = false;
        c.group.visible = false;
        continue;
      }

      if (play) {
        const dx = Math.abs(c.x - player.x);
        const dz = Math.abs(c.z - player.z);
        if (dx < (c.w + PW) / 2 - 0.06 && dz < (c.l + PL) / 2 - 0.1) {
          crash(c);
          continue;
        }
        if (!c.passed && c.z > player.z) {
          c.passed = true;
          if (player.speed > c.speed + 2) {
            const gap = dx - (c.w + PW) / 2;
            if (gap < NEAR_GAP && player.speed * KMH >= MIN_NEAR_KMH) nearMiss(gap);
            else score += 10;
          }
        }
      }
    }
  }

  function spawnTraffic() {
    let active = 0;
    for (const c of traffic) if (c.active) active++;
    const target = state === 'menu' ? 8 : Math.round(16 + Math.min(18, distance / 500));
    const lanes = state === 'menu' ? [0, 3] : [0, 1, 2, 3];
    for (let i = 0; i < 4 && active < target; i++) if (trySpawn(VIEW_AHEAD - 90, VIEW_AHEAD, lanes)) active++;
  }

  // ---------------------------------------------------------------- audio
  const audio = {
    ctx: null,
    muted: store.get(STORAGE.mute, '0') === '1',
    init() {
      if (this.ctx) return;
      const AC = window.AudioContext || window.webkitAudioContext;
      if (!AC) return;
      const ctx = (this.ctx = new AC());
      this.master = ctx.createGain();
      this.master.gain.value = this.muted ? 0 : 0.5;
      this.master.connect(ctx.destination);
      this.filter = ctx.createBiquadFilter();
      this.filter.type = 'lowpass';
      this.filter.Q.value = 3;
      this.engineGain = ctx.createGain();
      this.engineGain.gain.value = 0;
      this.o1 = ctx.createOscillator();
      this.o1.type = 'sawtooth';
      this.o2 = ctx.createOscillator();
      this.o2.type = 'square';
      const g2 = ctx.createGain();
      g2.gain.value = 0.35;
      this.o1.connect(this.filter);
      this.o2.connect(g2).connect(this.filter);
      this.filter.connect(this.engineGain).connect(this.master);
      this.o1.start();
      this.o2.start();
      const len = ctx.sampleRate;
      this.noise = ctx.createBuffer(1, len, ctx.sampleRate);
      const data = this.noise.getChannelData(0);
      for (let i = 0; i < len; i++) data[i] = Math.random() * 2 - 1;
    },
    resume() { if (this.ctx && this.ctx.state === 'suspended') this.ctx.resume(); },
    suspend() { if (this.ctx && this.ctx.state === 'running') this.ctx.suspend(); },
    setMuted(m) {
      this.muted = m;
      store.set(STORAGE.mute, m ? 1 : 0);
      if (this.master) this.master.gain.setTargetAtTime(m ? 0 : 0.5, this.ctx.currentTime, 0.05);
    },
    engine(kmh, load, on) {
      if (!this.ctx) return;
      const gears = [0, 55, 100, 150, 205, 260, 420];
      let gi = 0;
      while (gi < gears.length - 2 && kmh > gears[gi + 1]) gi++;
      const rpm = 0.3 + 0.7 * clamp((kmh - gears[gi]) / (gears[gi + 1] - gears[gi]), 0, 1);
      const f = 36 + rpm * 100 + gi * 6;
      const t = this.ctx.currentTime;
      this.o1.frequency.setTargetAtTime(f, t, 0.05);
      this.o2.frequency.setTargetAtTime(f * 0.5, t, 0.05);
      this.filter.frequency.setTargetAtTime(400 + load * 900 + rpm * 700, t, 0.08);
      this.engineGain.gain.setTargetAtTime(on ? 0.08 + load * 0.05 : 0, t, 0.12);
    },
    burst(dur, freq, vol, type) {
      if (!this.ctx) return;
      const ctx = this.ctx;
      const src = ctx.createBufferSource();
      src.buffer = this.noise;
      const f = ctx.createBiquadFilter();
      f.type = type;
      f.frequency.value = freq;
      const g = ctx.createGain();
      const t = ctx.currentTime;
      g.gain.setValueAtTime(0.0001, t);
      g.gain.exponentialRampToValueAtTime(vol, t + 0.03);
      g.gain.exponentialRampToValueAtTime(0.0001, t + dur);
      src.connect(f).connect(g).connect(this.master);
      src.start(t);
      src.stop(t + dur + 0.05);
    },
    whoosh() { this.burst(0.4, 1500, 0.6, 'bandpass'); },
    crash() { this.burst(1.2, 700, 1.2, 'lowpass'); this.burst(0.5, 2500, 0.5, 'highpass'); },
  };

  // ---------------------------------------------------------------- game state
  let state = 'menu'; // menu | play | paused | crashed | over
  let time = 0;
  let score = 0;
  let distance = 0;
  let combo = 0;
  let comboTimer = 0;
  let bestCombo = 0;
  let nearMisses = 0;
  let maxKmh = 0;
  let crashTimer = 0;
  let shake = 0;
  let best = Number(store.get(STORAGE.best, 0)) || 0;
  const cam = { offZ: 7.4, fov: 62 };

  const input = { left: false, right: false, gas: false, brake: false, nitro: false };

  const ui = {
    hud: $('hud'), score: $('score'), dist: $('dist'), bestHud: $('best-hud'), combo: $('combo'),
    speed: $('speed'), nitroBar: $('nitro-bar'), popups: $('popups'),
    menu: $('menu'), pause: $('pause'), over: $('over'), touch: $('touch'),
    pauseBtn: $('pause-btn'), muteBtn: $('mute-btn'),
  };

  function show(el, on) { el.classList.toggle('hidden', !on); }

  function resetRun(menu) {
    clearTraffic();
    Object.assign(player, { x: 0, y: 0, z: 0, vx: 0, vy: 0, yaw: 0, spin: 0, nitro: 0.35, nitroOn: false });
    player.speed = menu ? 100 / KMH : START_SPEED;
    score = 0;
    distance = 0;
    combo = 0;
    comboTimer = 0;
    bestCombo = 0;
    nearMisses = 0;
    maxKmh = 0;
    shake = 0;
    playerCar.group.rotation.set(0, 0, 0);
    for (const f of playerCar.flames) f.visible = false;
    updateWorld(player.z, true);
    const lanes = menu ? [0, 3] : [0, 1, 2, 3];
    const target = menu ? 8 : 16;
    let n = 0;
    for (let i = 0; i < 200 && n < target; i++) if (trySpawn(menu ? 20 : 70, VIEW_AHEAD, lanes)) n++;
  }

  function goMenu() {
    state = 'menu';
    resetRun(true);
    show(ui.menu, true);
    show(ui.pause, false);
    show(ui.over, false);
    show(ui.hud, false);
    show(ui.touch, false);
    show(ui.pauseBtn, false);
    $('best-menu').textContent = best.toLocaleString('ru-RU');
  }

  function startGame() {
    audio.init();
    audio.resume();
    resetRun(false);
    camera.position.set(0, 3, 8);
    state = 'play';
    show(ui.menu, false);
    show(ui.over, false);
    show(ui.pause, false);
    show(ui.hud, true);
    show(ui.touch, touchMode);
    show(ui.pauseBtn, true);
    ui.bestHud.textContent = best.toLocaleString('ru-RU');
  }

  function setPaused(p) {
    if (p && state === 'play') {
      state = 'paused';
      show(ui.pause, true);
      audio.suspend();
    } else if (!p && state === 'paused') {
      state = 'play';
      show(ui.pause, false);
      audio.resume();
    }
    for (const k in input) input[k] = false;
  }

  function popup(title, pts, hot) {
    const d = document.createElement('div');
    d.className = 'popup' + (hot ? ' hot' : '');
    const b = document.createElement('b');
    b.textContent = title;
    const s = document.createElement('span');
    s.textContent = pts;
    d.append(b, s);
    ui.popups.appendChild(d);
    setTimeout(() => d.remove(), 1150);
  }

  function nearMiss(gap) {
    const tight = gap < TIGHT_GAP;
    combo = Math.min(combo + 1, 10);
    comboTimer = 3.5;
    bestCombo = Math.max(bestCombo, combo);
    nearMisses++;
    const pts = (tight ? 250 : 120) * combo;
    score += pts;
    player.nitro = Math.min(1, player.nitro + (tight ? 0.2 : 0.12));
    popup(tight ? 'ВПРИТИРКУ!' : 'ШАШКА!', `+${pts}${combo > 1 ? `  ×${combo}` : ''}`, tight);
    audio.whoosh();
    shake = Math.max(shake, tight ? 0.35 : 0.18);
  }

  function crash(car) {
    state = 'crashed';
    crashTimer = 0;
    const dir = player.x < car.x ? 1 : -1;
    player.spin = dir * rnd(4, 7);
    player.vy = 3 + player.speed * 0.06;
    car.crashed = true;
    car.spin = -dir * rnd(1, 2.5);
    car.speed = Math.max(car.speed, player.speed * 0.6);
    shake = 1.4;
    for (const k in input) input[k] = false;
    audio.crash();
    show(ui.touch, false);
    show(ui.pauseBtn, false);
  }

  function gameOver() {
    state = 'over';
    const total = Math.round(score);
    const record = total > best;
    if (record) {
      best = total;
      store.set(STORAGE.best, best);
    }
    $('o-score').textContent = total.toLocaleString('ru-RU');
    $('o-dist').textContent = `${(distance / 1000).toFixed(2)} км`;
    $('o-speed').textContent = `${Math.round(maxKmh)} км/ч`;
    $('o-near').textContent = nearMisses;
    $('o-combo').textContent = `×${bestCombo}`;
    $('o-best').textContent = best.toLocaleString('ru-RU');
    show($('new-record'), record);
    show(ui.hud, false);
    show(ui.over, true);
  }

  // ---------------------------------------------------------------- update
  function updatePlayer(dt) {
    const p = player;
    if (state === 'menu') {
      p.speed = 100 / KMH;
      p.z -= p.speed * dt;
    } else if (state === 'play') {
      const steer = (input.right ? 1 : 0) - (input.left ? 1 : 0);
      const gas = input.gas || (touchMode && !input.brake);
      const nitroOn = input.nitro && p.nitro > 0.01;
      const top = nitroOn ? NITRO_SPEED : MAX_SPEED;
      let a;
      if (input.brake) a = -26;
      else if (gas) a = 15 * (1 - (p.speed / top) ** 2) + (nitroOn ? 14 : 0);
      else a = -2.5 - p.speed * 0.025;
      if (nitroOn && !gas && !input.brake) a = 14 * (1 - (p.speed / top) ** 2);
      if (!nitroOn && p.speed > MAX_SPEED) a = Math.min(a, -6);
      if (nitroOn) p.nitro = Math.max(0, p.nitro - dt * 0.28);
      p.nitroOn = nitroOn;
      p.speed = clamp(p.speed + a * dt, 0, NITRO_SPEED);

      const steerSpeed = 3.5 + Math.min(p.speed, 70) * 0.13;
      p.vx = damp(p.vx, p.speed > 1 ? steer * steerSpeed : 0, 9, dt);
      p.x += p.vx * dt;
      const lim = RAIL_X - PW / 2 - 0.15;
      if (Math.abs(p.x) > lim) {
        p.x = Math.sign(p.x) * lim;
        p.vx = 0;
        p.speed *= Math.exp(-dt * 1.2);
        shake = Math.max(shake, 0.25);
      }
      p.z -= p.speed * dt;
      distance += p.speed * dt;
      const kmh = p.speed * KMH;
      maxKmh = Math.max(maxKmh, kmh);
      score += p.speed * dt * 0.1 * (1 + Math.max(0, kmh - 120) / 120);
      if (comboTimer > 0) {
        comboTimer -= dt;
        if (comboTimer <= 0) combo = 0;
      }
    } else if (state === 'crashed' || state === 'over') {
      p.speed = damp(p.speed, 0, 1.3, dt);
      p.z -= p.speed * dt;
      p.x += p.spin * 0.25 * dt;
      p.yaw += p.spin * dt;
      p.spin = damp(p.spin, 0, 1.2, dt);
      p.vy -= 22 * dt;
      p.y += p.vy * dt;
      if (p.y < 0) {
        p.y = 0;
        p.vy = Math.abs(p.vy) > 1.5 ? -p.vy * 0.3 : 0;
      }
      if (state === 'crashed') {
        crashTimer += dt;
        if (crashTimer > 1.7) gameOver();
      }
    }

    const g = playerCar.group;
    g.position.set(p.x, p.y, p.z);
    if (state === 'play' || state === 'menu') {
      g.rotation.y = -p.vx * 0.022;
      g.rotation.z = p.vx * 0.012;
    } else if (state !== 'paused') {
      g.rotation.y = p.yaw;
      g.rotation.z = damp(g.rotation.z, 0, 4, dt);
    }
    playerCar.tailMat.emissiveIntensity = input.brake ? 3.2 : 1.0;
    for (const f of playerCar.flames) {
      f.visible = state === 'play' && p.nitroOn;
      f.scale.set(1, 1, 0.7 + Math.random() * 0.8);
    }
  }

  function updateCamera(dt) {
    const p = player;
    if (state === 'menu') {
      const a = time * 0.18;
      camera.position.set(p.x + Math.sin(a) * 9, 2.6 + Math.sin(time * 0.4) * 0.6, p.z + Math.cos(a) * 9);
      camera.lookAt(p.x, 0.8, p.z);
      cam.fov = 55;
    } else {
      const sf = clamp(p.speed / MAX_SPEED, 0, 1.3);
      // На узком (портретном) экране отодвигаем камеру и расширяем обзор, чтобы были видны все полосы.
      const portrait = clamp((1.2 - camera.aspect) / 0.7, 0, 1);
      cam.offZ = damp(cam.offZ, 7.4 - sf * 1.3 + portrait * 3, 3, dt);
      camera.position.x = damp(camera.position.x, p.x * 0.75 * (1 - portrait * 0.6), 5, dt);
      camera.position.y = damp(camera.position.y, 2.75 - sf * 0.45 + portrait * 1.6, 3, dt);
      camera.position.z = p.z + cam.offZ;
      cam.fov = damp(cam.fov, 60 + sf * 18 + (p.nitroOn ? 8 : 0) + portrait * 18, 3, dt);
      camera.lookAt(p.x * 0.9, 1.0, p.z - 14);
      if (shake > 0.001) {
        camera.position.x += (Math.random() - 0.5) * shake * 0.4;
        camera.position.y += (Math.random() - 0.5) * shake * 0.3;
      }
      shake = damp(shake, 0, 4, dt);
    }
    if (Math.abs(camera.fov - cam.fov) > 0.01) {
      camera.fov = cam.fov;
      camera.updateProjectionMatrix();
    }
    sun.position.set(p.x + 18, 45, p.z + 28);
    sun.target.position.set(p.x, 0, p.z - 20);
  }

  let hudTick = 0;
  function updateHud(dt) {
    if (state !== 'play') return;
    ui.speed.textContent = Math.round(player.speed * KMH);
    ui.nitroBar.style.width = `${(player.nitro * 100).toFixed(1)}%`;
    ui.nitroBar.classList.toggle('active', player.nitroOn);
    hudTick -= dt;
    if (hudTick > 0) return;
    hudTick = 0.1;
    ui.score.textContent = Math.round(score).toLocaleString('ru-RU');
    ui.dist.textContent = `${(distance / 1000).toFixed(1)} км`;
    ui.combo.textContent = combo > 1 ? `КОМБО ×${combo}` : '';
    ui.combo.classList.toggle('on', combo > 1);
  }

  let last = performance.now();
  function frame(now) {
    requestAnimationFrame(frame);
    const dt = Math.min((now - last) / 1000, 0.05);
    last = now;
    if (state !== 'paused') {
      time += dt;
      updatePlayer(dt);
      updateTraffic(dt);
      spawnTraffic();
      updateWorld(player.z);
      updateCamera(dt);
      updateHud(dt);
      const gas = input.gas || (touchMode && !input.brake);
      audio.engine(player.speed * KMH, state === 'play' && (gas || player.nitroOn) ? 1 : 0, state === 'play' || state === 'menu');
    }
    renderer.render(scene, camera);
  }

  // ---------------------------------------------------------------- input & UI
  const KEYMAP = {
    ArrowLeft: 'left', KeyA: 'left', ArrowRight: 'right', KeyD: 'right',
    ArrowUp: 'gas', KeyW: 'gas', ArrowDown: 'brake', KeyS: 'brake',
    ShiftLeft: 'nitro', ShiftRight: 'nitro', Space: 'nitro',
  };

  window.addEventListener('keydown', (e) => {
    if ((state === 'menu' || state === 'over') && (e.code === 'Enter' || e.code === 'Space')) {
      e.preventDefault();
      if (!e.repeat) startGame();
      return;
    }
    if (e.code === 'Escape' || e.code === 'KeyP') {
      setPaused(state === 'play');
      return;
    }
    if (e.code === 'KeyM') {
      toggleMute();
      return;
    }
    if (state === 'paused' && e.code === 'Enter') {
      setPaused(false);
      return;
    }
    const k = KEYMAP[e.code];
    if (k) {
      e.preventDefault();
      if (state === 'play') input[k] = true;
    }
  });
  window.addEventListener('keyup', (e) => {
    const k = KEYMAP[e.code];
    if (k) input[k] = false;
  });
  window.addEventListener('blur', () => {
    for (const k in input) input[k] = false;
  });
  document.addEventListener('visibilitychange', () => {
    if (document.hidden) setPaused(true);
  });

  for (const btn of document.querySelectorAll('#touch button')) {
    const key = btn.dataset.key;
    const set = (on) => (e) => {
      e.preventDefault();
      if (state === 'play') input[key] = on;
      btn.classList.toggle('pressed', on);
    };
    btn.addEventListener('pointerdown', (e) => {
      btn.setPointerCapture(e.pointerId);
      set(true)(e);
    });
    for (const ev of ['pointerup', 'pointercancel', 'lostpointercapture']) btn.addEventListener(ev, set(false));
  }

  function toggleMute() {
    audio.setMuted(!audio.muted);
    ui.muteBtn.textContent = audio.muted ? '🔇' : '🔊';
  }
  ui.muteBtn.textContent = audio.muted ? '🔇' : '🔊';
  ui.muteBtn.addEventListener('click', (e) => {
    e.currentTarget.blur();
    toggleMute();
  });
  ui.pauseBtn.addEventListener('click', (e) => {
    e.currentTarget.blur();
    setPaused(true);
  });
  $('start-btn').addEventListener('click', startGame);
  $('restart-btn').addEventListener('click', startGame);
  $('resume-btn').addEventListener('click', () => setPaused(false));
  $('pause-menu-btn').addEventListener('click', goMenu);
  $('over-menu-btn').addEventListener('click', goMenu);

  const colors = $('colors');
  PLAYER_COLORS.forEach((c, i) => {
    const b = document.createElement('button');
    b.className = 'swatch' + (i === colorIndex ? ' selected' : '');
    b.style.background = `#${c.toString(16).padStart(6, '0')}`;
    b.setAttribute('aria-label', `Цвет ${i + 1}`);
    b.addEventListener('click', () => {
      setPlayerColor(i);
      for (const s of colors.children) s.classList.toggle('selected', s === b);
    });
    colors.appendChild(b);
  });

  window.addEventListener('resize', () => {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
  });

  // Хук для автотестов: состояние игры без доступа к замыканию.
  window.__shashki = { get state() { return state; }, player, get score() { return score; }, get nearMisses() { return nearMisses; }, traffic };

  goMenu();
  requestAnimationFrame(frame);
})();
