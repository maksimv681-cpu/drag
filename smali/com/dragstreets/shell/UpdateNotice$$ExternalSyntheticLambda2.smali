.class public final synthetic Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/dragstreets/shell/SignedModule;


# direct methods
.method public synthetic constructor <init>(Lcom/dragstreets/shell/SignedModule;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda2;->f$0:Lcom/dragstreets/shell/SignedModule;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/dragstreets/shell/UpdateNotice$$ExternalSyntheticLambda2;->f$0:Lcom/dragstreets/shell/SignedModule;

    invoke-static {v0}, Lcom/dragstreets/shell/UpdateNotice;->lambda$frame$1(Lcom/dragstreets/shell/SignedModule;)V

    return-void
.end method
