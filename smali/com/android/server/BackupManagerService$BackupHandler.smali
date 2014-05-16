.class Lcom/android/server/BackupManagerService$BackupHandler;
.super Landroid/os/Handler;
.source "BackupManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BackupHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/BackupManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/BackupManagerService;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 473
    iput-object p1, p0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    .line 474
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 475
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 39
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 479
    move-object/from16 v0, p1

    iget v5, v0, Landroid/os/Message;->what:I

    packed-switch v5, :pswitch_data_0

    .line 754
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 482
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/android/server/BackupManagerService;->mLastBackupPass:J

    .line 483
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-wide v6, v6, Lcom/android/server/BackupManagerService;->mLastBackupPass:J

    const-wide/32 v8, 0x36ee80

    add-long/2addr v6, v8

    iput-wide v6, v5, Lcom/android/server/BackupManagerService;->mNextBackupPass:J

    .line 485
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v6, Lcom/android/server/BackupManagerService;->mCurrentTransport:Ljava/lang/String;

    # invokes: Lcom/android/server/BackupManagerService;->getTransport(Ljava/lang/String;)Lcom/android/internal/backup/IBackupTransport;
    invoke-static {v5, v6}, Lcom/android/server/BackupManagerService;->access$100(Lcom/android/server/BackupManagerService;Ljava/lang/String;)Lcom/android/internal/backup/IBackupTransport;

    move-result-object v36

    .line 486
    .local v36, "transport":Lcom/android/internal/backup/IBackupTransport;
    if-nez v36, :cond_1

    .line 487
    const-string v5, "BackupManagerService"

    const-string v6, "Backup requested but no transport available"

    invoke-static {v5, v6}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v5, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v6

    .line 489
    :try_start_0
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    const/4 v7, 0x0

    iput-boolean v7, v5, Lcom/android/server/BackupManagerService;->mBackupRunning:Z

    .line 490
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 491
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_0

    .line 490
    :catchall_0
    move-exception v5

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v5

    .line 496
    :cond_1
    new-instance v30, Ljava/util/ArrayList;

    invoke-direct/range {v30 .. v30}, Ljava/util/ArrayList;-><init>()V

    .line 497
    .local v30, "queue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/BackupManagerService$BackupRequest;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v0, v5, Lcom/android/server/BackupManagerService;->mJournal:Ljava/io/File;

    move-object/from16 v24, v0

    .line 498
    .local v24, "oldJournal":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v5, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v6

    .line 502
    :try_start_2
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mPendingBackups:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->size()I

    move-result v5

    if-lez v5, :cond_3

    .line 503
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mPendingBackups:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v22

    .local v22, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/android/server/BackupManagerService$BackupRequest;

    .line 504
    .local v19, "b":Lcom/android/server/BackupManagerService$BackupRequest;
    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 513
    .end local v19    # "b":Lcom/android/server/BackupManagerService$BackupRequest;
    .end local v22    # "i$":Ljava/util/Iterator;
    :catchall_1
    move-exception v5

    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v5

    .line 506
    .restart local v22    # "i$":Ljava/util/Iterator;
    :cond_2
    :try_start_3
    const-string v5, "BackupManagerService"

    const-string v7, "clearing pending backups"

    invoke-static {v5, v7}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mPendingBackups:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    .line 510
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    const/4 v7, 0x0

    iput-object v7, v5, Lcom/android/server/BackupManagerService;->mJournal:Ljava/io/File;

    .line 513
    .end local v22    # "i$":Ljava/util/Iterator;
    :cond_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 520
    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_4

    .line 522
    new-instance v26, Lcom/android/server/BackupManagerService$PerformBackupTask;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v26

    move-object/from16 v1, v36

    move-object/from16 v2, v30

    move-object/from16 v3, v24

    invoke-direct {v0, v5, v1, v2, v3}, Lcom/android/server/BackupManagerService$PerformBackupTask;-><init>(Lcom/android/server/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Ljava/util/ArrayList;Ljava/io/File;)V

    .line 523
    .local v26, "pbt":Lcom/android/server/BackupManagerService$PerformBackupTask;
    const/16 v5, 0x14

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v5, v1}, Lcom/android/server/BackupManagerService$BackupHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v27

    .line 524
    .local v27, "pbtMessage":Landroid/os/Message;
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$BackupHandler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 526
    .end local v26    # "pbt":Lcom/android/server/BackupManagerService$PerformBackupTask;
    .end local v27    # "pbtMessage":Landroid/os/Message;
    :cond_4
    const-string v5, "BackupManagerService"

    const-string v6, "Backup requested but nothing pending"

    invoke-static {v5, v6}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 527
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v5, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v6

    .line 528
    :try_start_4
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    const/4 v7, 0x0

    iput-boolean v7, v5, Lcom/android/server/BackupManagerService;->mBackupRunning:Z

    .line 529
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 530
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    .line 529
    :catchall_2
    move-exception v5

    :try_start_5
    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v5

    .line 538
    .end local v24    # "oldJournal":Ljava/io/File;
    .end local v30    # "queue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/BackupManagerService$BackupRequest;>;"
    .end local v36    # "transport":Lcom/android/internal/backup/IBackupTransport;
    :pswitch_2
    :try_start_6
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Lcom/android/server/BackupManagerService$BackupRestoreTask;

    .line 540
    .local v4, "task":Lcom/android/server/BackupManagerService$BackupRestoreTask;
    invoke-interface {v4}, Lcom/android/server/BackupManagerService$BackupRestoreTask;->execute()V
    :try_end_6
    .catch Ljava/lang/ClassCastException; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_0

    .line 541
    .end local v4    # "task":Lcom/android/server/BackupManagerService$BackupRestoreTask;
    :catch_0
    move-exception v20

    .line 542
    .local v20, "e":Ljava/lang/ClassCastException;
    const-string v5, "BackupManagerService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid backup task in flight, obj="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    iget-object v7, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 550
    .end local v20    # "e":Ljava/lang/ClassCastException;
    :pswitch_3
    :try_start_7
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Lcom/android/server/BackupManagerService$BackupRestoreTask;

    .line 551
    .restart local v4    # "task":Lcom/android/server/BackupManagerService$BackupRestoreTask;
    invoke-interface {v4}, Lcom/android/server/BackupManagerService$BackupRestoreTask;->operationComplete()V
    :try_end_7
    .catch Ljava/lang/ClassCastException; {:try_start_7 .. :try_end_7} :catch_1

    goto/16 :goto_0

    .line 552
    .end local v4    # "task":Lcom/android/server/BackupManagerService$BackupRestoreTask;
    :catch_1
    move-exception v20

    .line 553
    .restart local v20    # "e":Ljava/lang/ClassCastException;
    const-string v5, "BackupManagerService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid completion in flight, obj="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p1

    iget-object v7, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 562
    .end local v20    # "e":Ljava/lang/ClassCastException;
    :pswitch_4
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v25, v0

    check-cast v25, Lcom/android/server/BackupManagerService$FullBackupParams;

    .line 563
    .local v25, "params":Lcom/android/server/BackupManagerService$FullBackupParams;
    new-instance v4, Lcom/android/server/BackupManagerService$PerformFullBackupTask;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v25

    iget-object v6, v0, Lcom/android/server/BackupManagerService$FullParams;->fd:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v0, v25

    iget-object v7, v0, Lcom/android/server/BackupManagerService$FullParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;

    move-object/from16 v0, v25

    iget-boolean v8, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->includeApks:Z

    move-object/from16 v0, v25

    iget-boolean v9, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->includeObbs:Z

    move-object/from16 v0, v25

    iget-boolean v10, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->includeShared:Z

    move-object/from16 v0, v25

    iget-object v11, v0, Lcom/android/server/BackupManagerService$FullParams;->curPassword:Ljava/lang/String;

    move-object/from16 v0, v25

    iget-object v12, v0, Lcom/android/server/BackupManagerService$FullParams;->encryptPassword:Ljava/lang/String;

    move-object/from16 v0, v25

    iget-boolean v13, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->allApps:Z

    move-object/from16 v0, v25

    iget-boolean v14, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->includeSystem:Z

    move-object/from16 v0, v25

    iget-object v15, v0, Lcom/android/server/BackupManagerService$FullBackupParams;->packages:[Ljava/lang/String;

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/BackupManagerService$FullParams;->latch:Ljava/util/concurrent/atomic/AtomicBoolean;

    move-object/from16 v16, v0

    invoke-direct/range {v4 .. v16}, Lcom/android/server/BackupManagerService$PerformFullBackupTask;-><init>(Lcom/android/server/BackupManagerService;Landroid/os/ParcelFileDescriptor;Landroid/app/backup/IFullBackupRestoreObserver;ZZZLjava/lang/String;Ljava/lang/String;ZZ[Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 567
    .local v4, "task":Lcom/android/server/BackupManagerService$PerformFullBackupTask;
    new-instance v5, Ljava/lang/Thread;

    invoke-direct {v5, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 573
    .end local v4    # "task":Lcom/android/server/BackupManagerService$PerformFullBackupTask;
    .end local v25    # "params":Lcom/android/server/BackupManagerService$FullBackupParams;
    :pswitch_5
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v25, v0

    check-cast v25, Lcom/android/server/BackupManagerService$RestoreParams;

    .line 574
    .local v25, "params":Lcom/android/server/BackupManagerService$RestoreParams;
    const-string v5, "BackupManagerService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "MSG_RUN_RESTORE observer="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v25

    iget-object v7, v0, Lcom/android/server/BackupManagerService$RestoreParams;->observer:Landroid/app/backup/IRestoreObserver;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 575
    new-instance v4, Lcom/android/server/BackupManagerService$PerformRestoreTask;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v25

    iget-object v6, v0, Lcom/android/server/BackupManagerService$RestoreParams;->transport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v0, v25

    iget-object v7, v0, Lcom/android/server/BackupManagerService$RestoreParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v25

    iget-wide v8, v0, Lcom/android/server/BackupManagerService$RestoreParams;->token:J

    move-object/from16 v0, v25

    iget-object v10, v0, Lcom/android/server/BackupManagerService$RestoreParams;->pkgInfo:Landroid/content/pm/PackageInfo;

    move-object/from16 v0, v25

    iget v11, v0, Lcom/android/server/BackupManagerService$RestoreParams;->pmToken:I

    move-object/from16 v0, v25

    iget-boolean v12, v0, Lcom/android/server/BackupManagerService$RestoreParams;->needFullBackup:Z

    move-object/from16 v0, v25

    iget-object v13, v0, Lcom/android/server/BackupManagerService$RestoreParams;->filterSet:[Ljava/lang/String;

    invoke-direct/range {v4 .. v13}, Lcom/android/server/BackupManagerService$PerformRestoreTask;-><init>(Lcom/android/server/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Landroid/app/backup/IRestoreObserver;JLandroid/content/pm/PackageInfo;IZ[Ljava/lang/String;)V

    .line 579
    .local v4, "task":Lcom/android/server/BackupManagerService$PerformRestoreTask;
    const/16 v5, 0x14

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v4}, Lcom/android/server/BackupManagerService$BackupHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v34

    .line 580
    .local v34, "restoreMsg":Landroid/os/Message;
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService$BackupHandler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    .line 588
    .end local v4    # "task":Lcom/android/server/BackupManagerService$PerformRestoreTask;
    .end local v25    # "params":Lcom/android/server/BackupManagerService$RestoreParams;
    .end local v34    # "restoreMsg":Landroid/os/Message;
    :pswitch_6
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v25, v0

    check-cast v25, Lcom/android/server/BackupManagerService$FullRestoreParams;

    .line 589
    .local v25, "params":Lcom/android/server/BackupManagerService$FullRestoreParams;
    new-instance v4, Lcom/android/server/BackupManagerService$PerformFullRestoreTask;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v25

    iget-object v6, v0, Lcom/android/server/BackupManagerService$FullParams;->fd:Landroid/os/ParcelFileDescriptor;

    move-object/from16 v0, v25

    iget-object v7, v0, Lcom/android/server/BackupManagerService$FullParams;->curPassword:Ljava/lang/String;

    move-object/from16 v0, v25

    iget-object v8, v0, Lcom/android/server/BackupManagerService$FullParams;->encryptPassword:Ljava/lang/String;

    move-object/from16 v0, v25

    iget-object v9, v0, Lcom/android/server/BackupManagerService$FullParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;

    move-object/from16 v0, v25

    iget-object v10, v0, Lcom/android/server/BackupManagerService$FullParams;->latch:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct/range {v4 .. v10}, Lcom/android/server/BackupManagerService$PerformFullRestoreTask;-><init>(Lcom/android/server/BackupManagerService;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;Ljava/lang/String;Landroid/app/backup/IFullBackupRestoreObserver;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 592
    .local v4, "task":Lcom/android/server/BackupManagerService$PerformFullRestoreTask;
    new-instance v5, Ljava/lang/Thread;

    invoke-direct {v5, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 598
    .end local v4    # "task":Lcom/android/server/BackupManagerService$PerformFullRestoreTask;
    .end local v25    # "params":Lcom/android/server/BackupManagerService$FullRestoreParams;
    :pswitch_7
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v25, v0

    check-cast v25, Lcom/android/server/BackupManagerService$ClearParams;

    .line 599
    .local v25, "params":Lcom/android/server/BackupManagerService$ClearParams;
    new-instance v5, Lcom/android/server/BackupManagerService$PerformClearTask;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v25

    iget-object v7, v0, Lcom/android/server/BackupManagerService$ClearParams;->transport:Lcom/android/internal/backup/IBackupTransport;

    move-object/from16 v0, v25

    iget-object v8, v0, Lcom/android/server/BackupManagerService$ClearParams;->packageInfo:Landroid/content/pm/PackageInfo;

    invoke-direct {v5, v6, v7, v8}, Lcom/android/server/BackupManagerService$PerformClearTask;-><init>(Lcom/android/server/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Landroid/content/pm/PackageInfo;)V

    invoke-virtual {v5}, Lcom/android/server/BackupManagerService$PerformClearTask;->run()V

    goto/16 :goto_0

    .line 608
    .end local v25    # "params":Lcom/android/server/BackupManagerService$ClearParams;
    :pswitch_8
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v5, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v6

    .line 609
    :try_start_8
    new-instance v31, Ljava/util/HashSet;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mPendingInits:Ljava/util/HashSet;

    move-object/from16 v0, v31

    invoke-direct {v0, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 610
    .local v31, "queue":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mPendingInits:Ljava/util/HashSet;

    invoke-virtual {v5}, Ljava/util/HashSet;->clear()V

    .line 611
    monitor-exit v6
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 613
    new-instance v5, Lcom/android/server/BackupManagerService$PerformInitializeTask;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v31

    invoke-direct {v5, v6, v0}, Lcom/android/server/BackupManagerService$PerformInitializeTask;-><init>(Lcom/android/server/BackupManagerService;Ljava/util/HashSet;)V

    invoke-virtual {v5}, Lcom/android/server/BackupManagerService$PerformInitializeTask;->run()V

    goto/16 :goto_0

    .line 611
    .end local v31    # "queue":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :catchall_3
    move-exception v5

    :try_start_9
    monitor-exit v6
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    throw v5

    .line 620
    :pswitch_9
    const/16 v35, 0x0

    .line 621
    .local v35, "sets":[Landroid/app/backup/RestoreSet;
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v25, v0

    check-cast v25, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;

    .line 623
    .local v25, "params":Lcom/android/server/BackupManagerService$RestoreGetSetsParams;
    :try_start_a
    move-object/from16 v0, v25

    iget-object v5, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->transport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v5}, Lcom/android/internal/backup/IBackupTransport;->getAvailableRestoreSets()[Landroid/app/backup/RestoreSet;

    move-result-object v35

    .line 625
    move-object/from16 v0, v25

    iget-object v6, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->session:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    monitor-enter v6
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 626
    :try_start_b
    move-object/from16 v0, v25

    iget-object v5, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->session:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    move-object/from16 v0, v35

    iput-object v0, v5, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mRestoreSets:[Landroid/app/backup/RestoreSet;

    .line 627
    monitor-exit v6
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 628
    if-nez v35, :cond_5

    const/16 v5, 0xb0f

    const/4 v6, 0x0

    :try_start_c
    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v5, v6}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    .line 632
    :cond_5
    move-object/from16 v0, v25

    iget-object v5, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    if-eqz v5, :cond_6

    .line 634
    :try_start_d
    move-object/from16 v0, v25

    iget-object v5, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v35

    invoke-interface {v5, v0}, Landroid/app/backup/IRestoreObserver;->restoreSetsAvailable([Landroid/app/backup/RestoreSet;)V
    :try_end_d
    .catch Landroid/os/RemoteException; {:try_start_d .. :try_end_d} :catch_3
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4

    .line 643
    :cond_6
    :goto_2
    const/16 v5, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/server/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 644
    const/16 v5, 0x8

    const-wide/32 v6, 0xea60

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6, v7}, Lcom/android/server/BackupManagerService$BackupHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 646
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    .line 627
    :catchall_4
    move-exception v5

    :try_start_e
    monitor-exit v6
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    :try_start_f
    throw v5
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_2
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    .line 629
    :catch_2
    move-exception v20

    .line 630
    .local v20, "e":Ljava/lang/Exception;
    :try_start_10
    const-string v5, "BackupManagerService"

    const-string v6, "Error from transport getting set list"

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    .line 632
    move-object/from16 v0, v25

    iget-object v5, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    if-eqz v5, :cond_7

    .line 634
    :try_start_11
    move-object/from16 v0, v25

    iget-object v5, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v35

    invoke-interface {v5, v0}, Landroid/app/backup/IRestoreObserver;->restoreSetsAvailable([Landroid/app/backup/RestoreSet;)V
    :try_end_11
    .catch Landroid/os/RemoteException; {:try_start_11 .. :try_end_11} :catch_5
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_6

    .line 643
    :cond_7
    :goto_3
    const/16 v5, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/server/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 644
    const/16 v5, 0x8

    const-wide/32 v6, 0xea60

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6, v7}, Lcom/android/server/BackupManagerService$BackupHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 646
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    .line 635
    .end local v20    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v32

    .line 636
    .local v32, "re":Landroid/os/RemoteException;
    const-string v5, "BackupManagerService"

    const-string v6, "Unable to report listing to observer"

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 637
    .end local v32    # "re":Landroid/os/RemoteException;
    :catch_4
    move-exception v20

    .line 638
    .restart local v20    # "e":Ljava/lang/Exception;
    const-string v5, "BackupManagerService"

    const-string v6, "Restore observer threw"

    move-object/from16 v0, v20

    invoke-static {v5, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 635
    :catch_5
    move-exception v32

    .line 636
    .restart local v32    # "re":Landroid/os/RemoteException;
    const-string v5, "BackupManagerService"

    const-string v6, "Unable to report listing to observer"

    invoke-static {v5, v6}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 637
    .end local v32    # "re":Landroid/os/RemoteException;
    :catch_6
    move-exception v20

    .line 638
    const-string v5, "BackupManagerService"

    const-string v6, "Restore observer threw"

    move-object/from16 v0, v20

    invoke-static {v5, v6, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 632
    .end local v20    # "e":Ljava/lang/Exception;
    :catchall_5
    move-exception v5

    move-object/from16 v0, v25

    iget-object v6, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    if-eqz v6, :cond_8

    .line 634
    :try_start_12
    move-object/from16 v0, v25

    iget-object v6, v0, Lcom/android/server/BackupManagerService$RestoreGetSetsParams;->observer:Landroid/app/backup/IRestoreObserver;

    move-object/from16 v0, v35

    invoke-interface {v6, v0}, Landroid/app/backup/IRestoreObserver;->restoreSetsAvailable([Landroid/app/backup/RestoreSet;)V
    :try_end_12
    .catch Landroid/os/RemoteException; {:try_start_12 .. :try_end_12} :catch_7
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_8

    .line 643
    :cond_8
    :goto_4
    const/16 v6, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/android/server/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 644
    const/16 v6, 0x8

    const-wide/32 v7, 0xea60

    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v7, v8}, Lcom/android/server/BackupManagerService$BackupHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 646
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v6, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->release()V

    throw v5

    .line 635
    :catch_7
    move-exception v32

    .line 636
    .restart local v32    # "re":Landroid/os/RemoteException;
    const-string v6, "BackupManagerService"

    const-string v7, "Unable to report listing to observer"

    invoke-static {v6, v7}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 637
    .end local v32    # "re":Landroid/os/RemoteException;
    :catch_8
    move-exception v20

    .line 638
    .restart local v20    # "e":Ljava/lang/Exception;
    const-string v6, "BackupManagerService"

    const-string v7, "Restore observer threw"

    move-object/from16 v0, v20

    invoke-static {v6, v7, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    .line 653
    .end local v20    # "e":Ljava/lang/Exception;
    .end local v25    # "params":Lcom/android/server/BackupManagerService$RestoreGetSetsParams;
    .end local v35    # "sets":[Landroid/app/backup/RestoreSet;
    :pswitch_a
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, p1

    iget v6, v0, Landroid/os/Message;->arg1:I

    move-object/from16 v0, p1

    iget-object v7, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v5, v6, v7}, Lcom/android/server/BackupManagerService;->handleTimeout(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 659
    :pswitch_b
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    monitor-enter v6

    .line 660
    :try_start_13
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    if-eqz v5, :cond_9

    .line 665
    const-string v5, "BackupManagerService"

    const-string v7, "Restore session timed out; aborting"

    invoke-static {v5, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 666
    new-instance v5, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, v7, Lcom/android/server/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v9, v9, Lcom/android/server/BackupManagerService;->mActiveRestoreSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    invoke-direct {v5, v7, v8, v9}, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;-><init>(Lcom/android/server/BackupManagerService$ActiveRestoreSession;Lcom/android/server/BackupManagerService;Lcom/android/server/BackupManagerService$ActiveRestoreSession;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/server/BackupManagerService$BackupHandler;->post(Ljava/lang/Runnable;)Z

    .line 669
    :cond_9
    monitor-exit v6
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_7

    .line 674
    :pswitch_c
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v5, Lcom/android/server/BackupManagerService;->mFullConfirmations:Landroid/util/SparseArray;

    monitor-enter v6

    .line 675
    :try_start_14
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mFullConfirmations:Landroid/util/SparseArray;

    move-object/from16 v0, p1

    iget v7, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v5, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lcom/android/server/BackupManagerService$FullParams;

    .line 676
    .local v25, "params":Lcom/android/server/BackupManagerService$FullParams;
    if-eqz v25, :cond_b

    .line 677
    const-string v5, "BackupManagerService"

    const-string v7, "Full backup/restore timed out waiting for user confirmation"

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 680
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v25

    invoke-virtual {v5, v0}, Lcom/android/server/BackupManagerService;->signalFullBackupRestoreCompletion(Lcom/android/server/BackupManagerService$FullParams;)V

    .line 683
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mFullConfirmations:Landroid/util/SparseArray;

    move-object/from16 v0, p1

    iget v7, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v5, v7}, Landroid/util/SparseArray;->delete(I)V

    .line 686
    move-object/from16 v0, v25

    iget-object v5, v0, Lcom/android/server/BackupManagerService$FullParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_6

    if-eqz v5, :cond_a

    .line 688
    :try_start_15
    move-object/from16 v0, v25

    iget-object v5, v0, Lcom/android/server/BackupManagerService$FullParams;->observer:Landroid/app/backup/IFullBackupRestoreObserver;

    invoke-interface {v5}, Landroid/app/backup/IFullBackupRestoreObserver;->onTimeout()V
    :try_end_15
    .catch Landroid/os/RemoteException; {:try_start_15 .. :try_end_15} :catch_9
    .catchall {:try_start_15 .. :try_end_15} :catchall_6

    .line 696
    :cond_a
    :goto_5
    :try_start_16
    monitor-exit v6

    goto/16 :goto_0

    .end local v25    # "params":Lcom/android/server/BackupManagerService$FullParams;
    :catchall_6
    move-exception v5

    monitor-exit v6
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_6

    throw v5

    .line 669
    :catchall_7
    move-exception v5

    :try_start_17
    monitor-exit v6
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_7

    throw v5

    .line 694
    .restart local v25    # "params":Lcom/android/server/BackupManagerService$FullParams;
    :cond_b
    :try_start_18
    const-string v5, "BackupManagerService"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "couldn\'t find params for token "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    iget v8, v0, Landroid/os/Message;->arg1:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_6

    goto :goto_5

    .line 702
    .end local v25    # "params":Lcom/android/server/BackupManagerService$FullParams;
    :pswitch_d
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v23, v0

    check-cast v23, Landroid/content/Intent;

    .line 703
    .local v23, "intent":Landroid/content/Intent;
    invoke-virtual/range {v23 .. v23}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v17

    .line 704
    .local v17, "action":Ljava/lang/String;
    const/16 v33, 0x0

    .line 705
    .local v33, "replacing":Z
    const/16 v18, 0x0

    .line 706
    .local v18, "added":Z
    invoke-virtual/range {v23 .. v23}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v21

    .line 707
    .local v21, "extras":Landroid/os/Bundle;
    const/16 v28, 0x0

    .line 708
    .local v28, "pkgList":[Ljava/lang/String;
    const-string v5, "android.intent.action.PACKAGE_ADDED"

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    const-string v5, "android.intent.action.PACKAGE_REMOVED"

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    .line 710
    :cond_c
    invoke-virtual/range {v23 .. v23}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v38

    .line 711
    .local v38, "uri":Landroid/net/Uri;
    if-eqz v38, :cond_0

    .line 714
    invoke-virtual/range {v38 .. v38}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v29

    .line 715
    .local v29, "pkgName":Ljava/lang/String;
    if-eqz v29, :cond_d

    .line 716
    const/4 v5, 0x1

    new-array v0, v5, [Ljava/lang/String;

    move-object/from16 v28, v0

    .end local v28    # "pkgList":[Ljava/lang/String;
    const/4 v5, 0x0

    aput-object v29, v28, v5

    .line 718
    .restart local v28    # "pkgList":[Ljava/lang/String;
    :cond_d
    const-string v5, "android.intent.action.PACKAGE_ADDED"

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    .line 719
    const-string v5, "android.intent.extra.REPLACING"

    const/4 v6, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v33

    .line 728
    .end local v29    # "pkgName":Ljava/lang/String;
    .end local v38    # "uri":Landroid/net/Uri;
    :cond_e
    :goto_6
    if-eqz v28, :cond_0

    move-object/from16 v0, v28

    array-length v5, v0

    if-eqz v5, :cond_0

    .line 732
    const-string v5, "android.intent.extra.UID"

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v37

    .line 733
    .local v37, "uid":I
    if-eqz v18, :cond_12

    .line 734
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v5, Lcom/android/server/BackupManagerService;->mBackupParticipants:Landroid/util/SparseArray;

    monitor-enter v6

    .line 735
    if-eqz v33, :cond_f

    .line 738
    :try_start_19
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v28

    move/from16 v1, v37

    invoke-virtual {v5, v0, v1}, Lcom/android/server/BackupManagerService;->removePackageParticipantsLocked([Ljava/lang/String;I)V

    .line 740
    :cond_f
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v28

    invoke-virtual {v5, v0}, Lcom/android/server/BackupManagerService;->addPackageParticipantsLocked([Ljava/lang/String;)V

    .line 741
    monitor-exit v6

    goto/16 :goto_0

    :catchall_8
    move-exception v5

    monitor-exit v6
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_8

    throw v5

    .line 720
    .end local v37    # "uid":I
    :cond_10
    const-string v5, "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE"

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 721
    const/16 v18, 0x1

    .line 722
    const-string v5, "android.intent.extra.changed_package_list"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v28

    goto :goto_6

    .line 723
    :cond_11
    const-string v5, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 724
    const/16 v18, 0x0

    .line 725
    const-string v5, "android.intent.extra.changed_package_list"

    move-object/from16 v0, v23

    invoke-virtual {v0, v5}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v28

    goto :goto_6

    .line 743
    .restart local v37    # "uid":I
    :cond_12
    if-nez v33, :cond_0

    .line 746
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v6, v5, Lcom/android/server/BackupManagerService;->mBackupParticipants:Landroid/util/SparseArray;

    monitor-enter v6

    .line 747
    :try_start_1a
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/BackupManagerService$BackupHandler;->this$0:Lcom/android/server/BackupManagerService;

    move-object/from16 v0, v28

    move/from16 v1, v37

    invoke-virtual {v5, v0, v1}, Lcom/android/server/BackupManagerService;->removePackageParticipantsLocked([Ljava/lang/String;I)V

    .line 748
    monitor-exit v6

    goto/16 :goto_0

    :catchall_9
    move-exception v5

    monitor-exit v6
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_9

    throw v5

    .line 689
    .end local v17    # "action":Ljava/lang/String;
    .end local v18    # "added":Z
    .end local v21    # "extras":Landroid/os/Bundle;
    .end local v23    # "intent":Landroid/content/Intent;
    .end local v28    # "pkgList":[Ljava/lang/String;
    .end local v33    # "replacing":Z
    .end local v37    # "uid":I
    .restart local v25    # "params":Lcom/android/server/BackupManagerService$FullParams;
    :catch_9
    move-exception v5

    goto/16 :goto_5

    .line 479
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_6
        :pswitch_d
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
