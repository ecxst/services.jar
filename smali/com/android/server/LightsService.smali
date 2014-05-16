.class public Lcom/android/server/LightsService;
.super Ljava/lang/Object;
.source "LightsService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/LightsService$Light;
    }
.end annotation


# static fields
.field public static final BRIGHTNESS_MODE_SENSOR:I = 0x1

.field public static final BRIGHTNESS_MODE_USER:I = 0x0

.field private static final DEBUG:Z = false

.field public static final LIGHT_FLASH_HARDWARE:I = 0x2

.field public static final LIGHT_FLASH_NONE:I = 0x0

.field public static final LIGHT_FLASH_TIMED:I = 0x1

.field public static final LIGHT_ID_ATTENTION:I = 0x5

.field public static final LIGHT_ID_BACKLIGHT:I = 0x0

.field public static final LIGHT_ID_BATTERY:I = 0x3

.field public static final LIGHT_ID_BLUETOOTH:I = 0x6

.field public static final LIGHT_ID_BUTTONS:I = 0x2

.field public static final LIGHT_ID_COUNT:I = 0x8

.field public static final LIGHT_ID_KEYBOARD:I = 0x1

.field public static final LIGHT_ID_NOTIFICATIONS:I = 0x4

.field public static final LIGHT_ID_WIFI:I = 0x7

.field private static final MSG_BBL_TIMEOUT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "LightsService"


# instance fields
.field private mButtonBrightness:I

.field private mButtonLightEnable:Z

.field private mButtonLightTimeout:I

.field private final mContext:Landroid/content/Context;

.field private mH:Landroid/os/Handler;

.field private final mLegacyFlashlightHack:Landroid/os/IHardwareService$Stub;

.field private mLightHandler:Landroid/os/Handler;

.field private final mLights:[Lcom/android/server/LightsService$Light;

.field private mNativePointer:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    const/16 v3, 0x8

    .line 231
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-array v1, v3, [Lcom/android/server/LightsService$Light;

    iput-object v1, p0, Lcom/android/server/LightsService;->mLights:[Lcom/android/server/LightsService$Light;

    .line 72
    iput-object v4, p0, Lcom/android/server/LightsService;->mLightHandler:Landroid/os/Handler;

    .line 173
    new-instance v1, Lcom/android/server/LightsService$1;

    invoke-direct {v1, p0}, Lcom/android/server/LightsService$1;-><init>(Lcom/android/server/LightsService;)V

    iput-object v1, p0, Lcom/android/server/LightsService;->mLegacyFlashlightHack:Landroid/os/IHardwareService$Stub;

    .line 274
    new-instance v1, Lcom/android/server/LightsService$3;

    invoke-direct {v1, p0}, Lcom/android/server/LightsService$3;-><init>(Lcom/android/server/LightsService;)V

    iput-object v1, p0, Lcom/android/server/LightsService;->mH:Landroid/os/Handler;

    .line 233
    invoke-static {}, Lcom/android/server/LightsService;->init_native()I

    move-result v1

    iput v1, p0, Lcom/android/server/LightsService;->mNativePointer:I

    .line 234
    iput-object p1, p0, Lcom/android/server/LightsService;->mContext:Landroid/content/Context;

    .line 236
    iget-object v1, p0, Lcom/android/server/LightsService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x10e0041

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/server/LightsService;->mButtonLightTimeout:I

    .line 239
    iget-object v1, p0, Lcom/android/server/LightsService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x1110060

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/server/LightsService;->mButtonLightEnable:Z

    .line 242
    iget-object v1, p0, Lcom/android/server/LightsService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x10e0040

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/server/LightsService;->mButtonBrightness:I

    .line 245
    new-instance v1, Lcom/android/server/LightsService$2;

    invoke-direct {v1, p0}, Lcom/android/server/LightsService$2;-><init>(Lcom/android/server/LightsService;)V

    iput-object v1, p0, Lcom/android/server/LightsService;->mLightHandler:Landroid/os/Handler;

    .line 258
    const-string v1, "hardware"

    iget-object v2, p0, Lcom/android/server/LightsService;->mLegacyFlashlightHack:Landroid/os/IHardwareService$Stub;

    invoke-static {v1, v2}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 260
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 261
    iget-object v1, p0, Lcom/android/server/LightsService;->mLights:[Lcom/android/server/LightsService$Light;

    new-instance v2, Lcom/android/server/LightsService$Light;

    invoke-direct {v2, p0, v0, v4}, Lcom/android/server/LightsService$Light;-><init>(Lcom/android/server/LightsService;ILcom/android/server/LightsService$1;)V

    aput-object v2, v1, v0

    .line 260
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 263
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/android/server/LightsService;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LightsService;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/server/LightsService;->mH:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/LightsService;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LightsService;

    .prologue
    .line 34
    iget v0, p0, Lcom/android/server/LightsService;->mNativePointer:I

    return v0
.end method

.method static synthetic access$200(IIIIIII)V
    .locals 0
    .param p0, "x0"    # I
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .param p4, "x4"    # I
    .param p5, "x5"    # I
    .param p6, "x6"    # I

    .prologue
    .line 34
    invoke-static/range {p0 .. p6}, Lcom/android/server/LightsService;->setLight_native(IIIIIII)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/server/LightsService;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LightsService;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/server/LightsService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/server/LightsService;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LightsService;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/android/server/LightsService;->mLightHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/server/LightsService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LightsService;

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/android/server/LightsService;->mButtonLightEnable:Z

    return v0
.end method

.method static synthetic access$600(Lcom/android/server/LightsService;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LightsService;

    .prologue
    .line 34
    iget v0, p0, Lcom/android/server/LightsService;->mButtonBrightness:I

    return v0
.end method

.method static synthetic access$700(Lcom/android/server/LightsService;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/server/LightsService;

    .prologue
    .line 34
    iget v0, p0, Lcom/android/server/LightsService;->mButtonLightTimeout:I

    return v0
.end method

.method private static native finalize_native(I)V
.end method

.method private static native init_native()I
.end method

.method private static native setLight_native(IIIIIII)V
.end method


# virtual methods
.method protected finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 266
    iget v0, p0, Lcom/android/server/LightsService;->mNativePointer:I

    invoke-static {v0}, Lcom/android/server/LightsService;->finalize_native(I)V

    .line 267
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 268
    return-void
.end method

.method public getLight(I)Lcom/android/server/LightsService$Light;
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 271
    iget-object v0, p0, Lcom/android/server/LightsService;->mLights:[Lcom/android/server/LightsService$Light;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public setBrightnessButtonLight(I)V
    .locals 2
    .param p1, "brightness"    # I

    .prologue
    const/4 v1, 0x2

    .line 79
    iget-boolean v0, p0, Lcom/android/server/LightsService;->mButtonLightEnable:Z

    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {p0, v1}, Lcom/android/server/LightsService;->getLight(I)Lcom/android/server/LightsService$Light;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    .line 84
    :goto_0
    return-void

    .line 82
    :cond_0
    invoke-virtual {p0, v1}, Lcom/android/server/LightsService;->getLight(I)Lcom/android/server/LightsService$Light;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/server/LightsService$Light;->setBrightness(I)V

    goto :goto_0
.end method

.method public turnOffButtonLight()V
    .locals 1

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/server/LightsService;->setBrightnessButtonLight(I)V

    .line 88
    return-void
.end method

.method public turnOnButtonLight()V
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lcom/android/server/LightsService;->mButtonBrightness:I

    invoke-virtual {p0, v0}, Lcom/android/server/LightsService;->setBrightnessButtonLight(I)V

    .line 76
    return-void
.end method
