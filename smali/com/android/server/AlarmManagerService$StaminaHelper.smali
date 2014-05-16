.class Lcom/android/server/AlarmManagerService$StaminaHelper;
.super Ljava/lang/Object;
.source "AlarmManagerService.java"

# interfaces
.implements Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/AlarmManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StaminaHelper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/server/StaminaArrayList$StaminaAlarmHelper",
        "<",
        "Lcom/android/server/AlarmManagerService$Alarm;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/AlarmManagerService;


# direct methods
.method private constructor <init>(Lcom/android/server/AlarmManagerService;)V
    .locals 0

    .prologue
    .line 1512
    iput-object p1, p0, Lcom/android/server/AlarmManagerService$StaminaHelper;->this$0:Lcom/android/server/AlarmManagerService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/AlarmManagerService;Lcom/android/server/AlarmManagerService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/server/AlarmManagerService;
    .param p2, "x1"    # Lcom/android/server/AlarmManagerService$1;

    .prologue
    .line 1512
    invoke-direct {p0, p1}, Lcom/android/server/AlarmManagerService$StaminaHelper;-><init>(Lcom/android/server/AlarmManagerService;)V

    return-void
.end method


# virtual methods
.method public isExpiringAfter(Lcom/android/server/AlarmManagerService$Alarm;JJ)Z
    .locals 4
    .param p1, "alarm"    # Lcom/android/server/AlarmManagerService$Alarm;
    .param p2, "rtcTime"    # J
    .param p4, "elapsedTime"    # J

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 1520
    iget v2, p1, Lcom/android/server/AlarmManagerService$Alarm;->type:I

    packed-switch v2, :pswitch_data_0

    .line 1528
    :cond_0
    :goto_0
    return v0

    .line 1523
    :pswitch_0
    iget-wide v2, p1, Lcom/android/server/AlarmManagerService$Alarm;->when:J

    cmp-long v2, v2, p2

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 1526
    :pswitch_1
    iget-wide v2, p1, Lcom/android/server/AlarmManagerService$Alarm;->when:J

    cmp-long v2, v2, p4

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 1520
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic isExpiringAfter(Ljava/lang/Object;JJ)Z
    .locals 6
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # J
    .param p4, "x2"    # J

    .prologue
    .line 1512
    move-object v1, p1

    check-cast v1, Lcom/android/server/AlarmManagerService$Alarm;

    move-object v0, p0

    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/AlarmManagerService$StaminaHelper;->isExpiringAfter(Lcom/android/server/AlarmManagerService$Alarm;JJ)Z

    move-result v0

    return v0
.end method

.method public isWhitelisted(Lcom/android/server/AlarmManagerService$Alarm;)Z
    .locals 1
    .param p1, "alarm"    # Lcom/android/server/AlarmManagerService$Alarm;

    .prologue
    .line 1515
    iget-object v0, p0, Lcom/android/server/AlarmManagerService$StaminaHelper;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mStaminaController:Lcom/android/server/AlarmManagerService$StaminaController;
    invoke-static {v0}, Lcom/android/server/AlarmManagerService;->access$2600(Lcom/android/server/AlarmManagerService;)Lcom/android/server/AlarmManagerService$StaminaController;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/server/AlarmManagerService$StaminaHelper;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mStaminaController:Lcom/android/server/AlarmManagerService$StaminaController;
    invoke-static {v0}, Lcom/android/server/AlarmManagerService;->access$2600(Lcom/android/server/AlarmManagerService;)Lcom/android/server/AlarmManagerService$StaminaController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/AlarmManagerService$StaminaController;->isWhitelisted(Lcom/android/server/AlarmManagerService$Alarm;)Z

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic isWhitelisted(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 1512
    check-cast p1, Lcom/android/server/AlarmManagerService$Alarm;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/android/server/AlarmManagerService$StaminaHelper;->isWhitelisted(Lcom/android/server/AlarmManagerService$Alarm;)Z

    move-result v0

    return v0
.end method
