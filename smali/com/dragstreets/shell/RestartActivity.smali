.class public final Lcom/dragstreets/shell/RestartActivity;
.super Landroid/app/Activity;
.source "RestartActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 9

    .line 10
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 11
    invoke-virtual {p0}, Lcom/dragstreets/shell/RestartActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const v0, -0xf5efe6

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 12
    invoke-virtual {p0}, Lcom/dragstreets/shell/RestartActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "previousPid"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 13
    const-string p1, "activity"

    invoke-virtual {p0, p1}, Lcom/dragstreets/shell/RestartActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Landroid/app/ActivityManager;

    .line 14
    nop

    .line 15
    const/4 p1, 0x0

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v4}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 16
    iget v2, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v2, v5, :cond_0

    iget v2, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->uid:I

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    if-ne v2, v3, :cond_0

    invoke-virtual {p0}, Lcom/dragstreets/shell/RestartActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v1, v1, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    .line 17
    :cond_0
    goto :goto_0

    .line 18
    :cond_1
    if-lez v5, :cond_3

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    if-eq v5, v0, :cond_3

    if-nez p1, :cond_2

    goto :goto_1

    .line 21
    :cond_2
    invoke-static {v5}, Landroid/os/Process;->killProcess(I)V

    .line 22
    new-instance v8, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v8, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    const-wide/16 v2, 0xbb8

    add-long v6, v0, v2

    .line 23
    new-instance v2, Lcom/dragstreets/shell/RestartActivity$1;

    move-object v3, p0

    invoke-direct/range {v2 .. v8}, Lcom/dragstreets/shell/RestartActivity$1;-><init>(Lcom/dragstreets/shell/RestartActivity;Landroid/app/ActivityManager;IJLandroid/os/Handler;)V

    const-wide/16 v0, 0x96

    invoke-virtual {v8, v2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 33
    return-void

    .line 19
    :cond_3
    :goto_1
    const-string p1, "DS-MODULE"

    const-string v0, "Cannot identify finished game process for restart"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/dragstreets/shell/RestartActivity;->finish()V

    return-void
.end method
