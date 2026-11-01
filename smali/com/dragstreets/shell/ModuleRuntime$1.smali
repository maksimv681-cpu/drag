.class Lcom/dragstreets/shell/ModuleRuntime$1;
.super Landroid/content/ContextWrapper;
.source "ModuleRuntime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dragstreets/shell/ModuleRuntime;->start(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .line 45
    sget-object v0, Lcom/dragstreets/shell/ModuleRuntime;->loader:Ljava/lang/ClassLoader;

    return-object v0
.end method
