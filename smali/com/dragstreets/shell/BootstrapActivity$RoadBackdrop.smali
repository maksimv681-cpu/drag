.class final Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;
.super Landroid/view/View;
.source "BootstrapActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dragstreets/shell/BootstrapActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "RoadBackdrop"
.end annotation


# instance fields
.field private final paint:Landroid/graphics/Paint;

.field final synthetic this$0:Lcom/dragstreets/shell/BootstrapActivity;


# direct methods
.method constructor <init>(Lcom/dragstreets/shell/BootstrapActivity;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 112
    iput-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->this$0:Lcom/dragstreets/shell/BootstrapActivity;

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 111
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    .line 112
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->setImportantForAccessibility(I)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 14

    .line 114
    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->getWidth()I

    move-result v0

    int-to-float v4, v0

    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->getHeight()I

    move-result v0

    int-to-float v5, v0

    .line 115
    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/LinearGradient;

    const v7, -0xf8f3eb

    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const v6, -0xebd5c2

    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget-object v6, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 116
    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    new-instance v6, Landroid/graphics/RadialGradient;

    const v0, 0x3e051eb8    # 0.13f

    mul-float v7, v4, v0

    const v0, 0x3e19999a    # 0.15f

    mul-float v8, v5, v0

    const v0, 0x3f266666    # 0.65f

    mul-float/2addr v0, v4

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-static {v13, v0}, Ljava/lang/Math;->max(FF)F

    move-result v9

    const v11, 0x49d9ec

    sget-object v12, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const v10, 0x2949d9ec

    invoke-direct/range {v6 .. v12}, Landroid/graphics/RadialGradient;-><init>(FFFIILandroid/graphics/Shader$TileMode;)V

    invoke-virtual {p1, v6}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget-object v6, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 117
    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    const v0, 0x103d809c

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->this$0:Lcom/dragstreets/shell/BootstrapActivity;

    invoke-static {v0, v13}, Lcom/dragstreets/shell/BootstrapActivity;->access$000(Lcom/dragstreets/shell/BootstrapActivity;F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 118
    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->getHeight()I

    move-result p1

    neg-int p1, p1

    :goto_0
    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->getWidth()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    const v2, 0x3f333333    # 0.7f

    if-ge p1, v0, :cond_0

    int-to-float v6, p1

    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->getHeight()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v0, v2

    sub-float v8, v6, v0

    iget-object v10, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    const/4 v7, 0x0

    move v9, v5

    move-object v5, v1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v5, v9

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->this$0:Lcom/dragstreets/shell/BootstrapActivity;

    const/high16 v2, 0x42dc0000    # 110.0f

    invoke-static {v0, v2}, Lcom/dragstreets/shell/BootstrapActivity;->access$000(Lcom/dragstreets/shell/BootstrapActivity;F)I

    move-result v0

    add-int/2addr p1, v0

    goto :goto_0

    .line 119
    :cond_0
    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    const v0, 0x2071bed0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->this$0:Lcom/dragstreets/shell/BootstrapActivity;

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v0, v3}, Lcom/dragstreets/shell/BootstrapActivity;->access$000(Lcom/dragstreets/shell/BootstrapActivity;F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    mul-float v6, v4, v2

    const p1, 0x3dcccccd    # 0.1f

    mul-float v8, v4, p1

    iget-object v10, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    const/4 v7, 0x0

    move v9, v5

    move-object v5, v1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 120
    move v5, v9

    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    const v0, 0x5070d9e8

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->this$0:Lcom/dragstreets/shell/BootstrapActivity;

    const/high16 v2, 0x40800000    # 4.0f

    invoke-static {v0, v2}, Lcom/dragstreets/shell/BootstrapActivity;->access$000(Lcom/dragstreets/shell/BootstrapActivity;F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const p1, 0x3f6b851f    # 0.92f

    mul-float v8, v4, p1

    const p1, 0x3df5c28f    # 0.12f

    mul-float v9, v5, p1

    const p1, 0x3f547ae1    # 0.83f

    mul-float v10, v4, p1

    const p1, 0x3e9eb852    # 0.31f

    mul-float v11, v5, p1

    iget-object v12, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    move-object v7, v1

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 121
    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    const v0, 0x40efab5b

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    const p1, 0x3f70a3d7    # 0.94f

    mul-float v8, v4, p1

    const p1, 0x3f59999a    # 0.85f

    mul-float v10, v4, p1

    iget-object v12, p0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 122
    return-void
.end method
