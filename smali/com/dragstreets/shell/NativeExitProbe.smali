.class final Lcom/dragstreets/shell/NativeExitProbe;
.super Ljava/lang/Object;
.source "NativeExitProbe.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static inspect(Landroid/content/Context;Lcom/dragstreets/shell/ModuleStore;)V
    .locals 10

    .line 11
    const-string v0, "DS-MODULE"

    new-instance v1, Ljava/io/File;

    iget-object v2, p1, Lcom/dragstreets/shell/ModuleStore;->directory:Ljava/io/File;

    const-string v3, "pending"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 12
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    return-void

    .line 14
    :cond_0
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gtz v4, :cond_1

    return-void

    .line 15
    :cond_1
    const-string v4, "active.dsm"

    invoke-virtual {p1, v4}, Lcom/dragstreets/shell/ModuleStore;->metadata(Ljava/lang/String;)[B

    move-result-object v4

    iget-object v5, p1, Lcom/dragstreets/shell/ModuleStore;->key:Ljava/security/PublicKey;

    invoke-static {v4, v5}, Lcom/dragstreets/shell/SignedModule;->verify([BLjava/security/PublicKey;)Lcom/dragstreets/shell/SignedModule;

    move-result-object v4

    .line 16
    new-instance v5, Ljava/lang/String;

    new-instance v6, Ljava/io/FileInputStream;

    invoke-direct {v6, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 v1, 0x20

    invoke-static {v6, v1}, Lcom/dragstreets/shell/ModuleStore;->readLimited(Ljava/io/InputStream;I)[B

    move-result-object v1

    const-string v6, "UTF-8"

    invoke-direct {v5, v1, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 17
    iget-wide v6, v4, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return-void

    .line 18
    :cond_2
    const-string v1, "activity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 19
    if-nez v1, :cond_3

    return-void

    .line 20
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x5

    invoke-virtual {v1, v5, v6, v7}, Landroid/app/ActivityManager;->getHistoricalProcessExitReasons(Ljava/lang/String;II)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/ApplicationExitInfo;

    .line 21
    invoke-virtual {v5}, Landroid/app/ApplicationExitInfo;->getTimestamp()J

    move-result-wide v8

    cmp-long v6, v8, v2

    if-ltz v6, :cond_4

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Landroid/app/ApplicationExitInfo;->getProcessName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    goto :goto_0

    .line 22
    :cond_5
    invoke-virtual {v5}, Landroid/app/ApplicationExitInfo;->getReason()I

    move-result p0

    if-eq p0, v7, :cond_6

    invoke-virtual {v5}, Landroid/app/ApplicationExitInfo;->getReason()I

    move-result p0

    const/4 v1, 0x4

    if-ne p0, v1, :cond_7

    .line 23
    :cond_6
    invoke-virtual {p1, v4}, Lcom/dragstreets/shell/ModuleStore;->crashed(Lcom/dragstreets/shell/SignedModule;)V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Android confirmed startup crash for module "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget-wide v1, v4, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    :cond_7
    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "Exit reason unavailable"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 28
    :goto_1
    return-void
.end method
