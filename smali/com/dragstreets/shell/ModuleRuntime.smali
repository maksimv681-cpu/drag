.class public final Lcom/dragstreets/shell/ModuleRuntime;
.super Ljava/lang/Object;
.source "ModuleRuntime.java"


# static fields
.field static context:Landroid/content/Context;

.field static game:Landroid/app/Application;

.field private static gameActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile launching:Z

.field static volatile loader:Ljava/lang/ClassLoader;

.field private static screenSince:J

.field static selected:Lcom/dragstreets/shell/SignedModule;

.field private static startupScreen:Ljava/lang/String;

.field static store:Lcom/dragstreets/shell/ModuleStore;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 11
    const-string v0, ""

    sput-object v0, Lcom/dragstreets/shell/ModuleRuntime;->startupScreen:Ljava/lang/String;

    .line 13
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/dragstreets/shell/ModuleRuntime;->gameActivity:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activityCreated(Landroid/app/Activity;)V
    .locals 2

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mobi.square.sr.android.AndroidLauncher"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/dragstreets/shell/ModuleRuntime;->gameActivity:Ljava/lang/ref/WeakReference;

    .line 16
    :cond_0
    return-void
.end method

.method static activityDestroyed(Landroid/app/Activity;)V
    .locals 1

    .line 17
    sget-object v0, Lcom/dragstreets/shell/ModuleRuntime;->gameActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    new-instance p0, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Lcom/dragstreets/shell/ModuleRuntime;->gameActivity:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method static declared-synchronized loader()Ljava/lang/ClassLoader;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/dragstreets/shell/ModuleRuntime;

    monitor-enter v0

    .line 34
    :try_start_0
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->loader:Ljava/lang/ClassLoader;

    if-nez v1, :cond_1

    new-instance v1, Lcom/dragstreets/shell/ModuleStore;

    sget-object v2, Lcom/dragstreets/shell/ModuleRuntime;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/dragstreets/shell/ModuleStore;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_0

    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->context:Landroid/content/Context;

    sget-object v2, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    invoke-static {v1, v2}, Lcom/dragstreets/shell/NativeExitProbe;->inspect(Landroid/content/Context;Lcom/dragstreets/shell/ModuleStore;)V

    :cond_0
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    invoke-virtual {v1}, Lcom/dragstreets/shell/ModuleStore;->active()Lcom/dragstreets/shell/SignedModule;

    move-result-object v1

    invoke-static {v1}, Lcom/dragstreets/shell/ModuleRuntime;->select(Lcom/dragstreets/shell/SignedModule;)V

    :cond_1
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->loader:Ljava/lang/ClassLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 34
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static declared-synchronized markHealthy()V
    .locals 5

    const-class v0, Lcom/dragstreets/shell/ModuleRuntime;

    monitor-enter v0

    .line 72
    :try_start_0
    sget-boolean v1, Lcom/dragstreets/shell/ModuleRuntime;->launching:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->game:Landroid/app/Application;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 73
    :try_start_1
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    sget-object v2, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;

    invoke-virtual {v1, v2}, Lcom/dragstreets/shell/ModuleStore;->healthy(Lcom/dragstreets/shell/SignedModule;)V

    const/4 v1, 0x0

    sput-boolean v1, Lcom/dragstreets/shell/ModuleRuntime;->launching:Z

    const-string v1, "DS-MODULE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Module startup confirmed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;

    iget-wide v3, v3, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 74
    :catch_0
    move-exception v1

    :try_start_2
    const-string v2, "DS-MODULE"

    const-string v3, "Could not confirm healthy module"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    nop

    .line 75
    :cond_0
    monitor-exit v0

    return-void

    .line 71
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public static declared-synchronized onGameFrame(Ljava/lang/String;)V
    .locals 5

    const-class v0, Lcom/dragstreets/shell/ModuleRuntime;

    monitor-enter v0

    .line 65
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 66
    sget-object v3, Lcom/dragstreets/shell/ModuleRuntime;->startupScreen:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sput-object p0, Lcom/dragstreets/shell/ModuleRuntime;->startupScreen:Ljava/lang/String;

    sput-wide v1, Lcom/dragstreets/shell/ModuleRuntime;->screenSince:J

    .line 67
    :cond_0
    const-string v3, "pj1"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "FI0"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_1
    sget-wide v3, Lcom/dragstreets/shell/ModuleRuntime;->screenSince:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x1388

    cmp-long v1, v1, v3

    if-ltz v1, :cond_2

    invoke-static {}, Lcom/dragstreets/shell/ModuleRuntime;->markHealthy()V

    .line 68
    :cond_2
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    if-eqz v1, :cond_3

    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->game:Landroid/app/Application;

    if-eqz v1, :cond_3

    invoke-static {p0}, Lcom/dragstreets/shell/UpdateNotice;->frame(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    :cond_3
    monitor-exit v0

    return-void

    .line 64
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static previewUpdateNotice()V
    .locals 0

    .line 32
    invoke-static {}, Lcom/dragstreets/shell/UpdateNotice;->preview()V

    return-void
.end method

.method static declared-synchronized recordStartupCrash()V
    .locals 5

    const-class v0, Lcom/dragstreets/shell/ModuleRuntime;

    monitor-enter v0

    .line 58
    :try_start_0
    sget-boolean v1, Lcom/dragstreets/shell/ModuleRuntime;->launching:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 59
    :try_start_1
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    sget-object v2, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;

    invoke-virtual {v1, v2}, Lcom/dragstreets/shell/ModuleStore;->crashed(Lcom/dragstreets/shell/SignedModule;)V

    const-string v1, "DS-MODULE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Recorded startup exception for module "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;

    iget-wide v3, v3, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 60
    :catch_0
    move-exception v1

    :try_start_2
    const-string v2, "DS-MODULE"

    const-string v3, "Could not record startup failure"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    nop

    .line 61
    :cond_0
    monitor-exit v0

    return-void

    .line 57
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method static resumeOrRestart(Landroid/app/Activity;)Z
    .locals 4

    .line 19
    sget-object v0, Lcom/dragstreets/shell/ModuleRuntime;->game:Landroid/app/Application;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 20
    :cond_0
    sget-object v0, Lcom/dragstreets/shell/ModuleRuntime;->gameActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 21
    const-string v2, "DS-MODULE"

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 22
    sget-object v0, Lcom/dragstreets/shell/ModuleRuntime;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "mobi.square.sr.android.AndroidLauncher"

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    const/high16 v0, 0x20020000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 24
    const-string v0, "Resuming existing game activity"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 26
    :cond_1
    const-class v0, Lcom/dragstreets/shell/RestartActivity;

    invoke-virtual {v1, p0, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const-string v0, "previousPid"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 27
    const v0, 0x10008000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 28
    const-string v0, "Restarting finished game in a fresh process"

    invoke-static {v2, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    :goto_0
    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    const/4 p0, 0x1

    return p0
.end method

.method static declared-synchronized select(Lcom/dragstreets/shell/SignedModule;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/dragstreets/shell/ModuleRuntime;

    monitor-enter v0

    .line 37
    :try_start_0
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->game:Landroid/app/Application;

    if-nez v1, :cond_1

    .line 38
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    invoke-virtual {v1, p0}, Lcom/dragstreets/shell/ModuleStore;->file(Lcom/dragstreets/shell/SignedModule;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/dragstreets/shell/SignedModule;->verifyFile(Ljava/io/File;)V

    sput-object p0, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;

    .line 39
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    invoke-virtual {v1, p0}, Lcom/dragstreets/shell/ModuleStore;->file(Lcom/dragstreets/shell/SignedModule;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->setReadOnly()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 40
    new-instance v1, Ldalvik/system/DexClassLoader;

    sget-object v2, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    invoke-virtual {v2, p0}, Lcom/dragstreets/shell/ModuleStore;->file(Lcom/dragstreets/shell/SignedModule;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    sget-object v2, Lcom/dragstreets/shell/ModuleRuntime;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getCodeCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/dragstreets/shell/ModuleRuntime;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    const-class v4, Lcom/dragstreets/shell/ShellApplication;

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-direct {v1, p0, v2, v3, v4}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    sput-object v1, Lcom/dragstreets/shell/ModuleRuntime;->loader:Ljava/lang/ClassLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    monitor-exit v0

    return-void

    .line 39
    :cond_0
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string v1, "Cannot protect selected code"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 37
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot replace code in a running game"

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 36
    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method static start(Landroid/app/Activity;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 43
    sget-object v0, Lcom/dragstreets/shell/ModuleRuntime;->game:Landroid/app/Application;

    if-nez v0, :cond_0

    .line 44
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Lcom/dragstreets/shell/ModuleRuntime;->loader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 45
    new-instance v0, Lcom/dragstreets/shell/ModuleRuntime$1;

    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/dragstreets/shell/ModuleRuntime$1;-><init>(Landroid/content/Context;)V

    .line 46
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    sget-object v2, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;

    iget-wide v2, v2, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    const-string v3, "pending"

    invoke-virtual {v1, v3, v2}, Lcom/dragstreets/shell/ModuleStore;->put(Ljava/lang/String;[B)V

    .line 47
    const/4 v1, 0x1

    sput-boolean v1, Lcom/dragstreets/shell/ModuleRuntime;->launching:Z

    .line 49
    :try_start_0
    invoke-static {}, Lcom/dragstreets/shell/ModuleRuntime;->loader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string v2, "mobi.square.sr.android.AndroidApplication"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/app/Instrumentation;->newApplication(Ljava/lang/Class;Landroid/content/Context;)Landroid/app/Application;

    move-result-object v0

    sput-object v0, Lcom/dragstreets/shell/ModuleRuntime;->game:Landroid/app/Application;

    .line 50
    sget-object v0, Lcom/dragstreets/shell/ModuleRuntime;->game:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->onCreate()V

    .line 51
    const-string v0, "DS-MODULE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Launching signed game module "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;

    iget-wide v2, v2, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mobi.square.sr.android.AndroidLauncher"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    const v1, 0x10008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 54
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    nop

    .line 56
    return-void

    .line 55
    :catch_0
    move-exception p0

    invoke-static {}, Lcom/dragstreets/shell/ModuleRuntime;->recordStartupCrash()V

    throw p0

    .line 43
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Game already started"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static useRecovery()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 62
    invoke-static {}, Lcom/dragstreets/shell/ModuleRuntime;->loader()Ljava/lang/ClassLoader;

    sget-object v0, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    invoke-virtual {v0}, Lcom/dragstreets/shell/ModuleStore;->recovery()Lcom/dragstreets/shell/SignedModule;

    move-result-object v0

    invoke-static {v0}, Lcom/dragstreets/shell/ModuleRuntime;->select(Lcom/dragstreets/shell/SignedModule;)V

    return-void
.end method
