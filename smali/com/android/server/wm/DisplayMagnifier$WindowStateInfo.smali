.class final Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;
.super Ljava/lang/Object;
.source "DisplayMagnifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/wm/DisplayMagnifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "WindowStateInfo"
.end annotation


# static fields
.field private static final MAX_POOL_SIZE:I = 0x1e

.field private static final mTempRegion:Landroid/graphics/Region;

.field private static final sPool:Landroid/util/Pools$SimplePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pools$SimplePool",
            "<",
            "Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final mTouchableRegion:Landroid/graphics/Rect;

.field public mWindowState:Lcom/android/server/wm/WindowState;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 666
    new-instance v0, Landroid/util/Pools$SimplePool;

    const/16 v1, 0x1e

    invoke-direct {v0, v1}, Landroid/util/Pools$SimplePool;-><init>(I)V

    sput-object v0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->sPool:Landroid/util/Pools$SimplePool;

    .line 669
    new-instance v0, Landroid/graphics/Region;

    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    sput-object v0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->mTempRegion:Landroid/graphics/Region;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 663
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 672
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->mTouchableRegion:Landroid/graphics/Rect;

    return-void
.end method

.method public static obtain(Lcom/android/server/wm/WindowState;)Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;
    .locals 3
    .param p0, "windowState"    # Lcom/android/server/wm/WindowState;

    .prologue
    .line 675
    sget-object v1, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->sPool:Landroid/util/Pools$SimplePool;

    invoke-virtual {v1}, Landroid/util/Pools$SimplePool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;

    .line 676
    .local v0, "info":Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;
    if-nez v0, :cond_0

    .line 677
    new-instance v0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;

    .end local v0    # "info":Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;
    invoke-direct {v0}, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;-><init>()V

    .line 679
    .restart local v0    # "info":Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;
    :cond_0
    iput-object p0, v0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->mWindowState:Lcom/android/server/wm/WindowState;

    .line 680
    sget-object v1, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->mTempRegion:Landroid/graphics/Region;

    invoke-virtual {p0, v1}, Lcom/android/server/wm/WindowState;->getTouchableRegion(Landroid/graphics/Region;)V

    .line 681
    sget-object v1, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->mTempRegion:Landroid/graphics/Region;

    iget-object v2, v0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->mTouchableRegion:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/Region;->getBounds(Landroid/graphics/Rect;)Z

    .line 682
    return-object v0
.end method


# virtual methods
.method public recycle()V
    .locals 1

    .prologue
    .line 686
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->mWindowState:Lcom/android/server/wm/WindowState;

    .line 687
    iget-object v0, p0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->mTouchableRegion:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 688
    sget-object v0, Lcom/android/server/wm/DisplayMagnifier$WindowStateInfo;->sPool:Landroid/util/Pools$SimplePool;

    invoke-virtual {v0, p0}, Landroid/util/Pools$SimplePool;->release(Ljava/lang/Object;)Z

    .line 689
    return-void
.end method
