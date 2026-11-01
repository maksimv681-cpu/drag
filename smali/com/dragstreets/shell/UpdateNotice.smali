.class final Lcom/dragstreets/shell/UpdateNotice;
.super Ljava/lang/Object;
.source "UpdateNotice.java"


# static fields
.field private static announced:J

.field private static final checking:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static volatile foreground:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile frameAt:J

.field private static lastCheck:J

.field private static final main:Landroid/os/Handler;

.field private static volatile stage:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 10
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/dragstreets/shell/UpdateNotice;->foreground:Ljava/lang/ref/WeakReference;

    .line 11
    const-string v0, ""

    sput-object v0, Lcom/dragstreets/shell/UpdateNotice;->stage:Ljava/lang/String;

    .line 14
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    sput-object v0, Lcom/dragstreets/shell/UpdateNotice;->checking:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 15
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/dragstreets/shell/UpdateNotice;->main:Landroid/os/Handler;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static display(Landroid/app/Activity;)V
    .locals 9

    .line 47
    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    invoke-static {}, Lcom/dragstreets/shell/ModuleRuntime;->loader()Ljava/lang/ClassLoader;

    move-result-object v3

    const-string v4, "mobi.square.sr.android.DragStreetsUpdateDialog"

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "show"

    const-class v5, Landroid/app/Activity;

    const-class v6, Ljava/lang/String;

    const-class v7, Ljava/lang/String;

    const-class v8, Ljava/lang/String;

    filled-new-array {v5, v6, v7, v8}, [Ljava/lang/Class;

    move-result-object v5

    .line 48
    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 49
    invoke-static {v2}, Lcom/dragstreets/shell/ShellText;->update(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1}, Lcom/dragstreets/shell/ShellText;->update(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0}, Lcom/dragstreets/shell/ShellText;->update(I)Ljava/lang/String;

    move-result-object v6

    filled-new-array {p0, v4, v5, v6}, [Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    goto :goto_0

    .line 50
    :catch_0
    move-exception v3

    .line 51
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Lcom/dragstreets/shell/ShellText;->update(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-static {v1}, Lcom/dragstreets/shell/ShellText;->update(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 52
    invoke-static {v0}, Lcom/dragstreets/shell/ShellText;->update(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 54
    :goto_0
    return-void
.end method

.method static declared-synchronized frame(Ljava/lang/String;)V
    .locals 5

    const-class v0, Lcom/dragstreets/shell/UpdateNotice;

    monitor-enter v0

    .line 22
    :try_start_0
    sput-object p0, Lcom/dragstreets/shell/UpdateNotice;->stage:Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    sput-wide v1, Lcom/dragstreets/shell/UpdateNotice;->frameAt:J

    .line 23
    invoke-static {}, Lcom/dragstreets/shell/UpdateNotice;->safe()Z

    move-result p0

    if-eqz p0, :cond_1

    sget-object p0, Lcom/dragstreets/shell/UpdateNotice;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_1

    sget-wide v1, Lcom/dragstreets/shell/UpdateNotice;->frameAt:J

    sget-wide v3, Lcom/dragstreets/shell/UpdateNotice;->lastCheck:J

    sub-long/2addr v1, v3

    const-wide/32 v3, 0xea60

    cmp-long p0, v1, v3

    if-ltz p0, :cond_1

    sget-object p0, Lcom/dragstreets/shell/UpdateNotice;->checking:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    .line 24
    :cond_0
    sget-wide v1, Lcom/dragstreets/shell/UpdateNotice;->frameAt:J

    sput-wide v1, Lcom/dragstreets/shell/UpdateNotice;->lastCheck:J

    .line 25
    new-instance p0, Ljava/lang/Thread;

    new-instance v1, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda1;-><init>()V

    const-string v2, "DragStreetsUpdateNotice"

    invoke-direct {p0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 31
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    monitor-exit v0

    return-void

    .line 23
    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    .line 21
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method static synthetic lambda$display$0(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 52
    return-void
.end method

.method static synthetic lambda$frame$0()V
    .locals 6

    .line 27
    const/4 v0, 0x0

    :try_start_0
    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    invoke-virtual {v1}, Lcom/dragstreets/shell/ModuleStore;->latest()Lcom/dragstreets/shell/SignedModule;

    move-result-object v1

    .line 28
    iget-wide v2, v1, Lcom/dragstreets/shell/SignedModule;->version:J

    sget-object v4, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;

    iget-wide v4, v4, Lcom/dragstreets/shell/SignedModule;->version:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    sget-object v2, Lcom/dragstreets/shell/UpdateNotice;->main:Landroid/os/Handler;

    new-instance v3, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda2;

    invoke-direct {v3, v1}, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda2;-><init>(Lcom/dragstreets/shell/SignedModule;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :cond_0
    :goto_0
    sget-object v1, Lcom/dragstreets/shell/UpdateNotice;->checking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_1

    :catchall_0
    move-exception v1

    goto :goto_2

    .line 29
    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "DS-MODULE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Background update check deferred: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 31
    :goto_1
    return-void

    .line 30
    :goto_2
    sget-object v2, Lcom/dragstreets/shell/UpdateNotice;->checking:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    throw v1
.end method

.method static synthetic lambda$frame$1(Lcom/dragstreets/shell/SignedModule;)V
    .locals 2

    .line 28
    iget-wide v0, p0, Lcom/dragstreets/shell/SignedModule;->version:J

    invoke-static {v0, v1}, Lcom/dragstreets/shell/UpdateNotice;->show(J)V

    return-void
.end method

.method static synthetic lambda$preview$0()V
    .locals 2

    .line 41
    sget-object v0, Lcom/dragstreets/shell/UpdateNotice;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Lcom/dragstreets/shell/UpdateNotice;->display(Landroid/app/Activity;)V

    .line 42
    :cond_0
    return-void
.end method

.method static paused(Landroid/app/Activity;)V
    .locals 1

    .line 19
    sget-object v0, Lcom/dragstreets/shell/UpdateNotice;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    new-instance p0, Ljava/lang/ref/WeakReference;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object p0, Lcom/dragstreets/shell/UpdateNotice;->foreground:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method static preview()V
    .locals 2

    .line 40
    sget-object v0, Lcom/dragstreets/shell/UpdateNotice;->main:Landroid/os/Handler;

    new-instance v1, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 42
    return-void
.end method

.method static resumed(Landroid/app/Activity;)V
    .locals 2

    .line 17
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

    sput-object v0, Lcom/dragstreets/shell/UpdateNotice;->foreground:Ljava/lang/ref/WeakReference;

    .line 18
    :cond_0
    return-void
.end method

.method private static safe()Z
    .locals 4

    .line 20
    sget-object v0, Lcom/dragstreets/shell/UpdateNotice;->stage:Ljava/lang/String;

    const-string v1, "FI0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/dragstreets/shell/UpdateNotice;->stage:Ljava/lang/String;

    const-string v1, "pj1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sget-wide v2, Lcom/dragstreets/shell/UpdateNotice;->frameAt:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x2710

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static show(J)V
    .locals 3

    .line 34
    sget-object v0, Lcom/dragstreets/shell/UpdateNotice;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 35
    invoke-static {}, Lcom/dragstreets/shell/UpdateNotice;->safe()Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_1

    sget-wide v1, Lcom/dragstreets/shell/UpdateNotice;->announced:J

    cmp-long v1, p0, v1

    if-gtz v1, :cond_0

    goto :goto_0

    .line 36
    :cond_0
    sput-wide p0, Lcom/dragstreets/shell/UpdateNotice;->announced:J

    .line 37
    invoke-static {v0}, Lcom/dragstreets/shell/UpdateNotice;->display(Landroid/app/Activity;)V

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Update notice shown for signed release "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "DS-MODULE"

    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    return-void

    .line 35
    :cond_1
    :goto_0
    return-void
.end method
