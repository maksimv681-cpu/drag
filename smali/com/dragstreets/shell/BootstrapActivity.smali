.class public final Lcom/dragstreets/shell/BootstrapActivity;
.super Landroid/app/Activity;
.source "BootstrapActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;
    }
.end annotation


# static fields
.field private static final CYAN:I = -0xac2413

.field private static final MUTED:I = -0x65513c

.field private static final WHITE:I = -0xc0804


# instance fields
.field private actions:Landroid/widget/LinearLayout;

.field private amount:Landroid/widget/TextView;

.field private busy:Z

.field private volatile closed:Z

.field private detail:Landroid/widget/TextView;

.field private progress:Landroid/widget/ProgressBar;

.field private status:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dragstreets/shell/BootstrapActivity;F)I
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result p0

    return p0
.end method

.method private button(Ljava/lang/String;Z)Landroid/widget/Button;
    .locals 4

    .line 77
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, 0x41500000    # 13.0f

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 78
    if-eqz p2, :cond_0

    const v1, -0xf5e7dd

    goto :goto_0

    :cond_0
    const v1, -0xc0804

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 79
    new-instance v1, Landroid/graphics/drawable/RippleDrawable;

    const v2, 0x33ffffff

    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz p2, :cond_1

    const v3, -0xac2413

    goto :goto_1

    :cond_1
    const v3, -0xdfcdb9

    :goto_1
    if-eqz p2, :cond_2

    goto :goto_2

    :cond_2
    const p1, -0xc4ac95

    :goto_2
    const/16 p2, 0xc

    invoke-direct {p0, v3, p1, p2}, Lcom/dragstreets/shell/BootstrapActivity;->panel(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    const/4 p2, 0x0

    invoke-direct {v1, v2, p1, p2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    return-object v0
.end method

.method private check()V
    .locals 3

    .line 87
    iget-boolean v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->busy:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->closed:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->busy:Z

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/dragstreets/shell/BootstrapActivity;->waiting(I)V

    .line 88
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda5;-><init>(Lcom/dragstreets/shell/BootstrapActivity;)V

    const-string v2, "DragStreetsModuleUpdate"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 99
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 100
    return-void

    .line 87
    :cond_1
    :goto_0
    return-void
.end method

.method private dp(F)I
    .locals 1

    .line 27
    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private failure(Ljava/lang/Exception;)V
    .locals 2

    .line 106
    const-string v0, "DS-MODULE"

    const-string v1, "Module startup/update failed"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 107
    iget-boolean p1, p0, Lcom/dragstreets/shell/BootstrapActivity;->closed:Z

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/dragstreets/shell/BootstrapActivity;->busy:Z

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->amount:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->status:Landroid/widget/TextView;

    const/16 v1, 0x9

    invoke-static {v1}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->detail:Landroid/widget/TextView;

    const/16 v1, 0xa

    invoke-static {v1}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->actions:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 109
    return-void

    .line 107
    :cond_1
    :goto_0
    return-void
.end method

.method private panel(III)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 33
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    int-to-float p1, p3

    invoke-direct {p0, p1}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 34
    if-eqz p2, :cond_0

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-direct {p0, p1}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result p1

    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    :cond_0
    return-object v0
.end method

.method private saved()V
    .locals 1

    .line 102
    iget-boolean v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->busy:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->closed:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->busy:Z

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/dragstreets/shell/BootstrapActivity;->waiting(I)V

    .line 103
    :try_start_0
    invoke-static {}, Lcom/dragstreets/shell/ModuleRuntime;->useRecovery()V

    invoke-static {p0}, Lcom/dragstreets/shell/ModuleRuntime;->start(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-direct {p0, v0}, Lcom/dragstreets/shell/BootstrapActivity;->failure(Ljava/lang/Exception;)V

    .line 104
    :goto_0
    return-void

    .line 102
    :cond_1
    :goto_1
    return-void
.end method

.method private screen()V
    .locals 18

    .line 37
    move-object/from16 v1, p0

    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;

    invoke-direct {v0, v1}, Lcom/dragstreets/shell/BootstrapActivity$RoadBackdrop;-><init>(Lcom/dragstreets/shell/BootstrapActivity;)V

    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 38
    new-instance v3, Landroid/widget/ScrollView;

    invoke-direct {v3, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Landroid/widget/ScrollView;->setClipToPadding(Z)V

    .line 39
    const/high16 v6, 0x41c00000    # 24.0f

    invoke-direct {v1, v6}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v0

    const/high16 v7, 0x41a00000    # 20.0f

    invoke-direct {v1, v7}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v8

    invoke-direct {v1, v6}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v9

    invoke-direct {v1, v7}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v10

    invoke-virtual {v3, v0, v8, v9, v10}, Landroid/widget/ScrollView;->setPadding(IIII)V

    invoke-virtual {v3, v5}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 40
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v9, 0x11

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 41
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v0, v10, v10}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v8, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 42
    invoke-virtual {v1}, Lcom/dragstreets/shell/BootstrapActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v11, 0x42400000    # 48.0f

    invoke-direct {v1, v11}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v12

    sub-int/2addr v0, v12

    .line 43
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v12, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v13, 0x41e00000    # 28.0f

    invoke-direct {v1, v13}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v14

    const/high16 v15, 0x41d00000    # 26.0f

    invoke-direct {v1, v15}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v15

    invoke-direct {v1, v13}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v13

    invoke-direct {v1, v6}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v9

    invoke-virtual {v12, v14, v15, v13, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 44
    const v9, -0xd4bfac

    const/16 v13, 0x18

    const v14, -0xdede1d3

    invoke-direct {v1, v14, v9, v13}, Lcom/dragstreets/shell/BootstrapActivity;->panel(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v9

    invoke-virtual {v12, v9}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/high16 v9, 0x41200000    # 10.0f

    invoke-direct {v1, v9}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v12, v9}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 45
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x440c0000    # 560.0f

    invoke-direct {v1, v13}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v13

    invoke-static {v13, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v13, -0x2

    invoke-direct {v9, v0, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v12, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-direct {v9, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v14, 0x10

    invoke-virtual {v9, v14}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v12, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 47
    new-instance v15, Landroid/widget/ImageView;

    invoke-direct {v15, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v15, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 48
    const v0, -0xcbaa96

    const/16 v11, 0x12

    const v14, -0xe8d7c8

    invoke-direct {v1, v14, v0, v11}, Lcom/dragstreets/shell/BootstrapActivity;->panel(III)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {v15, v0}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v15, v4}, Landroid/widget/ImageView;->setClipToOutline(Z)V

    .line 49
    const/4 v11, 0x0

    const/4 v14, 0x2

    :try_start_0
    invoke-virtual {v1}, Lcom/dragstreets/shell/BootstrapActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v6, "auth/drag-streets-avatar.png"

    invoke-virtual {v0, v6}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 50
    :try_start_1
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput v14, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 51
    invoke-static {v6, v11, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v15, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    if-eqz v6, :cond_0

    :try_start_2
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :cond_0
    move/from16 v16, v14

    goto :goto_2

    .line 49
    :catchall_0
    move-exception v0

    move/from16 v16, v14

    move-object v14, v0

    if-eqz v6, :cond_1

    :try_start_3
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v14, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v14
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 52
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    move/from16 v16, v14

    :goto_1
    const v0, 0x1080039

    invoke-virtual {v15, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 53
    :goto_2
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42980000    # 76.0f

    invoke-direct {v1, v6}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v14

    invoke-direct {v1, v6}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v6

    invoke-direct {v0, v14, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v15, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-direct {v1, v7}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v6

    invoke-virtual {v0, v6, v5, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 55
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v6, v5, v13, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v9, v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    invoke-static {v5}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v6

    const/16 v9, 0xa

    const v14, -0xac2413

    invoke-direct {v1, v6, v9, v14, v4}, Lcom/dragstreets/shell/BootstrapActivity;->text(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    const v9, 0x3e23d70a    # 0.16f

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setLetterSpacing(F)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 57
    const-string v6, "DRAG STREETS"

    const/16 v9, 0x1b

    const v15, -0xc0804

    invoke-direct {v1, v6, v9, v15, v4}, Lcom/dragstreets/shell/BootstrapActivity;->text(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    const/high16 v9, 0x41100000    # 9.0f

    invoke-direct {v1, v9}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v9

    const/high16 v11, 0x40e00000    # 7.0f

    invoke-direct {v1, v11}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v11

    invoke-virtual {v6, v5, v9, v5, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 58
    invoke-static {v4}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v6

    const/16 v9, 0xd

    const v11, -0x65513c

    invoke-direct {v1, v6, v9, v11, v5}, Lcom/dragstreets/shell/BootstrapActivity;->text(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 59
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v6, -0xd6c4b2

    invoke-virtual {v0, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 60
    move/from16 v17, v6

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v7}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v11

    invoke-direct {v6, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v11, 0x41c00000    # 24.0f

    invoke-direct {v1, v11}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v11

    iput v11, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    const/high16 v11, 0x41a80000    # 21.0f

    invoke-direct {v1, v11}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v11

    iput v11, v6, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v12, v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v6, 0x10

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 62
    const-string v11, ""

    invoke-direct {v1, v11, v6, v15, v4}, Lcom/dragstreets/shell/BootstrapActivity;->text(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    iput-object v6, v1, Lcom/dragstreets/shell/BootstrapActivity;->status:Landroid/widget/TextView;

    iget-object v6, v1, Lcom/dragstreets/shell/BootstrapActivity;->status:Landroid/widget/TextView;

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v15, v5, v13, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v6, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    invoke-direct {v1, v11, v9, v14, v4}, Lcom/dragstreets/shell/BootstrapActivity;->text(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    iput-object v6, v1, Lcom/dragstreets/shell/BootstrapActivity;->amount:Landroid/widget/TextView;

    iget-object v6, v1, Lcom/dragstreets/shell/BootstrapActivity;->amount:Landroid/widget/TextView;

    const/high16 v11, 0x41400000    # 12.0f

    invoke-direct {v1, v11}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v15

    invoke-virtual {v6, v15, v5, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v6, v1, Lcom/dragstreets/shell/BootstrapActivity;->amount:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 64
    new-instance v0, Landroid/widget/ProgressBar;

    const v6, 0x1010078

    const/4 v15, 0x0

    invoke-direct {v0, v1, v15, v6}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    iget-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    const/16 v6, 0x3e8

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 65
    iget-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    invoke-static {v14}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    iget-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    invoke-static/range {v17 .. v17}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setProgressBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 66
    iget-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    invoke-static {v14}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/ProgressBar;->setIndeterminateTintList(Landroid/content/res/ColorStateList;)V

    .line 67
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x41000000    # 8.0f

    invoke-direct {v1, v6}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v6

    invoke-direct {v0, v10, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v6, 0x41880000    # 17.0f

    invoke-direct {v1, v6}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v6

    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    const/high16 v6, 0x41500000    # 13.0f

    invoke-direct {v1, v6}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v6

    iput v6, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v6, v1, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v12, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    invoke-static/range {v16 .. v16}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v0

    const v6, -0x65513c

    invoke-direct {v1, v0, v9, v6, v5}, Lcom/dragstreets/shell/BootstrapActivity;->text(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->detail:Landroid/widget/TextView;

    iget-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->detail:Landroid/widget/TextView;

    move/from16 v6, v16

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setMinLines(I)V

    iget-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->detail:Landroid/widget/TextView;

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 69
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->actions:Landroid/widget/LinearLayout;

    iget-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->actions:Landroid/widget/LinearLayout;

    const/high16 v6, 0x41600000    # 14.0f

    invoke-direct {v1, v6}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v6

    invoke-virtual {v0, v5, v6, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->actions:Landroid/widget/LinearLayout;

    const/16 v6, 0x8

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, v1, Lcom/dragstreets/shell/BootstrapActivity;->actions:Landroid/widget/LinearLayout;

    invoke-virtual {v12, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 70
    const/4 v0, 0x6

    invoke-static {v0}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0, v4}, Lcom/dragstreets/shell/BootstrapActivity;->button(Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v0

    new-instance v4, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda3;

    invoke-direct {v4, v1}, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda3;-><init>(Lcom/dragstreets/shell/BootstrapActivity;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, v1, Lcom/dragstreets/shell/BootstrapActivity;->actions:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x42400000    # 48.0f

    invoke-direct {v1, v9}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v12

    invoke-direct {v6, v5, v12, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    const/4 v0, 0x7

    invoke-static {v0}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0, v5}, Lcom/dragstreets/shell/BootstrapActivity;->button(Ljava/lang/String;Z)Landroid/widget/Button;

    move-result-object v0

    new-instance v4, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda4;

    invoke-direct {v4, v1}, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda4;-><init>(Lcom/dragstreets/shell/BootstrapActivity;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x42400000    # 48.0f

    invoke-direct {v1, v9}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-direct {v1, v11}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget-object v6, v1, Lcom/dragstreets/shell/BootstrapActivity;->actions:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v0

    const/16 v4, 0xb

    const v6, -0x7b644f

    invoke-direct {v1, v0, v4, v6, v5}, Lcom/dragstreets/shell/BootstrapActivity;->text(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    const/16 v4, 0x11

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v4, 0x41900000    # 18.0f

    invoke-direct {v1, v4}, Lcom/dragstreets/shell/BootstrapActivity;->dp(F)I

    move-result v4

    invoke-virtual {v0, v5, v4, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 74
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v4, v10, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v2}, Lcom/dragstreets/shell/BootstrapActivity;->setContentView(Landroid/view/View;)V

    .line 75
    return-void
.end method

.method private text(Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 1

    .line 29
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    if-eqz p4, :cond_0

    const-string p1, "sans-serif-medium"

    goto :goto_0

    :cond_0
    const-string p1, "sans-serif"

    :goto_0
    invoke-static {p1, p4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    return-object v0
.end method

.method private waiting(I)V
    .locals 2

    .line 83
    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->actions:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->status:Landroid/widget/TextView;

    invoke-static {p1}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity;->amount:Landroid/widget/TextView;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity;->detail:Landroid/widget/TextView;

    const/4 v0, 0x2

    invoke-static {v0}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object p1, p0, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 85
    return-void
.end method


# virtual methods
.method synthetic lambda$check$0$com-dragstreets-shell-BootstrapActivity()V
    .locals 3

    .line 90
    :try_start_0
    invoke-static {}, Lcom/dragstreets/shell/ModuleRuntime;->loader()Ljava/lang/ClassLoader;

    .line 91
    sget-object v0, Lcom/dragstreets/shell/ModuleRuntime;->store:Lcom/dragstreets/shell/ModuleStore;

    sget-object v1, Lcom/dragstreets/shell/ModuleRuntime;->selected:Lcom/dragstreets/shell/SignedModule;

    new-instance v2, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda0;-><init>(Lcom/dragstreets/shell/BootstrapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/dragstreets/shell/ModuleStore;->update(Lcom/dragstreets/shell/SignedModule;Lcom/dragstreets/shell/ModuleStore$Progress;)Lcom/dragstreets/shell/SignedModule;

    move-result-object v0

    .line 96
    iget-boolean v1, p0, Lcom/dragstreets/shell/BootstrapActivity;->closed:Z

    if-eqz v1, :cond_0

    return-void

    :cond_0
    invoke-static {v0}, Lcom/dragstreets/shell/ModuleRuntime;->select(Lcom/dragstreets/shell/SignedModule;)V

    .line 97
    new-instance v0, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda1;-><init>(Lcom/dragstreets/shell/BootstrapActivity;)V

    invoke-virtual {p0, v0}, Lcom/dragstreets/shell/BootstrapActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, v0}, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda2;-><init>(Lcom/dragstreets/shell/BootstrapActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v1}, Lcom/dragstreets/shell/BootstrapActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 99
    :goto_0
    return-void
.end method

.method synthetic lambda$check$1$com-dragstreets-shell-BootstrapActivity(JJ)V
    .locals 6

    .line 91
    new-instance v0, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda6;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/dragstreets/shell/BootstrapActivity$$ExternalSyntheticLambda6;-><init>(Lcom/dragstreets/shell/BootstrapActivity;JJ)V

    invoke-virtual {p0, v0}, Lcom/dragstreets/shell/BootstrapActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$check$2$com-dragstreets-shell-BootstrapActivity(JJ)V
    .locals 4

    .line 92
    iget-boolean v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->closed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->status:Landroid/widget/TextView;

    const/4 v1, 0x5

    invoke-static {v1}, Lcom/dragstreets/shell/ShellText;->get(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setIndeterminate(Z)V

    .line 93
    const-wide/16 v0, 0x3e8

    mul-long/2addr v0, p1

    const-wide/16 v2, 0x1

    invoke-static {v2, v3, p3, p4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    div-long/2addr v0, v2

    long-to-int v0, v0

    iget-object v1, p0, Lcom/dragstreets/shell/BootstrapActivity;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object v1, p0, Lcom/dragstreets/shell/BootstrapActivity;->amount:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit8 v0, v0, 0xa

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "%"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    iget-object v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->detail:Landroid/widget/TextView;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    long-to-double p1, p1

    const-wide/high16 v2, 0x4130000000000000L    # 1048576.0

    div-double/2addr p1, v2

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    long-to-double p2, p3

    div-double/2addr p2, v2

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "%.1f / %.1f MB"

    invoke-static {v1, p2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    return-void
.end method

.method synthetic lambda$check$3$com-dragstreets-shell-BootstrapActivity()V
    .locals 1

    .line 97
    iget-boolean v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->closed:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x8

    :try_start_0
    invoke-direct {p0, v0}, Lcom/dragstreets/shell/BootstrapActivity;->waiting(I)V

    invoke-static {p0}, Lcom/dragstreets/shell/ModuleRuntime;->start(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-direct {p0, v0}, Lcom/dragstreets/shell/BootstrapActivity;->failure(Ljava/lang/Exception;)V

    :cond_0
    :goto_0
    return-void
.end method

.method synthetic lambda$check$4$com-dragstreets-shell-BootstrapActivity(Ljava/lang/Exception;)V
    .locals 0

    .line 98
    invoke-direct {p0, p1}, Lcom/dragstreets/shell/BootstrapActivity;->failure(Ljava/lang/Exception;)V

    return-void
.end method

.method synthetic lambda$screen$0$com-dragstreets-shell-BootstrapActivity(Landroid/view/View;)V
    .locals 0

    .line 70
    invoke-direct {p0}, Lcom/dragstreets/shell/BootstrapActivity;->check()V

    return-void
.end method

.method synthetic lambda$screen$1$com-dragstreets-shell-BootstrapActivity(Landroid/view/View;)V
    .locals 0

    .line 71
    invoke-direct {p0}, Lcom/dragstreets/shell/BootstrapActivity;->saved()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 20
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    invoke-static {p0}, Lcom/dragstreets/shell/ModuleRuntime;->resumeOrRestart(Landroid/app/Activity;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const v0, -0xf5efe6

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 23
    invoke-virtual {p0}, Lcom/dragstreets/shell/BootstrapActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x1006

    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 24
    invoke-direct {p0}, Lcom/dragstreets/shell/BootstrapActivity;->screen()V

    invoke-direct {p0}, Lcom/dragstreets/shell/BootstrapActivity;->check()V

    .line 25
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dragstreets/shell/BootstrapActivity;->closed:Z

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
