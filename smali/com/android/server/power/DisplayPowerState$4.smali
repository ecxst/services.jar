.class Lcom/android/server/power/DisplayPowerState$4;
.super Ljava/lang/Object;
.source "DisplayPowerState.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/power/DisplayPowerState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/power/DisplayPowerState;


# direct methods
.method constructor <init>(Lcom/android/server/power/DisplayPowerState;)V
    .locals 0

    .prologue
    .line 336
    iput-object p1, p0, Lcom/android/server/power/DisplayPowerState$4;->this$0:Lcom/android/server/power/DisplayPowerState;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 339
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState$4;->this$0:Lcom/android/server/power/DisplayPowerState;

    const/4 v1, 0x0

    # setter for: Lcom/android/server/power/DisplayPowerState;->mElectronBeamDrawPending:Z
    invoke-static {v0, v1}, Lcom/android/server/power/DisplayPowerState;->access$902(Lcom/android/server/power/DisplayPowerState;Z)Z

    .line 341
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState$4;->this$0:Lcom/android/server/power/DisplayPowerState;

    # getter for: Lcom/android/server/power/DisplayPowerState;->mElectronBeamPrepared:Z
    invoke-static {v0}, Lcom/android/server/power/DisplayPowerState;->access$1000(Lcom/android/server/power/DisplayPowerState;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 342
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState$4;->this$0:Lcom/android/server/power/DisplayPowerState;

    # getter for: Lcom/android/server/power/DisplayPowerState;->mElectronBeam:Lcom/android/server/power/ElectronBeam;
    invoke-static {v0}, Lcom/android/server/power/DisplayPowerState;->access$1100(Lcom/android/server/power/DisplayPowerState;)Lcom/android/server/power/ElectronBeam;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/power/DisplayPowerState$4;->this$0:Lcom/android/server/power/DisplayPowerState;

    # getter for: Lcom/android/server/power/DisplayPowerState;->mElectronBeamLevel:F
    invoke-static {v1}, Lcom/android/server/power/DisplayPowerState;->access$300(Lcom/android/server/power/DisplayPowerState;)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/server/power/ElectronBeam;->draw(F)Z

    .line 345
    :cond_0
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState$4;->this$0:Lcom/android/server/power/DisplayPowerState;

    const/4 v1, 0x1

    # setter for: Lcom/android/server/power/DisplayPowerState;->mElectronBeamReady:Z
    invoke-static {v0, v1}, Lcom/android/server/power/DisplayPowerState;->access$1202(Lcom/android/server/power/DisplayPowerState;Z)Z

    .line 346
    iget-object v0, p0, Lcom/android/server/power/DisplayPowerState$4;->this$0:Lcom/android/server/power/DisplayPowerState;

    # invokes: Lcom/android/server/power/DisplayPowerState;->invokeCleanListenerIfNeeded()V
    invoke-static {v0}, Lcom/android/server/power/DisplayPowerState;->access$800(Lcom/android/server/power/DisplayPowerState;)V

    .line 347
    return-void
.end method
