.class Lcom/android/server/AlarmManagerService$StaminaController;
.super Ljava/lang/Object;
.source "AlarmManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/AlarmManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StaminaController"
.end annotation


# instance fields
.field private final mAlarmArrays:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/StaminaArrayList",
            "<",
            "Lcom/android/server/AlarmManagerService$Alarm;",
            ">;>;"
        }
    .end annotation
.end field

.field private mEmergencyTimeOut:J

.field private mPowerState:I

.field private final mSuperStaminaInternalWhitelist:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mSuperStaminaUidWhitelist:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/server/AlarmManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/AlarmManagerService;Landroid/content/Context;)V
    .locals 5
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1272
    iput-object p1, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1236
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    .line 1273
    new-instance v2, Ljava/util/HashSet;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x107003e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaInternalWhitelist:Ljava/util/HashSet;

    .line 1276
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaUidWhitelist:Ljava/util/HashSet;

    .line 1278
    new-instance v1, Lcom/android/server/AlarmManagerService$StaminaReceiver;

    invoke-direct {v1, p1, p0}, Lcom/android/server/AlarmManagerService$StaminaReceiver;-><init>(Lcom/android/server/AlarmManagerService;Lcom/android/server/AlarmManagerService$StaminaController;)V

    .line 1279
    .local v1, "staminaReceiver":Lcom/android/server/AlarmManagerService$StaminaReceiver;
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1280
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v2, "com.sonymobile.SUPER_STAMINA_POWER_STATE_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1281
    const-string v2, "com.sonymobile.XSSM_SMS_EMERGENCY_CB"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1282
    invoke-virtual {p2, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1283
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    # getter for: Lcom/android/server/AlarmManagerService;->mRtcWakeupAlarms:Lcom/android/server/StaminaArrayList;
    invoke-static {p1}, Lcom/android/server/AlarmManagerService;->access$800(Lcom/android/server/AlarmManagerService;)Lcom/android/server/StaminaArrayList;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1284
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    # getter for: Lcom/android/server/AlarmManagerService;->mRtcAlarms:Lcom/android/server/StaminaArrayList;
    invoke-static {p1}, Lcom/android/server/AlarmManagerService;->access$1000(Lcom/android/server/AlarmManagerService;)Lcom/android/server/StaminaArrayList;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1285
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    # getter for: Lcom/android/server/AlarmManagerService;->mElapsedRealtimeWakeupAlarms:Lcom/android/server/StaminaArrayList;
    invoke-static {p1}, Lcom/android/server/AlarmManagerService;->access$1100(Lcom/android/server/AlarmManagerService;)Lcom/android/server/StaminaArrayList;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1286
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    # getter for: Lcom/android/server/AlarmManagerService;->mElapsedRealtimeAlarms:Lcom/android/server/StaminaArrayList;
    invoke-static {p1}, Lcom/android/server/AlarmManagerService;->access$1200(Lcom/android/server/AlarmManagerService;)Lcom/android/server/StaminaArrayList;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1287
    return-void
.end method

.method private postponeAlarmsLocked(Lcom/android/server/StaminaArrayList;JJ)V
    .locals 7
    .param p2, "timeOut"    # J
    .param p4, "now"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/StaminaArrayList",
            "<",
            "Lcom/android/server/AlarmManagerService$Alarm;",
            ">;JJ)V"
        }
    .end annotation

    .prologue
    .line 1470
    .local p1, "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    add-long v2, p4, p2

    .line 1471
    .local v2, "newTime":J
    invoke-virtual {p1}, Lcom/android/server/StaminaArrayList;->getSuppressedAlarms()Ljava/util/ArrayList;

    move-result-object v4

    .line 1472
    .local v4, "suppressedAlarms":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/AlarmManagerService$Alarm;

    .line 1474
    .local v0, "alarm":Lcom/android/server/AlarmManagerService$Alarm;
    iget-wide v5, v0, Lcom/android/server/AlarmManagerService$Alarm;->when:J

    cmp-long v5, v5, v2

    if-gez v5, :cond_0

    .line 1475
    iput-wide v2, v0, Lcom/android/server/AlarmManagerService$Alarm;->when:J

    goto :goto_0

    .line 1478
    .end local v0    # "alarm":Lcom/android/server/AlarmManagerService$Alarm;
    :cond_1
    return-void
