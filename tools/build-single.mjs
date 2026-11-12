// Собирает игру в один самодостаточный HTML-файл (для телефона: скачал и открыл).
// Запуск: node tools/build-single.mjs
import { readFileSync, writeFileSync } from 'node:fs';

const root = new URL('../', import.meta.url);
const read = (p) => readFileSync(new URL(p, root), 'utf8');
// Внутри <script> нельзя встречать "</script", иначе браузер оборвёт тег.
const safeJs = (s) => s.replace(/<\/script/gi, '<\\/script');

let html = read('index.html');
const swaps = [
  ['<link rel="stylesheet" href="game/style.css">', () => `<style>\n${read('game/style.css')}</style>`],
  ['<script src="game/vendor/three.min.js"></script>', () => `<script>${safeJs(read('game/vendor/three.min.js'))}</script>`],
  ['<script src="game/game.js"></script>', () => `<script>\n${safeJs(read('game/game.js'))}</script>`],
];
for (const [tag, content] of swaps) {
  if (!html.includes(tag)) throw new Error(`Не найден тег: ${tag}`);
  html = html.replace(tag, () => content());
}
writeFileSync(new URL('shashki3d.html', root), html);
console.log(`shashki3d.html: ${(html.length / 1024).toFixed(0)} КБ`);
