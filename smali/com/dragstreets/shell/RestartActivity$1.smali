.class Lcom/dragstreets/shell/RestartActivity$1;
.super Ljava/lang/Object;
.source "RestartActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dragstreets/shell/RestartActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dragstreets/shell/RestartActivity;

.field final synthetic val$deadline:J

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$manager:Landroid/app/ActivityManager;

.field final synthetic val$previous:I


# direct methods
.method constructor <init>(Lcom/dragstreets/shell/RestartActivity;Landroid/app/ActivityManager;IJLandroid/os/Handler;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 23
    iput-object p2, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$manager:Landroid/app/ActivityManager;

    iput p3, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$previous:I

    iput-wide p4, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$deadline:J

    iput-object p6, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$handler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/dragstreets/shell/RestartActivity$1;->this$0:Lcom/dragstreets/shell/RestartActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 24
    nop

    .line 25
    iget-object v0, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$manager:Landroid/app/ActivityManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$manager:Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$manager:Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 26
    iget v3, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    iget v4, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$previous:I

    if-ne v3, v4, :cond_0

    iget v2, v2, Landroid/app/ActivityManager$RunningAppProcessInfo;->uid:I

    invoke-static {}, Landroid/os/Process;->myUid()I

    move-result v3

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    .line 27
    :cond_0
    goto :goto_0

    .line 28
    :cond_1
    if-eqz v1, :cond_2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$deadline:J

    cmp-long v0, v2, v4

    if-gez v0, :cond_2

    iget-object v0, p0, Lcom/dragstreets/shell/RestartActivity$1;->val$handler:Landroid/os/Handler;

    const-wide/16 v1, 0x64

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 29
    :cond_2
    if-eqz v1, :cond_3

    const-string v0, "DS-MODULE"

    const-string v1, "Finished game process did not exit; reopen the app"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/dragstreets/shell/RestartActivity$1;->this$0:Lcom/dragstreets/shell/RestartActivity;

    invoke-virtual {v0}, Lcom/dragstreets/shell/RestartActivity;->finish()V

    return-void

    .line 30
    :cond_3
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/dragstreets/shell/RestartActivity$1;->this$0:Lcom/dragstreets/shell/RestartActivity;

    const-class v2, Lcom/dragstreets/shell/BootstrapActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x10008000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 31
    iget-object v1, p0, Lcom/dragstreets/shell/RestartActivity$1;->this$0:Lcom/dragstreets/shell/RestartActivity;

    invoke-virtual {v1, v0}, Lcom/dragstreets/shell/RestartActivity;->startActivity(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/dragstreets/shell/RestartActivity$1;->this$0:Lcom/dragstreets/shell/RestartActivity;

    invoke-virtual {v0}, Lcom/dragstreets/shell/RestartActivity;->finish()V

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 32
    return-void
.end method