.end method

.method private triggerAlarmLocked(Lcom/android/server/StaminaArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/server/StaminaArrayList",
            "<",
            "Lcom/android/server/AlarmManagerService$Alarm;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1433
    .local p1, "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    invoke-virtual {p1}, Lcom/android/server/StaminaArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1434
    iget-object v1, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/server/StaminaArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/AlarmManagerService$Alarm;

    # invokes: Lcom/android/server/AlarmManagerService;->setLocked(Lcom/android/server/AlarmManagerService$Alarm;)V
    invoke-static {v1, v0}, Lcom/android/server/AlarmManagerService;->access$2500(Lcom/android/server/AlarmManagerService;Lcom/android/server/AlarmManagerService$Alarm;)V

    .line 1436
    :cond_0
    return-void
.end method


# virtual methods
.method public addWhitelistedUid(I)V
    .locals 5
    .param p1, "uid"    # I

    .prologue
    .line 1338
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mLock:Ljava/lang/Object;
    invoke-static {v2}, Lcom/android/server/AlarmManagerService;->access$700(Lcom/android/server/AlarmManagerService;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 1339
    :try_start_0
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaUidWhitelist:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1340
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1341
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/StaminaArrayList;

    .line 1342
    .local v0, "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    invoke-virtual {v0}, Lcom/android/server/StaminaArrayList;->update()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0, v0}, Lcom/android/server/AlarmManagerService$StaminaController;->triggerAlarmLocked(Lcom/android/server/StaminaArrayList;)V

    .line 1340
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1345
    .end local v0    # "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    .end local v1    # "i":I
    :cond_1
    monitor-exit v3

    .line 1346
    return-void

    .line 1345
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public dump(Ljava/io/PrintWriter;)V
    .locals 5
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 1412
    const-string v3, " "

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1413
    const-string v3, " Super Stamina debug info:"

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1414
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Power state ="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mPowerState:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1415
    const-string v3, " "

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1416
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Internal Whitelist ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaInternalWhitelist:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " items):"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1418
    iget-object v3, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaInternalWhitelist:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1419
    .local v1, "name":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 1421
    .end local v1    # "name":Ljava/lang/String;
    :cond_0
    const-string v3, " "

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1422
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " User Whitelist ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaUidWhitelist:Ljava/util/HashSet;

    invoke-virtual {v4}, Ljava/util/HashSet;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " items):"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1423
    iget-object v3, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaUidWhitelist:Ljava/util/HashSet;

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 1424
    .local v2, "uid":Ljava/lang/Integer;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_1

    .line 1426
    .end local v2    # "uid":Ljava/lang/Integer;
    :cond_1
    return-void
.end method

.method public isWhitelisted(Lcom/android/server/AlarmManagerService$Alarm;)Z
    .locals 5
    .param p1, "alarm"    # Lcom/android/server/AlarmManagerService$Alarm;

    .prologue
    .line 1372
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mLock:Ljava/lang/Object;
    invoke-static {v2}, Lcom/android/server/AlarmManagerService;->access$700(Lcom/android/server/AlarmManagerService;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 1373
    :try_start_0
    iget-object v2, p1, Lcom/android/server/AlarmManagerService$Alarm;->operation:Landroid/app/PendingIntent;

    invoke-virtual {v2}, Landroid/app/PendingIntent;->getTargetPackage()Ljava/lang/String;

    move-result-object v0

    .line 1374
    .local v0, "packageName":Ljava/lang/String;
    iget v1, p1, Lcom/android/server/AlarmManagerService$Alarm;->uid:I

    .line 1375
    .local v1, "uid":I
    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaInternalWhitelist:Ljava/util/HashSet;

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1376
    const/4 v2, 0x1

    monitor-exit v3

    .line 1378
    :goto_0
    return v2

    :cond_0
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaUidWhitelist:Ljava/util/HashSet;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    monitor-exit v3

    goto :goto_0

    .line 1379
    .end local v0    # "packageName":Ljava/lang/String;
    .end local v1    # "uid":I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public onEmergencySMS(J)V
    .locals 13
    .param p1, "postponeTime"    # J

    .prologue
    .line 1446
    iget-object v0, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/AlarmManagerService;->access$700(Lcom/android/server/AlarmManagerService;)Ljava/lang/Object;

    move-result-object v12

    monitor-enter v12

    .line 1447
    :try_start_0
    iget v0, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mPowerState:I

    if-eqz v0, :cond_0

    .line 1448
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1449
    .local v4, "rtc":J
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    .line 1451
    .local v10, "elapsed":J
    iget-wide v0, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mEmergencyTimeOut:J

    cmp-long v0, v0, v4

    if-gtz v0, :cond_0

    .line 1452
    add-long v0, v4, p1

    iput-wide v0, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mEmergencyTimeOut:J

    .line 1453
    iget-object v0, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mRtcWakeupAlarms:Lcom/android/server/StaminaArrayList;
    invoke-static {v0}, Lcom/android/server/AlarmManagerService;->access$800(Lcom/android/server/AlarmManagerService;)Lcom/android/server/StaminaArrayList;

    move-result-object v1

    move-object v0, p0

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/server/AlarmManagerService$StaminaController;->postponeAlarmsLocked(Lcom/android/server/StaminaArrayList;JJ)V

    .line 1454
    iget-object v0, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mRtcAlarms:Lcom/android/server/StaminaArrayList;
    invoke-static {v0}, Lcom/android/server/AlarmManagerService;->access$1000(Lcom/android/server/AlarmManagerService;)Lcom/android/server/StaminaArrayList;

    move-result-object v1

    move-object v0, p0

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/server/AlarmManagerService$StaminaController;->postponeAlarmsLocked(Lcom/android/server/StaminaArrayList;JJ)V

    .line 1455
    iget-object v0, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mElapsedRealtimeWakeupAlarms:Lcom/android/server/StaminaArrayList;
    invoke-static {v0}, Lcom/android/server/AlarmManagerService;->access$1100(Lcom/android/server/AlarmManagerService;)Lcom/android/server/StaminaArrayList;

    move-result-object v7

    move-object v6, p0

    move-wide v8, p1

    invoke-direct/range {v6 .. v11}, Lcom/android/server/AlarmManagerService$StaminaController;->postponeAlarmsLocked(Lcom/android/server/StaminaArrayList;JJ)V

    .line 1456
    iget-object v0, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mElapsedRealtimeAlarms:Lcom/android/server/StaminaArrayList;
    invoke-static {v0}, Lcom/android/server/AlarmManagerService;->access$1200(Lcom/android/server/AlarmManagerService;)Lcom/android/server/StaminaArrayList;

    move-result-object v7

    move-object v6, p0

    move-wide v8, p1

    invoke-direct/range {v6 .. v11}, Lcom/android/server/AlarmManagerService$StaminaController;->postponeAlarmsLocked(Lcom/android/server/StaminaArrayList;JJ)V

    .line 1459
    .end local v4    # "rtc":J
    .end local v10    # "elapsed":J
    :cond_0
    monitor-exit v12

    .line 1460
    return-void

    .line 1459
    :catchall_0
    move-exception v0

    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeWhitelistedUid(I)V
    .locals 5
    .param p1, "uid"    # I

    .prologue
    .line 1317
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mLock:Ljava/lang/Object;
    invoke-static {v2}, Lcom/android/server/AlarmManagerService;->access$700(Lcom/android/server/AlarmManagerService;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 1318
    :try_start_0
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mSuperStaminaUidWhitelist:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1319
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 1320
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/StaminaArrayList;

    .line 1321
    .local v0, "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    invoke-virtual {v0}, Lcom/android/server/StaminaArrayList;->update()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0, v0}, Lcom/android/server/AlarmManagerService$StaminaController;->triggerAlarmLocked(Lcom/android/server/StaminaArrayList;)V

    .line 1319
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1324
    .end local v0    # "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    .end local v1    # "i":I
    :cond_1
    monitor-exit v3

    .line 1325
    return-void

    .line 1324
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public resumeAlarmsAfter(JJ)V
    .locals 4
    .param p1, "rtc"    # J
    .param p3, "elapsed"    # J

    .prologue
    .line 1297
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mLock:Ljava/lang/Object;
    invoke-static {v2}, Lcom/android/server/AlarmManagerService;->access$700(Lcom/android/server/AlarmManagerService;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 1298
    :try_start_0
    iget v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mPowerState:I

    if-nez v2, :cond_0

    monitor-exit v3

    .line 1304
    :goto_0
    return-void

    .line 1299
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 1300
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/StaminaArrayList;

    .line 1301
    .local v0, "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/android/server/StaminaArrayList;->resumeAlarmsAfter(JJ)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0, v0}, Lcom/android/server/AlarmManagerService$StaminaController;->triggerAlarmLocked(Lcom/android/server/StaminaArrayList;)V

    .line 1299
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1303
    .end local v0    # "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    :cond_2
    monitor-exit v3

    goto :goto_0

    .end local v1    # "i":I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public setPowerState(I)V
    .locals 2
    .param p1, "state"    # I

    .prologue
    .line 1388
    iget-object v0, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mLock:Ljava/lang/Object;
    invoke-static {v0}, Lcom/android/server/AlarmManagerService;->access$700(Lcom/android/server/AlarmManagerService;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 1389
    :try_start_0
    iput p1, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mPowerState:I

    .line 1390
    packed-switch p1, :pswitch_data_0

    .line 1403
    :goto_0
    monitor-exit v1

    .line 1404
    return-void

    .line 1392
    :pswitch_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/server/AlarmManagerService$StaminaController;->suppressAlarms(Z)V

    goto :goto_0

    .line 1403
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 1396
    :pswitch_1
    const/4 v0, 0x1

    :try_start_1
    invoke-virtual {p0, v0}, Lcom/android/server/AlarmManagerService$StaminaController;->suppressAlarms(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1390
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public suppressAlarms(Z)V
    .locals 4
    .param p1, "suppress"    # Z

    .prologue
    .line 1354
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->this$0:Lcom/android/server/AlarmManagerService;

    # getter for: Lcom/android/server/AlarmManagerService;->mLock:Ljava/lang/Object;
    invoke-static {v2}, Lcom/android/server/AlarmManagerService;->access$700(Lcom/android/server/AlarmManagerService;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3

    .line 1356
    if-eqz p1, :cond_0

    :try_start_0
    iget v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mPowerState:I

    if-nez v2, :cond_0

    monitor-exit v3

    .line 1363
    :goto_0
    return-void

    .line 1357
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 1358
    iget-object v2, p0, Lcom/android/server/AlarmManagerService$StaminaController;->mAlarmArrays:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/StaminaArrayList;

    .line 1359
    .local v0, "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    invoke-virtual {v0, p1}, Lcom/android/server/StaminaArrayList;->suppressAlarms(Z)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0, v0}, Lcom/android/server/AlarmManagerService$StaminaController;->triggerAlarmLocked(Lcom/android/server/StaminaArrayList;)V

    .line 1357
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1362
    .end local v0    # "alarms":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<Lcom/android/server/AlarmManagerService$Alarm;>;"
    :cond_2
    monitor-exit v3

    goto :goto_0

    .end local v1    # "i":I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
