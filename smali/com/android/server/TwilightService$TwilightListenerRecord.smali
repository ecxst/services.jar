.class final Lcom/android/server/TwilightService$TwilightListenerRecord;
.super Ljava/lang/Object;
.source "TwilightService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/TwilightService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TwilightListenerRecord"
.end annotation


# instance fields
.field private final mHandler:Landroid/os/Handler;

.field private final mListener:Lcom/android/server/TwilightService$TwilightListener;


# direct methods
.method public constructor <init>(Lcom/android/server/TwilightService$TwilightListener;Landroid/os/Handler;)V
    .locals 0
    .param p1, "listener"    # Lcom/android/server/TwilightService$TwilightListener;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 268
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 269
    iput-object p1, p0, Lcom/android/server/TwilightService$TwilightListenerRecord;->mListener:Lcom/android/server/TwilightService$TwilightListener;

    .line 270
    iput-object p2, p0, Lcom/android/server/TwilightService$TwilightListenerRecord;->mHandler:Landroid/os/Handler;

    .line 271
    return-void
.end method


# virtual methods
.method public post()V
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lcom/android/server/TwilightService$TwilightListenerRecord;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 275
    return-void
.end method

.method public run()V
    .locals 1

    .prologue
    .line 279
    iget-object v0, p0, Lcom/android/server/TwilightService$TwilightListenerRecord;->mListener:Lcom/android/server/TwilightService$TwilightListener;

    invoke-interface {v0}, Lcom/android/server/TwilightService$TwilightListener;->onTwilightStateChanged()V

    .line 280
    return-void
.end method
