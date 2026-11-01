.class public final Lcom/dragstreets/shell/ShellApplication;
.super Landroid/app/Application;
.source "ShellApplication.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method static synthetic lambda$onCreate$0(Ljava/lang/Thread$UncaughtExceptionHandler;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1

    .line 19
    :try_start_0
    invoke-static {}, Lcom/dragstreets/shell/ModuleRuntime;->recordStartupCrash()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 20
    :goto_0
    if-eqz p0, :cond_0

    invoke-interface {p0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 21
    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p0

    invoke-static {p0}, Landroid/os/Process;->killProcess(I)V

    const/16 p0, 0xa

    invoke-static {p0}, Ljava/lang/System;->exit(I)V

    .line 22
    :goto_1
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 0

    .line 25
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 26
    sput-object p0, Lcom/dragstreets/shell/ModuleRuntime;->context:Landroid/content/Context;

    .line 28
    return-void
.end method

.method public onCreate()V
    .locals 2

    .line 7
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 8
    new-instance v0, Lcom/dragstreets/shell/ShellApplication$1;

    invoke-direct {v0, p0}, Lcom/dragstreets/shell/ShellApplication$1;-><init>(Lcom/dragstreets/shell/ShellApplication;)V

    invoke-virtual {p0, v0}, Lcom/dragstreets/shell/ShellApplication;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 17
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 18
    new-instance v1, Lcom/dragstreets/shell/ShellApplication$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0}, Lcom/dragstreets/shell/ShellApplication$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 23
    return-void
.end method
