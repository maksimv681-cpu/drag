.class final Lcom/dragstreets/shell/ShellText;
.super Ljava/lang/Object;
.source "ShellText.java"


# static fields
.field private static final LANGUAGES:[Ljava/lang/String;

.field private static final TEXT:[[Ljava/lang/String;

.field private static final UPDATES:[[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 19

    .line 5
    const-string v5, "pt"

    const-string v6, "fr"

    const-string v0, "en"

    const-string v1, "ru"

    const-string v2, "uk"

    const-string v3, "de"

    const-string v4, "es"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dragstreets/shell/ShellText;->LANGUAGES:[Ljava/lang/String;

    .line 6
    const-string v10, "Unable to start game"

    const-string v11, "Check your connection and retry, or open the saved version."

    const-string v1, "READY TO RACE"

    const-string v2, "Your streets. Your rules."

    const-string v3, "Updates download automatically. Your progress stays with your account."

    const-string v4, "Verified updates \u00b7 Secure connection"

    const-string v5, "Checking for updates"

    const-string v6, "Downloading update"

    const-string v7, "Retry"

    const-string v8, "Saved version"

    const-string v9, "Starting game"

    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v12

    const-string v9, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0442\u044c \u0438\u0433\u0440\u0443"

    const-string v10, "\u041f\u0440\u043e\u0432\u0435\u0440\u044c \u0441\u043e\u0435\u0434\u0438\u043d\u0435\u043d\u0438\u0435 \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438 \u043f\u043e\u043f\u044b\u0442\u043a\u0443 \u0438\u043b\u0438 \u043e\u0442\u043a\u0440\u043e\u0439 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u0443\u044e \u0432\u0435\u0440\u0441\u0438\u044e."

    const-string v0, "\u0412\u0420\u0415\u041c\u042f \u0413\u041e\u041d\u042f\u0422\u042c"

    const-string v1, "\u0422\u0432\u043e\u0438 \u0443\u043b\u0438\u0446\u044b. \u0422\u0432\u043e\u0438 \u043f\u0440\u0430\u0432\u0438\u043b\u0430."

    const-string v2, "\u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u044f \u0437\u0430\u0433\u0440\u0443\u0436\u0430\u044e\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438. \u041f\u0440\u043e\u0433\u0440\u0435\u0441\u0441 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d \u0432 \u0430\u043a\u043a\u0430\u0443\u043d\u0442\u0435."

    const-string v3, "\u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u043f\u043e\u0434\u043b\u0438\u043d\u043d\u043e\u0441\u0442\u0438 \u00b7 \u0417\u0430\u0449\u0438\u0449\u0451\u043d\u043d\u043e\u0435 \u0441\u043e\u0435\u0434\u0438\u043d\u0435\u043d\u0438\u0435"

    const-string v4, "\u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u0439"

    const-string v5, "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430 \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u044f"

    const-string v6, "\u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u044c"

    const-string v7, "\u0421\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u0430\u044f \u0432\u0435\u0440\u0441\u0438\u044f"

    const-string v8, "\u0417\u0430\u043f\u0443\u0441\u043a \u0438\u0433\u0440\u044b"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    move-result-object v13

    const-string v9, "\u041d\u0435 \u0432\u0434\u0430\u043b\u043e\u0441\u044f \u0437\u0430\u043f\u0443\u0441\u0442\u0438\u0442\u0438 \u0433\u0440\u0443"

    const-string v10, "\u041f\u0435\u0440\u0435\u0432\u0456\u0440 \u0437\u2019\u0454\u0434\u043d\u0430\u043d\u043d\u044f \u0442\u0430 \u043f\u043e\u0432\u0442\u043e\u0440\u0438 \u0441\u043f\u0440\u043e\u0431\u0443 \u0430\u0431\u043e \u0432\u0456\u0434\u043a\u0440\u0438\u0439 \u0437\u0431\u0435\u0440\u0435\u0436\u0435\u043d\u0443 \u0432\u0435\u0440\u0441\u0456\u044e."

    const-string v0, "\u0427\u0410\u0421 \u041f\u0415\u0420\u0415\u0413\u041e\u041d\u0406\u0412"

    const-string v1, "\u0422\u0432\u043e\u0457 \u0432\u0443\u043b\u0438\u0446\u0456. \u0422\u0432\u043e\u0457 \u043f\u0440\u0430\u0432\u0438\u043b\u0430."

    const-string v2, "\u041e\u043d\u043e\u0432\u043b\u0435\u043d\u043d\u044f \u0437\u0430\u0432\u0430\u043d\u0442\u0430\u0436\u0443\u044e\u0442\u044c\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u043d\u043e. \u041f\u0440\u043e\u0433\u0440\u0435\u0441 \u0437\u0431\u0435\u0440\u0435\u0436\u0435\u043d\u043e \u0432 \u0430\u043a\u0430\u0443\u043d\u0442\u0456."

    const-string v3, "\u041f\u0435\u0440\u0435\u0432\u0456\u0440\u043a\u0430 \u0441\u043f\u0440\u0430\u0432\u0436\u043d\u043e\u0441\u0442\u0456 \u00b7 \u0417\u0430\u0445\u0438\u0449\u0435\u043d\u0435 \u0437\u2019\u0454\u0434\u043d\u0430\u043d\u043d\u044f"

    const-string v4, "\u041f\u0435\u0440\u0435\u0432\u0456\u0440\u043a\u0430 \u043e\u043d\u043e\u0432\u043b\u0435\u043d\u044c"

    const-string v5, "\u0417\u0430\u0432\u0430\u043d\u0442\u0430\u0436\u0435\u043d\u043d\u044f \u043e\u043d\u043e\u0432\u043b\u0435\u043d\u043d\u044f"

    const-string v6, "\u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0438"

    const-string v7, "\u0417\u0431\u0435\u0440\u0435\u0436\u0435\u043d\u0430 \u0432\u0435\u0440\u0441\u0456\u044f"

    const-string v8, "\u0417\u0430\u043f\u0443\u0441\u043a \u0433\u0440\u0438"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    move-result-object v14

    const-string v9, "Spielstart fehlgeschlagen"

    const-string v10, "Pr\u00fcfe die Verbindung oder starte die gespeicherte Version."

    const-string v0, "BEREIT F\u00dcRS RENNEN"

    const-string v1, "Deine Stra\u00dfen. Deine Regeln."

    const-string v2, "Updates werden automatisch geladen. Dein Fortschritt bleibt im Konto gespeichert."

    const-string v3, "Gepr\u00fcfte Updates \u00b7 Sichere Verbindung"

    const-string v4, "Updates werden gesucht"

    const-string v5, "Update wird geladen"

    const-string v6, "Erneut versuchen"

    const-string v7, "Gespeicherte Version"

    const-string v8, "Spiel wird gestartet"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    move-result-object v15

    const-string v9, "No se pudo iniciar el juego"

    const-string v10, "Comprueba la conexi\u00f3n y reintenta o abre la versi\u00f3n guardada."

    const-string v0, "A CORRER"

    const-string v1, "Tus calles. Tus reglas."

    const-string v2, "Las actualizaciones se descargan autom\u00e1ticamente. Tu progreso se guarda en tu cuenta."

    const-string v3, "Actualizaciones verificadas \u00b7 Conexi\u00f3n segura"

    const-string v4, "Buscando actualizaciones"

    const-string v5, "Descargando actualizaci\u00f3n"

    const-string v6, "Reintentar"

    const-string v7, "Versi\u00f3n guardada"

    const-string v8, "Iniciando juego"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    move-result-object v16

    const-string v9, "N\u00e3o foi poss\u00edvel iniciar"

    const-string v10, "Verifique a conex\u00e3o e tente de novo ou abra a vers\u00e3o salva."

    const-string v0, "HORA DE CORRER"

    const-string v1, "Suas ruas. Suas regras."

    const-string v2, "As atualiza\u00e7\u00f5es s\u00e3o baixadas automaticamente. Seu progresso fica salvo na conta."

    const-string v3, "Atualiza\u00e7\u00f5es verificadas \u00b7 Conex\u00e3o segura"

    const-string v4, "Buscando atualiza\u00e7\u00f5es"

    const-string v5, "Baixando atualiza\u00e7\u00e3o"

    const-string v6, "Tentar de novo"

    const-string v7, "Vers\u00e3o salva"

    const-string v8, "Iniciando jogo"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    move-result-object v17

    const-string v9, "D\u00e9marrage impossible"

    const-string v10, "V\u00e9rifie la connexion et r\u00e9essaie ou lance la version enregistr\u00e9e."

    const-string v0, "PR\u00caT \u00c0 COURIR"

    const-string v1, "Tes rues. Tes r\u00e8gles."

    const-string v2, "Les mises \u00e0 jour sont automatiques. Ta progression reste enregistr\u00e9e sur ton compte."

    const-string v3, "Mises \u00e0 jour v\u00e9rifi\u00e9es \u00b7 Connexion s\u00e9curis\u00e9e"

    const-string v4, "Recherche de mises \u00e0 jour"

    const-string v5, "T\u00e9l\u00e9chargement en cours"

    const-string v6, "R\u00e9essayer"

    const-string v7, "Version enregistr\u00e9e"

    const-string v8, "D\u00e9marrage du jeu"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    move-result-object v18

    filled-new-array/range {v12 .. v18}, [[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dragstreets/shell/ShellText;->TEXT:[[Ljava/lang/String;

    .line 15
    const-string v0, "A new game update is ready. You can finish playing, then fully close and reopen the app to install it. Your progress stays saved."

    const-string v1, "Got it"

    const-string v2, "Game update available"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v3

    const-string v0, "\u0413\u043e\u0442\u043e\u0432\u043e \u043d\u043e\u0432\u043e\u0435 \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u0435 \u0438\u0433\u0440\u044b. \u041c\u043e\u0436\u0435\u0448\u044c \u0437\u0430\u043a\u043e\u043d\u0447\u0438\u0442\u044c \u0437\u0430\u0435\u0437\u0434\u044b, \u0437\u0430\u0442\u0435\u043c \u043f\u043e\u043b\u043d\u043e\u0441\u0442\u044c\u044e \u0437\u0430\u043a\u0440\u044b\u0442\u044c \u0438 \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u0435. \u041e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u0435 \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u0441\u044f \u043f\u0440\u0438 \u0437\u0430\u043f\u0443\u0441\u043a\u0435, \u043f\u0440\u043e\u0433\u0440\u0435\u0441\u0441 \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u0441\u044f."

    const-string v1, "\u041f\u043e\u043d\u044f\u0442\u043d\u043e"

    const-string v2, "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u043e \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u0435"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v4

    const-string v0, "\u0413\u043e\u0442\u043e\u0432\u0435 \u043d\u043e\u0432\u0435 \u043e\u043d\u043e\u0432\u043b\u0435\u043d\u043d\u044f \u0433\u0440\u0438. \u041c\u043e\u0436\u0435\u0448 \u0437\u0430\u0432\u0435\u0440\u0448\u0438\u0442\u0438 \u0437\u0430\u0457\u0437\u0434\u0438, \u043f\u043e\u0442\u0456\u043c \u043f\u043e\u0432\u043d\u0456\u0441\u0442\u044e \u0437\u0430\u043a\u0440\u0438\u0442\u0438 \u0439 \u0432\u0456\u0434\u043a\u0440\u0438\u0442\u0438 \u0437\u0430\u0441\u0442\u043e\u0441\u0443\u043d\u043e\u043a. \u041e\u043d\u043e\u0432\u043b\u0435\u043d\u043d\u044f \u0432\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u044c\u0441\u044f \u043f\u0456\u0434 \u0447\u0430\u0441 \u0437\u0430\u043f\u0443\u0441\u043a\u0443, \u043f\u0440\u043e\u0433\u0440\u0435\u0441 \u0437\u0431\u0435\u0440\u0435\u0436\u0435\u0442\u044c\u0441\u044f."

    const-string v1, "\u0417\u0440\u043e\u0437\u0443\u043c\u0456\u043b\u043e"

    const-string v2, "\u0414\u043e\u0441\u0442\u0443\u043f\u043d\u0435 \u043e\u043d\u043e\u0432\u043b\u0435\u043d\u043d\u044f"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v5

    const-string v0, "Ein neues Update ist bereit. Beende deine Rennen und schlie\u00dfe und \u00f6ffne danach die App vollst\u00e4ndig. Das Update wird beim Start installiert. Dein Fortschritt bleibt erhalten."

    const-string v1, "Verstanden"

    const-string v2, "Spielupdate verf\u00fcgbar"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v6

    const-string v0, "Hay una nueva actualizaci\u00f3n. Termina tus carreras y despu\u00e9s cierra por completo y vuelve a abrir la aplicaci\u00f3n. Se instalar\u00e1 al iniciar y conservar\u00e1s tu progreso."

    const-string v1, "Entendido"

    const-string v2, "Actualizaci\u00f3n disponible"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v7

    const-string v0, "Uma nova atualiza\u00e7\u00e3o est\u00e1 pronta. Termine suas corridas e depois feche completamente e abra o aplicativo. Ela ser\u00e1 instalada ao iniciar. Seu progresso ser\u00e1 mantido."

    const-string v1, "Entendi"

    const-string v2, "Atualiza\u00e7\u00e3o dispon\u00edvel"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v8

    const-string v0, "Une nouvelle mise \u00e0 jour est pr\u00eate. Termine tes courses, puis ferme compl\u00e8tement et rouvre le jeu. Elle sera install\u00e9e au d\u00e9marrage. Ta progression sera conserv\u00e9e."

    const-string v1, "Compris"

    const-string v2, "Mise \u00e0 jour disponible"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v9

    filled-new-array/range {v3 .. v9}, [[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dragstreets/shell/ShellText;->UPDATES:[[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static get(I)Ljava/lang/String;
    .locals 2

    .line 29
    sget-object v0, Lcom/dragstreets/shell/ShellText;->TEXT:[[Ljava/lang/String;

    invoke-static {}, Lcom/dragstreets/shell/ShellText;->language()I

    move-result v1

    aget-object v0, v0, v1

    aget-object p0, v0, p0

    return-object p0
.end method

.method private static language()I
    .locals 4

    .line 25
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 26
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    sget-object v3, Lcom/dragstreets/shell/ShellText;->LANGUAGES:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_1

    sget-object v3, Lcom/dragstreets/shell/ShellText;->LANGUAGES:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 27
    :cond_1
    return v1
.end method

.method static update(I)Ljava/lang/String;
    .locals 2

    .line 30
    sget-object v0, Lcom/dragstreets/shell/ShellText;->UPDATES:[[Ljava/lang/String;

    invoke-static {}, Lcom/dragstreets/shell/ShellText;->language()I

    move-result v1

    aget-object v0, v0, v1

    aget-object p0, v0, p0

    return-object p0
.end method
