.class Lcom/dragstreets/shell/ShellApplication$1;
.super Ljava/lang/Object;
.source "ShellApplication.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dragstreets/shell/ShellApplication;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dragstreets/shell/ShellApplication;


# direct methods
.method constructor <init>(Lcom/dragstreets/shell/ShellApplication;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 8
    iput-object p1, p0, Lcom/dragstreets/shell/ShellApplication$1;->this$0:Lcom/dragstreets/shell/ShellApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 11
    invoke-static {p1}, Lcom/dragstreets/shell/ModuleRuntime;->activityCreated(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    .line 15
    invoke-static {p1}, Lcom/dragstreets/shell/UpdateNotice;->paused(Landroid/app/Activity;)V

    invoke-static {p1}, Lcom/dragstreets/shell/ModuleRuntime;->activityDestroyed(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    .line 10
    invoke-static {p1}, Lcom/dragstreets/shell/UpdateNotice;->paused(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 0

    .line 9
    invoke-static {p1}, Lcom/dragstreets/shell/UpdateNotice;->resumed(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 14
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    .line 12
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    .line 13
    return-void
.end method
