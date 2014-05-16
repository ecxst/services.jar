.class Lcom/android/server/power/ShutdownThread$5;
.super Ljava/lang/Thread;
.source "ShutdownThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/power/ShutdownThread;->shutdownRadios(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/power/ShutdownThread;

.field final synthetic val$done:[Z

.field final synthetic val$endTime:J


# direct methods
.method constructor <init>(Lcom/android/server/power/ShutdownThread;J[Z)V
    .locals 0

    .prologue
    .line 430
    iput-object p1, p0, Lcom/android/server/power/ShutdownThread$5;->this$0:Lcom/android/server/power/ShutdownThread;

    iput-wide p2, p0, Lcom/android/server/power/ShutdownThread$5;->val$endTime:J

    iput-object p4, p0, Lcom/android/server/power/ShutdownThread$5;->val$done:[Z

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 432
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 436
    .local v7, "startTime":J
    const-string v10, "phone"

    invoke-static {v10}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v10

    invoke-static {v10}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v5

    .line 438
    .local v5, "phone":Lcom/android/internal/telephony/ITelephony;
    const-string v10, "bluetooth_manager"

    invoke-static {v10}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v10

    invoke-static {v10}, Landroid/bluetooth/IBluetoothManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/bluetooth/IBluetoothManager;

    move-result-object v0

    .line 443
    .local v0, "bluetooth":Landroid/bluetooth/IBluetoothManager;
    if-eqz v0, :cond_0

    :try_start_0
    invoke-interface {v0}, Landroid/bluetooth/IBluetoothManager;->isEnabled()Z

    move-result v10

    if-nez v10, :cond_3

    :cond_0
    const/4 v1, 0x1

    .line 444
    .local v1, "bluetoothOff":Z
    :goto_0
    if-nez v1, :cond_1

    .line 445
    const-string v10, "ShutdownThread"

    const-string v11, "Disabling Bluetooth..."

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    const/4 v10, 0x0

    invoke-interface {v0, v10}, Landroid/bluetooth/IBluetoothManager;->disable(Z)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 454
    :cond_1
    :goto_1
    const/4 v6, 0x1

    .line 455
    .local v6, "radioOff":Z
    :try_start_1
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v10

    invoke-virtual {v10}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 456
    const-string v10, "phone_msim"

    invoke-static {v10}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v10

    invoke-static {v10}, Lcom/android/internal/telephony/msim/ITelephonyMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ITelephonyMSim;

    move-result-object v4

    .line 458
    .local v4, "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    if-eqz v4, :cond_7

    .line 461
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v10

    invoke-virtual {v10}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v10

    if-ge v3, v10, :cond_7

    .line 463
    if-eqz v6, :cond_4

    invoke-interface {v4, v3}, Lcom/android/internal/telephony/msim/ITelephonyMSim;->isRadioOn(I)Z

    move-result v10

    if-nez v10, :cond_4

    const/4 v6, 0x1

    .line 464
    :goto_3
    invoke-interface {v4, v3}, Lcom/android/internal/telephony/msim/ITelephonyMSim;->isRadioOn(I)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 465
    const-string v10, "ShutdownThread"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Turning off radio on Subscription :"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    const/4 v10, 0x0

    invoke-interface {v4, v10, v3}, Lcom/android/internal/telephony/msim/ITelephonyMSim;->setRadio(ZI)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 462
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 443
    .end local v1    # "bluetoothOff":Z
    .end local v3    # "i":I
    .end local v4    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    .end local v6    # "radioOff":Z
    :cond_3
    const/4 v1, 0x0

    goto :goto_0

    .line 448
    :catch_0
    move-exception v2

    .line 449
    .local v2, "ex":Landroid/os/RemoteException;
    const-string v10, "ShutdownThread"

    const-string v11, "RemoteException during bluetooth shutdown"

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 450
    const/4 v1, 0x1

    .restart local v1    # "bluetoothOff":Z
    goto :goto_1

    .line 463
    .end local v2    # "ex":Landroid/os/RemoteException;
    .restart local v3    # "i":I
    .restart local v4    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    .restart local v6    # "radioOff":Z
    :cond_4
    const/4 v6, 0x0

    goto :goto_3

    .line 471
    .end local v3    # "i":I
    .end local v4    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    :cond_5
    if-eqz v5, :cond_6

    :try_start_2
    invoke-interface {v5}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z

    move-result v10

    if-nez v10, :cond_9

    :cond_6
    const/4 v6, 0x1

    .line 472
    :goto_4
    if-nez v6, :cond_7

    .line 473
    const-string v10, "ShutdownThread"

    const-string v11, "Turning off radio..."

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 474
    const/4 v10, 0x0

    invoke-interface {v5, v10}, Lcom/android/internal/telephony/ITelephony;->setRadio(Z)Z
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1

    .line 482
    :cond_7
    :goto_5
    const-string v10, "ShutdownThread"

    const-string v11, "Waiting for Bluetooth and Radio..."

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    :goto_6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    iget-wide v12, p0, Lcom/android/server/power/ShutdownThread$5;->val$endTime:J

    cmp-long v10, v10, v12

    if-gez v10, :cond_e

    .line 485
    if-nez v1, :cond_8

    .line 487
    :try_start_3
    invoke-interface {v0}, Landroid/bluetooth/IBluetoothManager;->isEnabled()Z
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_2

    move-result v10

    if-nez v10, :cond_a

    const/4 v1, 0x1

    .line 492
    :goto_7
    if-eqz v1, :cond_8

    .line 493
    const-string v10, "ShutdownThread"

    const-string v11, "Bluetooth turned off."

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    :cond_8
    if-nez v6, :cond_d

    .line 498
    const/4 v9, 0x1

    .line 499
    .local v9, "subRadioOff":Z
    :try_start_4
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v10

    invoke-virtual {v10}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v10

    if-eqz v10, :cond_10

    .line 500
    const-string v10, "phone_msim"

    invoke-static {v10}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v10

    invoke-static {v10}, Lcom/android/internal/telephony/msim/ITelephonyMSim$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/msim/ITelephonyMSim;

    move-result-object v4

    .line 502
    .restart local v4    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_8
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v10

    invoke-virtual {v10}, Landroid/telephony/MSimTelephonyManager;->getPhoneCount()I

    move-result v10

    if-ge v3, v10, :cond_c

    .line 504
    if-eqz v9, :cond_b

    invoke-interface {v4, v3}, Lcom/android/internal/telephony/msim/ITelephonyMSim;->isRadioOn(I)Z
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_3

    move-result v10

    if-nez v10, :cond_b

    const/4 v9, 0x1

    .line 503
    :goto_9
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 471
    .end local v3    # "i":I
    .end local v4    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    .end local v9    # "subRadioOff":Z
    :cond_9
    const/4 v6, 0x0

    goto :goto_4

    .line 477
    :catch_1
    move-exception v2

    .line 478
    .restart local v2    # "ex":Landroid/os/RemoteException;
    const-string v10, "ShutdownThread"

    const-string v11, "RemoteException during radio shutdown"

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 479
    const/4 v6, 0x1

    goto :goto_5

    .line 487
    .end local v2    # "ex":Landroid/os/RemoteException;
    :cond_a
    const/4 v1, 0x0

    goto :goto_7

    .line 488
    :catch_2
    move-exception v2

    .line 489
    .restart local v2    # "ex":Landroid/os/RemoteException;
    const-string v10, "ShutdownThread"

    const-string v11, "RemoteException during bluetooth shutdown"

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 490
    const/4 v1, 0x1

    goto :goto_7

    .line 504
    .end local v2    # "ex":Landroid/os/RemoteException;
    .restart local v3    # "i":I
    .restart local v4    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    .restart local v9    # "subRadioOff":Z
    :cond_b
    const/4 v9, 0x0

    goto :goto_9

    .line 506
    :cond_c
    move v6, v9

    .line 514
    .end local v3    # "i":I
    .end local v4    # "mphone":Lcom/android/internal/telephony/msim/ITelephonyMSim;
    :goto_a
    if-eqz v6, :cond_d

    .line 515
    const-string v10, "ShutdownThread"

    const-string v11, "Radio turned off."

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    .end local v9    # "subRadioOff":Z
    :cond_d
    if-eqz v6, :cond_12

    if-eqz v1, :cond_12

    .line 520
    const-string v10, "ShutdownThread"

    const-string v11, "Radio and Bluetooth shutdown complete."

    invoke-static {v10, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 521
    iget-object v10, p0, Lcom/android/server/power/ShutdownThread$5;->val$done:[Z

    const/4 v11, 0x0

    const/4 v12, 0x1

    aput-boolean v12, v10, v11

    .line 526
    :cond_e
    iget-object v10, p0, Lcom/android/server/power/ShutdownThread$5;->val$done:[Z

    const/4 v11, 0x0

    aget-boolean v10, v10, v11

    if-nez v10, :cond_f

    .line 527
    const-string v10, "ShutdownThread"

    const-string v11, "Timed out waiting for Radio and Bluetooth shutdown."

    invoke-static {v10, v11}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 529
    :cond_f
    iget-object v10, p0, Lcom/android/server/power/ShutdownThread$5;->this$0:Lcom/android/server/power/ShutdownThread;

    # getter for: Lcom/android/server/power/ShutdownThread;->mModemDone:Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-static {v10}, Lcom/android/server/power/ShutdownThread;->access$400(Lcom/android/server/power/ShutdownThread;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 530
    iget-object v10, p0, Lcom/android/server/power/ShutdownThread$5;->this$0:Lcom/android/server/power/ShutdownThread;

    invoke-virtual {v10}, Lcom/android/server/power/ShutdownThread;->actionDone()V

    .line 531
    return-void

    .line 508
    .restart local v9    # "subRadioOff":Z
    :cond_10
    :try_start_5
    invoke-interface {v5}, Lcom/android/internal/telephony/ITelephony;->isRadioOn()Z
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_3

    move-result v10

    if-nez v10, :cond_11

    const/4 v6, 0x1

    :goto_b
    goto :goto_a

    :cond_11
    const/4 v6, 0x0

    goto :goto_b

    .line 510
    :catch_3
    move-exception v2

    .line 511
    .restart local v2    # "ex":Landroid/os/RemoteException;
    const-string v10, "ShutdownThread"

    const-string v11, "RemoteException during radio shutdown"

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 512
    const/4 v6, 0x1

    goto :goto_a

    .line 524
    .end local v2    # "ex":Landroid/os/RemoteException;
    .end local v9    # "subRadioOff":Z
    :cond_12
    const-wide/16 v10, 0x1f4

    invoke-static {v10, v11}, Landroid/os/SystemClock;->sleep(J)V

    goto/16 :goto_6
.end method
