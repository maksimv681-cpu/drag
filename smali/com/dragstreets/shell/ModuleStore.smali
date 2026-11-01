.class final Lcom/dragstreets/shell/ModuleStore;
.super Ljava/lang/Object;
.source "ModuleStore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dragstreets/shell/ModuleStore$Progress;
    }
.end annotation


# instance fields
.field final context:Landroid/content/Context;

.field final directory:Ljava/io/File;

.field final key:Ljava/security/PublicKey;

.field final origin:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    const-string v0, "https://127.0.0.1:9"

    invoke-direct {p0, p1, v0}, Lcom/dragstreets/shell/ModuleStore;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 19
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    const-string v2, "https"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {v0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_6

    invoke-virtual {v0}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_6

    invoke-virtual {v0}, Ljava/net/URL;->getRef()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_6

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const-string v2, "/"

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 20
    :cond_0
    invoke-virtual {p2, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    :cond_1
    iput-object p2, p0, Lcom/dragstreets/shell/ModuleStore;->origin:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    new-instance p2, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getNoBackupFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "game-modules"

    invoke-direct {p2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    .line 22
    iget-object p2, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result p2

    if-nez p2, :cond_3

    iget-object p2, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_0

    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Module directory unavailable"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 23
    :cond_3
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    const-string p2, "shell/signer.cer"

    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    :try_start_0
    const-string p2, "X.509"

    invoke-static {p2}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object p2

    invoke-virtual {p2}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object p2

    iput-object p2, p0, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 24
    :cond_4
    return-void

    .line 23
    :catchall_0
    move-exception p2

    if-eqz p1, :cond_5

    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p1

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_1
    throw p2

    .line 19
    :cond_6
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Invalid update origin"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private baselineMetadata()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "shell/baseline.dsm"

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    const/16 v1, 0x2000

    invoke-static {v0, v1}, Lcom/dragstreets/shell/ModuleStore;->readLimited(Ljava/io/InputStream;I)[B

    move-result-object v0

    return-object v0
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;JLcom/dragstreets/shell/ModuleStore$Progress;JJ)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 154
    move-object/from16 v0, p4

    move-wide/from16 v1, p7

    const v3, 0x8000

    new-array v3, v3, [B

    const-wide/16 v4, 0x0

    move-wide v6, v4

    .line 155
    :cond_0
    :goto_0
    move-object/from16 v8, p0

    invoke-virtual {v8, v3}, Ljava/io/InputStream;->read([B)I

    move-result v9

    const/4 v10, -0x1

    if-eq v9, v10, :cond_2

    int-to-long v10, v9

    add-long/2addr v4, v10

    cmp-long v10, v4, p2

    if-gtz v10, :cond_1

    const/4 v10, 0x0

    move-object/from16 v11, p1

    invoke-virtual {v11, v3, v10, v9}, Ljava/io/OutputStream;->write([BII)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    if-eqz v0, :cond_0

    sub-long v12, v9, v6

    const-wide/16 v14, 0xc8

    cmp-long v12, v12, v14

    if-lez v12, :cond_0

    add-long v6, p5, v4

    invoke-interface {v0, v6, v7, v1, v2}, Lcom/dragstreets/shell/ModuleStore$Progress;->update(JJ)V

    move-wide v6, v9

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Module exceeds signed size"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_2
    cmp-long v3, v4, p2

    if-nez v3, :cond_4

    if-eqz v0, :cond_3

    add-long v3, p5, v4

    invoke-interface {v0, v3, v4, v1, v2}, Lcom/dragstreets/shell/ModuleStore$Progress;->update(JJ)V

    .line 157
    :cond_3
    return-void

    .line 156
    :cond_4
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "Module transfer interrupted"

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static discard(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Cannot remove damaged module cache"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 54
    :cond_1
    :goto_0
    return-void
.end method

.method private download(Lcom/dragstreets/shell/SignedModule;Ljava/io/File;Lcom/dragstreets/shell/ModuleStore$Progress;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 124
    move-object/from16 v1, p0

    move-object/from16 v0, p1

    new-instance v2, Ljava/io/File;

    iget-object v3, v1, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".part"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 125
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v3

    iget-wide v5, v0, Lcom/dragstreets/shell/SignedModule;->bytes:J

    cmp-long v3, v3, v5

    if-lez v3, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Invalid partial module"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_1
    :goto_0
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v3

    move-wide v10, v3

    .line 128
    :goto_1
    iget-wide v3, v0, Lcom/dragstreets/shell/SignedModule;->bytes:J

    cmp-long v3, v10, v3

    if-gez v3, :cond_5

    .line 129
    iget-wide v3, v0, Lcom/dragstreets/shell/SignedModule;->bytes:J

    const-wide/16 v14, 0x1

    sub-long/2addr v3, v14

    const-wide/32 v5, 0x400000

    add-long/2addr v5, v10

    sub-long/2addr v5, v14

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    .line 130
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v1, Lcom/dragstreets/shell/ModuleStore;->origin:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Lcom/dragstreets/shell/SignedModule;->path:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/dragstreets/shell/ModuleStore;->open(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bytes="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v8, "Range"

    invoke-virtual {v5, v8, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    :try_start_0
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v6

    const/16 v8, 0xce

    if-ne v6, v8, :cond_4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "bytes "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, v0, Lcom/dragstreets/shell/SignedModule;->bytes:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "Content-Range"

    invoke-virtual {v5, v7}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_8

    if-eqz v6, :cond_4

    .line 134
    move-object v6, v5

    :try_start_1
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    move-object v7, v6

    :try_start_2
    new-instance v6, Ljava/io/FileOutputStream;

    const/4 v8, 0x1

    invoke-direct {v6, v2, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    sub-long v8, v3, v10

    add-long/2addr v8, v14

    :try_start_3
    iget-wide v12, v0, Lcom/dragstreets/shell/SignedModule;->bytes:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-object/from16 v16, v7

    move-wide v7, v8

    move-object/from16 v9, p3

    :try_start_4
    invoke-static/range {v5 .. v13}, Lcom/dragstreets/shell/ModuleStore;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;JLcom/dragstreets/shell/ModuleStore$Progress;JJ)V

    invoke-virtual {v6}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/FileDescriptor;->sync()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v5, :cond_2

    :try_start_6
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_7

    .line 135
    :cond_2
    invoke-virtual/range {v16 .. v16}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 136
    add-long v10, v3, v14

    .line 137
    goto/16 :goto_1

    .line 134
    :catchall_0
    move-exception v0

    goto :goto_4

    :catchall_1
    move-exception v0

    goto :goto_2

    :catchall_2
    move-exception v0

    move-object/from16 v16, v7

    :goto_2
    move-object v2, v0

    :try_start_7
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception v0

    :try_start_8
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :catchall_4
    move-exception v0

    move-object/from16 v16, v7

    :goto_4
    move-object v2, v0

    if-eqz v5, :cond_3

    :try_start_9
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    goto :goto_5

    :catchall_5
    move-exception v0

    :try_start_a
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_5
    throw v2

    .line 135
    :catchall_6
    move-exception v0

    move-object/from16 v16, v6

    goto :goto_6

    .line 132
    :cond_4
    move-object/from16 v16, v5

    new-instance v0, Ljava/io/IOException;

    const-string v2, "Invalid module range response"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_7

    .line 135
    :catchall_7
    move-exception v0

    goto :goto_6

    :catchall_8
    move-exception v0

    move-object/from16 v16, v5

    :goto_6
    invoke-virtual/range {v16 .. v16}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0

    .line 138
    :cond_5
    :try_start_b
    invoke-virtual {v0, v2}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_b .. :try_end_b} :catch_0

    .line 141
    new-instance v3, Ljava/io/File;

    iget-object v4, v1, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".verified"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v3}, Lcom/dragstreets/shell/ModuleStore;->discard(Ljava/io/File;)V

    .line 142
    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    :try_start_c
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_b

    .line 143
    :try_start_d
    invoke-virtual {v3}, Ljava/io/File;->setReadOnly()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 144
    iget-wide v8, v0, Lcom/dragstreets/shell/SignedModule;->bytes:J

    iget-wide v13, v0, Lcom/dragstreets/shell/SignedModule;->bytes:J

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    invoke-static/range {v6 .. v14}, Lcom/dragstreets/shell/ModuleStore;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;JLcom/dragstreets/shell/ModuleStore$Progress;JJ)V

    invoke-virtual {v7}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/FileDescriptor;->sync()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_9

    .line 145
    :try_start_e
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_b

    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 146
    invoke-virtual {v0, v3}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V

    .line 147
    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 148
    invoke-static {v2}, Lcom/dragstreets/shell/ModuleStore;->discard(Ljava/io/File;)V

    .line 149
    return-void

    .line 147
    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Cannot commit verified module"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 143
    :cond_7
    :try_start_f
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Cannot protect verified module"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 142
    :catchall_9
    move-exception v0

    move-object v2, v0

    :try_start_10
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_a

    goto :goto_7

    :catchall_a
    move-exception v0

    :try_start_11
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_7
    throw v2
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_b

    :catchall_b
    move-exception v0

    move-object v2, v0

    :try_start_12
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_c

    goto :goto_8

    :catchall_c
    move-exception v0

    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_8
    throw v2

    .line 138
    :catch_0
    move-exception v0

    goto :goto_9

    :catch_1
    move-exception v0

    :goto_9
    invoke-static {v2}, Lcom/dragstreets/shell/ModuleStore;->discard(Ljava/io/File;)V

    throw v0
.end method

.method private envelope(Lcom/dragstreets/shell/SignedModule;)[B
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 34
    const-string v0, "active.dsm"

    const-string v1, "healthy.dsm"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_1

    aget-object v2, v0, v1

    .line 35
    :try_start_0
    invoke-virtual {p0, v2}, Lcom/dragstreets/shell/ModuleStore;->metadata(Ljava/lang/String;)[B

    move-result-object v2

    iget-object v3, p0, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;

    invoke-static {v2, v3}, Lcom/dragstreets/shell/SignedModule;->verify([BLjava/security/PublicKey;)Lcom/dragstreets/shell/SignedModule;

    move-result-object v3

    .line 36
    iget-wide v4, v3, Lcom/dragstreets/shell/SignedModule;->version:J

    iget-wide v6, p1, Lcom/dragstreets/shell/SignedModule;->version:J

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    iget-object v3, v3, Lcom/dragstreets/shell/SignedModule;->sha256:[B

    iget-object v4, p1, Lcom/dragstreets/shell/SignedModule;->sha256:[B

    invoke-static {v3, v4}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_0

    return-object v2

    .line 37
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    :cond_0
    :goto_1
    nop

    .line 34
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 38
    :cond_1
    invoke-direct {p0}, Lcom/dragstreets/shell/ModuleStore;->baselineMetadata()[B

    move-result-object v0

    iget-object v1, p0, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;

    invoke-static {v0, v1}, Lcom/dragstreets/shell/SignedModule;->verify([BLjava/security/PublicKey;)Lcom/dragstreets/shell/SignedModule;

    move-result-object v1

    .line 39
    iget-wide v2, v1, Lcom/dragstreets/shell/SignedModule;->version:J

    iget-wide v4, p1, Lcom/dragstreets/shell/SignedModule;->version:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_2

    iget-object v1, v1, Lcom/dragstreets/shell/SignedModule;->sha256:[B

    iget-object p1, p1, Lcom/dragstreets/shell/SignedModule;->sha256:[B

    invoke-static {v1, p1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 40
    return-object v0

    .line 39
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Selected module metadata unavailable"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private fetch(Ljava/lang/String;)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    invoke-static {p1}, Lcom/dragstreets/shell/ModuleStore;->open(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object p1

    .line 116
    :try_start_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/16 v1, 0x2000

    invoke-static {v0, v1}, Lcom/dragstreets/shell/ModuleStore;->readLimited(Ljava/io/InputStream;I)[B

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Module manifest unavailable"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0
.end method

.method private static open(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object p0

    const-string v1, "https"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 120
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 121
    const/16 v0, 0x2710

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v0, 0x4e20

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v0, "User-Agent"

    const-string v1, "DragStreetsShell/1"

    invoke-virtual {p0, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Accept-Encoding"

    const-string v1, "identity"

    invoke-virtual {p0, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    .line 119
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "HTTPS required"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static readLimited(Ljava/io/InputStream;I)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/16 v1, 0x1000

    :try_start_1
    new-array v1, v1, [B

    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v2

    if-gt v3, p1, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v1, "Input limit exceeded"

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_2
    return-object p1

    :catchall_0
    move-exception p1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz p0, :cond_3

    :try_start_5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw p1
.end method


# virtual methods
.method active()Lcom/dragstreets/shell/SignedModule;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 71
    invoke-virtual {p0}, Lcom/dragstreets/shell/ModuleStore;->baseline()Lcom/dragstreets/shell/SignedModule;

    move-result-object v0

    .line 72
    invoke-direct {p0}, Lcom/dragstreets/shell/ModuleStore;->baselineMetadata()[B

    move-result-object v1

    .line 75
    const-string v2, "healthy.dsm"

    const-string v3, "active.dsm"

    filled-new-array {v3, v2}, [Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    const/4 v6, 0x2

    if-ge v5, v6, :cond_2

    aget-object v6, v2, v5

    .line 76
    :try_start_0
    invoke-virtual {p0, v6}, Lcom/dragstreets/shell/ModuleStore;->metadata(Ljava/lang/String;)[B

    move-result-object v6

    iget-object v7, p0, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;

    invoke-static {v6, v7}, Lcom/dragstreets/shell/SignedModule;->verify([BLjava/security/PublicKey;)Lcom/dragstreets/shell/SignedModule;

    move-result-object v7

    .line 77
    iget-wide v8, v7, Lcom/dragstreets/shell/SignedModule;->version:J

    iget-wide v10, v0, Lcom/dragstreets/shell/SignedModule;->version:J

    cmp-long v8, v8, v10

    if-ltz v8, :cond_1

    iget-object v8, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    const-string v9, "module-policy"

    invoke-virtual {v8, v9, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "rejected-"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-wide v10, v7, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_0

    goto :goto_1

    .line 78
    :cond_0
    invoke-virtual {p0, v7}, Lcom/dragstreets/shell/ModuleStore;->file(Lcom/dragstreets/shell/SignedModule;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v6

    move-object v0, v7

    goto :goto_2

    .line 79
    :catch_0
    move-exception v6

    goto :goto_1

    :catch_1
    move-exception v6

    .line 75
    :cond_1
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 80
    :cond_2
    :goto_2
    invoke-virtual {p0, v3, v1}, Lcom/dragstreets/shell/ModuleStore;->put(Ljava/lang/String;[B)V

    .line 82
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    const-string v3, "pending"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/dragstreets/shell/ModuleStore;->discard(Ljava/io/File;)V

    .line 83
    return-object v0
.end method

.method baseline()Lcom/dragstreets/shell/SignedModule;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 56
    invoke-direct {p0}, Lcom/dragstreets/shell/ModuleStore;->baselineMetadata()[B

    move-result-object v0

    .line 57
    iget-object v1, p0, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;

    invoke-static {v0, v1}, Lcom/dragstreets/shell/SignedModule;->verify([BLjava/security/PublicKey;)Lcom/dragstreets/shell/SignedModule;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/dragstreets/shell/ModuleStore;->file(Lcom/dragstreets/shell/SignedModule;)Ljava/io/File;

    move-result-object v2

    .line 58
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {v1, v2}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    :goto_0
    invoke-static {v2}, Lcom/dragstreets/shell/ModuleStore;->discard(Ljava/io/File;)V

    .line 59
    :cond_0
    :goto_1
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_7

    .line 60
    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    const-string v4, "baseline.part"

    invoke-direct {v0, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 61
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_2

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot clear interrupted baseline copy"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_2
    :goto_2
    iget-object v3, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "shell/baseline.jar"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    :try_start_1
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 63
    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->setReadOnly()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 64
    iget-wide v7, v1, Lcom/dragstreets/shell/SignedModule;->bytes:J

    iget-wide v12, v1, Lcom/dragstreets/shell/SignedModule;->bytes:J

    const/4 v9, 0x0

    const-wide/16 v10, 0x0

    invoke-static/range {v5 .. v13}, Lcom/dragstreets/shell/ModuleStore;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;JLcom/dragstreets/shell/ModuleStore$Progress;JJ)V

    invoke-virtual {v6}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/FileDescriptor;->sync()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    :try_start_3
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 66
    :cond_3
    invoke-virtual {v1, v0}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V

    invoke-virtual {v0, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_5

    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot commit baseline module"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_5
    :try_start_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot protect baseline code"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 62
    :catchall_0
    move-exception v0

    move-object v1, v0

    :try_start_5
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v0

    :try_start_6
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception v0

    move-object v1, v0

    if-eqz v5, :cond_6

    :try_start_7
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_4

    :catchall_3
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_4
    throw v1

    .line 68
    :cond_7
    :goto_5
    invoke-virtual {v1, v2}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V

    return-object v1
.end method

.method crashed(Lcom/dragstreets/shell/SignedModule;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    const-string v1, "module-policy"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "crashed"

    iget-wide v2, p1, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "rejected-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p1, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 50
    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 51
    return-void

    .line 50
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Cannot record startup crash"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method file(Lcom/dragstreets/shell/SignedModule;)Ljava/io/File;
    .locals 5

    .line 26
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v3, p1, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object p1, p1, Lcom/dragstreets/shell/SignedModule;->sha256:[B

    invoke-static {p1}, Lcom/dragstreets/shell/SignedModule;->hex([B)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, ".jar"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method healthy(Lcom/dragstreets/shell/SignedModule;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 43
    const-string v0, "healthy.dsm"

    invoke-direct {p0, p1}, Lcom/dragstreets/shell/ModuleStore;->envelope(Lcom/dragstreets/shell/SignedModule;)[B

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/dragstreets/shell/ModuleStore;->put(Ljava/lang/String;[B)V

    .line 44
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    const-string v1, "pending"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Cannot confirm module startup"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 45
    :cond_1
    :goto_0
    return-void
.end method

.method latest()Lcom/dragstreets/shell/SignedModule;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 103
    invoke-virtual {p0}, Lcom/dragstreets/shell/ModuleStore;->latestEnvelope()[B

    move-result-object v0

    iget-object v1, p0, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;

    invoke-static {v0, v1}, Lcom/dragstreets/shell/SignedModule;->verify([BLjava/security/PublicKey;)Lcom/dragstreets/shell/SignedModule;

    move-result-object v0

    return-object v0
.end method

.method latestEnvelope()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/dragstreets/shell/ModuleStore;->origin:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/v1/modules/stable.dsm"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/dragstreets/shell/ModuleStore;->fetch(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method metadata(Ljava/lang/String;)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    new-instance v0, Landroid/util/AtomicFile;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Landroid/util/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object p1

    const/16 v0, 0x2000

    invoke-static {p1, v0}, Lcom/dragstreets/shell/ModuleStore;->readLimited(Ljava/io/InputStream;I)[B

    move-result-object p1

    return-object p1
.end method

.method put(Ljava/lang/String;[B)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 28
    new-instance v0, Landroid/util/AtomicFile;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    .line 29
    :try_start_0
    invoke-virtual {v0}, Landroid/util/AtomicFile;->startWrite()Ljava/io/FileOutputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    invoke-virtual {p1, p2}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v0, p1}, Landroid/util/AtomicFile;->finishWrite(Ljava/io/FileOutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 30
    return-void

    .line 29
    :catch_0
    move-exception p2

    goto :goto_0

    :catch_1
    move-exception p2

    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_0

    invoke-virtual {v0, p1}, Landroid/util/AtomicFile;->failWrite(Ljava/io/FileOutputStream;)V

    :cond_0
    throw p2
.end method

.method read(Ljava/io/File;)Lcom/dragstreets/shell/SignedModule;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 p1, 0x2000

    invoke-static {v0, p1}, Lcom/dragstreets/shell/ModuleStore;->readLimited(Ljava/io/InputStream;I)[B

    move-result-object p1

    iget-object v0, p0, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;

    invoke-static {p1, v0}, Lcom/dragstreets/shell/SignedModule;->verify([BLjava/security/PublicKey;)Lcom/dragstreets/shell/SignedModule;

    move-result-object p1

    return-object p1
.end method

.method recovery()Lcom/dragstreets/shell/SignedModule;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 105
    const-string v0, "active.dsm"

    invoke-virtual {p0}, Lcom/dragstreets/shell/ModuleStore;->baseline()Lcom/dragstreets/shell/SignedModule;

    move-result-object v1

    .line 107
    :try_start_0
    const-string v2, "healthy.dsm"

    invoke-virtual {p0, v2}, Lcom/dragstreets/shell/ModuleStore;->metadata(Ljava/lang/String;)[B

    move-result-object v2

    iget-object v3, p0, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;

    invoke-static {v2, v3}, Lcom/dragstreets/shell/SignedModule;->verify([BLjava/security/PublicKey;)Lcom/dragstreets/shell/SignedModule;

    move-result-object v3

    .line 108
    iget-wide v4, v3, Lcom/dragstreets/shell/SignedModule;->version:J

    iget-wide v6, v1, Lcom/dragstreets/shell/SignedModule;->version:J

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    iget-object v4, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    const-string v5, "module-policy"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "rejected-"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v7, v3, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-virtual {v5, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_0

    .line 109
    invoke-virtual {p0, v3}, Lcom/dragstreets/shell/ModuleStore;->file(Lcom/dragstreets/shell/SignedModule;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V

    invoke-virtual {p0, v0, v2}, Lcom/dragstreets/shell/ModuleStore;->put(Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 111
    :catch_0
    move-exception v2

    goto :goto_0

    :catch_1
    move-exception v2

    :cond_0
    :goto_0
    nop

    .line 112
    invoke-direct {p0}, Lcom/dragstreets/shell/ModuleStore;->baselineMetadata()[B

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/dragstreets/shell/ModuleStore;->put(Ljava/lang/String;[B)V

    return-object v1
.end method

.method update(Lcom/dragstreets/shell/SignedModule;Lcom/dragstreets/shell/ModuleStore$Progress;)Lcom/dragstreets/shell/SignedModule;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 86
    const-string v0, "active.dsm"

    invoke-virtual {p0}, Lcom/dragstreets/shell/ModuleStore;->latestEnvelope()[B

    move-result-object v1

    .line 87
    iget-object v2, p0, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;

    invoke-static {v1, v2}, Lcom/dragstreets/shell/SignedModule;->verify([BLjava/security/PublicKey;)Lcom/dragstreets/shell/SignedModule;

    move-result-object v2

    .line 88
    iget-object v3, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    const-string v4, "module-policy"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    iget-wide v6, p1, Lcom/dragstreets/shell/SignedModule;->version:J

    const-string v8, "highest"

    invoke-interface {v3, v8, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 89
    iget-object v3, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "rejected-"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-wide v10, v2, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 90
    iget-wide v9, v2, Lcom/dragstreets/shell/SignedModule;->version:J

    iget-wide v11, p1, Lcom/dragstreets/shell/SignedModule;->version:J

    cmp-long v9, v9, v11

    if-lez v9, :cond_4

    iget-wide v9, v2, Lcom/dragstreets/shell/SignedModule;->version:J

    cmp-long v6, v9, v6

    if-ltz v6, :cond_4

    if-eqz v3, :cond_0

    goto :goto_3

    .line 91
    :cond_0
    invoke-virtual {p0, v2}, Lcom/dragstreets/shell/ModuleStore;->file(Lcom/dragstreets/shell/SignedModule;)Ljava/io/File;

    move-result-object p1

    .line 92
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    :try_start_0
    invoke-virtual {v2, p1}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    goto :goto_0

    :catch_1
    move-exception v3

    :goto_0
    invoke-static {p1}, Lcom/dragstreets/shell/ModuleStore;->discard(Ljava/io/File;)V

    .line 93
    :cond_1
    :goto_1
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-direct {p0, v2, p1, p2}, Lcom/dragstreets/shell/ModuleStore;->download(Lcom/dragstreets/shell/SignedModule;Ljava/io/File;Lcom/dragstreets/shell/ModuleStore$Progress;)V

    .line 94
    :cond_2
    invoke-virtual {v2, p1}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V

    .line 97
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/dragstreets/shell/ModuleStore;->metadata(Ljava/lang/String;)[B

    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_2

    :catch_2
    move-exception p1

    iget-object p1, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    const-string p2, "shell/baseline.dsm"

    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    const/16 p2, 0x2000

    invoke-static {p1, p2}, Lcom/dragstreets/shell/ModuleStore;->readLimited(Ljava/io/InputStream;I)[B

    move-result-object p1

    .line 98
    :goto_2
    const-string p2, "previous.dsm"

    invoke-virtual {p0, p2, p1}, Lcom/dragstreets/shell/ModuleStore;->put(Ljava/lang/String;[B)V

    invoke-virtual {p0, v0, v1}, Lcom/dragstreets/shell/ModuleStore;->put(Ljava/lang/String;[B)V

    .line 99
    iget-object p1, p0, Lcom/dragstreets/shell/ModuleStore;->context:Landroid/content/Context;

    invoke-virtual {p1, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-wide v0, v2, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-interface {p1, v8, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 100
    return-object v2

    .line 99
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Module policy save failed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 90
    :cond_4
    :goto_3
    return-object p1
.end method
