.class Lcom/android/server/MountService$5;
.super Ljava/lang/Object;
.source "MountService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/MountService;->onEvent(ILjava/lang/String;[Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/MountService;

.field final synthetic val$code:I

.field final synthetic val$cooked:[Ljava/lang/String;

.field final synthetic val$raw:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/server/MountService;Ljava/lang/String;[Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 787
    iput-object p1, p0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    iput-object p2, p0, Lcom/android/server/MountService$5;->val$raw:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/server/MountService$5;->val$cooked:[Ljava/lang/String;

    iput p4, p0, Lcom/android/server/MountService$5;->val$code:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .prologue
    .line 801
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/server/MountService$5;->val$code:I

    const/16 v12, 0x25d

    if-ne v11, v12, :cond_1

    .line 807
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/MountService$5;->val$cooked:[Ljava/lang/String;

    const/4 v13, 0x2

    aget-object v12, v12, v13

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/MountService$5;->val$cooked:[Ljava/lang/String;

    const/4 v14, 0x3

    aget-object v13, v13, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/server/MountService$5;->val$cooked:[Ljava/lang/String;

    const/4 v15, 0x7

    aget-object v14, v14, v15

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/MountService$5;->val$cooked:[Ljava/lang/String;

    const/16 v16, 0xa

    aget-object v15, v15, v16

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    # invokes: Lcom/android/server/MountService;->notifyVolumeStateChange(Ljava/lang/String;Ljava/lang/String;II)V
    invoke-static {v11, v12, v13, v14, v15}, Lcom/android/server/MountService;->access$2200(Lcom/android/server/MountService;Ljava/lang/String;Ljava/lang/String;II)V

    .line 886
    :cond_0
    :goto_0
    return-void

    .line 810
    :cond_1
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/server/MountService$5;->val$code:I

    const/16 v12, 0x276

    if-eq v11, v12, :cond_2

    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/server/MountService$5;->val$code:I

    const/16 v12, 0x277

    if-eq v11, v12, :cond_2

    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/server/MountService$5;->val$code:I

    const/16 v12, 0x278

    if-ne v11, v12, :cond_0

    .line 816
    :cond_2
    const/4 v1, 0x0

    .line 817
    .local v1, "action":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->val$cooked:[Ljava/lang/String;

    const/4 v12, 0x2

    aget-object v5, v11, v12

    .line 818
    .local v5, "label":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->val$cooked:[Ljava/lang/String;

    const/4 v12, 0x3

    aget-object v8, v11, v12

    .line 819
    .local v8, "path":Ljava/lang/String;
    const/4 v6, -0x1

    .line 820
    .local v6, "major":I
    const/4 v7, -0x1

    .line 823
    .local v7, "minor":I
    :try_start_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->val$cooked:[Ljava/lang/String;

    const/4 v12, 0x6

    aget-object v11, v11, v12

    const/4 v12, 0x1

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/server/MountService$5;->val$cooked:[Ljava/lang/String;

    const/4 v14, 0x6

    aget-object v13, v13, v14

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 824
    .local v2, "devComp":Ljava/lang/String;
    const-string v11, ":"

    invoke-virtual {v2, v11}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 825
    .local v3, "devTok":[Ljava/lang/String;
    const/4 v11, 0x0

    aget-object v11, v3, v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 826
    const/4 v11, 0x1

    aget-object v11, v3, v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    .line 833
    .end local v2    # "devComp":Ljava/lang/String;
    .end local v3    # "devTok":[Ljava/lang/String;
    :goto_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    # getter for: Lcom/android/server/MountService;->mVolumesLock:Ljava/lang/Object;
    invoke-static {v11}, Lcom/android/server/MountService;->access$900(Lcom/android/server/MountService;)Ljava/lang/Object;

    move-result-object v12

    monitor-enter v12

    .line 834
    :try_start_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    # getter for: Lcom/android/server/MountService;->mVolumesByPath:Ljava/util/HashMap;
    invoke-static {v11}, Lcom/android/server/MountService;->access$1700(Lcom/android/server/MountService;)Ljava/util/HashMap;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/os/storage/StorageVolume;

    .line 835
    .local v10, "volume":Landroid/os/storage/StorageVolume;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    # getter for: Lcom/android/server/MountService;->mVolumeStates:Ljava/util/HashMap;
    invoke-static {v11}, Lcom/android/server/MountService;->access$2300(Lcom/android/server/MountService;)Ljava/util/HashMap;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 836
    .local v9, "state":Ljava/lang/String;
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 838
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/server/MountService$5;->val$code:I

    const/16 v12, 0x276

    if-ne v11, v12, :cond_3

    .line 839
    new-instance v11, Lcom/android/server/MountService$5$1;

    move-object/from16 v0, p0

    invoke-direct {v11, v0, v8}, Lcom/android/server/MountService$5$1;-><init>(Lcom/android/server/MountService$5;Ljava/lang/String;)V

    invoke-virtual {v11}, Lcom/android/server/MountService$5$1;->start()V

    .line 882
    :goto_2
    if-eqz v1, :cond_0

    .line 883
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    sget-object v12, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    # invokes: Lcom/android/server/MountService;->sendStorageIntent(Ljava/lang/String;Landroid/os/storage/StorageVolume;Landroid/os/UserHandle;)V
    invoke-static {v11, v1, v10, v12}, Lcom/android/server/MountService;->access$2500(Lcom/android/server/MountService;Ljava/lang/String;Landroid/os/storage/StorageVolume;Landroid/os/UserHandle;)V

    goto/16 :goto_0

    .line 827
    .end local v9    # "state":Ljava/lang/String;
    .end local v10    # "volume":Landroid/os/storage/StorageVolume;
    :catch_0
    move-exception v4

    .line 828
    .local v4, "ex":Ljava/lang/Exception;
    const-string v11, "MountService"

    const-string v12, "Failed to parse major/minor"

    invoke-static {v11, v12, v4}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 836
    .end local v4    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v11

    :try_start_2
    monitor-exit v12
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v11

    .line 852
    .restart local v9    # "state":Ljava/lang/String;
    .restart local v10    # "volume":Landroid/os/storage/StorageVolume;
    :cond_3
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/server/MountService$5;->val$code:I

    const/16 v12, 0x277

    if-ne v11, v12, :cond_4

    .line 856
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    invoke-virtual {v11, v8}, Lcom/android/server/MountService;->getVolumeState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "bad_removal"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 861
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    const-string v12, "unmounted"

    # invokes: Lcom/android/server/MountService;->updatePublicVolumeState(Landroid/os/storage/StorageVolume;Ljava/lang/String;)V
    invoke-static {v11, v10, v12}, Lcom/android/server/MountService;->access$1800(Lcom/android/server/MountService;Landroid/os/storage/StorageVolume;Ljava/lang/String;)V

    .line 862
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    const-string v12, "android.intent.action.MEDIA_UNMOUNTED"

    sget-object v13, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    # invokes: Lcom/android/server/MountService;->sendStorageIntent(Ljava/lang/String;Landroid/os/storage/StorageVolume;Landroid/os/UserHandle;)V
    invoke-static {v11, v12, v10, v13}, Lcom/android/server/MountService;->access$2500(Lcom/android/server/MountService;Ljava/lang/String;Landroid/os/storage/StorageVolume;Landroid/os/UserHandle;)V

    .line 865
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    const-string v12, "removed"

    # invokes: Lcom/android/server/MountService;->updatePublicVolumeState(Landroid/os/storage/StorageVolume;Ljava/lang/String;)V
    invoke-static {v11, v10, v12}, Lcom/android/server/MountService;->access$1800(Lcom/android/server/MountService;Landroid/os/storage/StorageVolume;Ljava/lang/String;)V

    .line 866
    const-string v1, "android.intent.action.MEDIA_REMOVED"

    goto :goto_2

    .line 867
    :cond_4
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/server/MountService$5;->val$code:I

    const/16 v12, 0x278

    if-ne v11, v12, :cond_5

    .line 870
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    const-string v12, "unmounted"

    # invokes: Lcom/android/server/MountService;->updatePublicVolumeState(Landroid/os/storage/StorageVolume;Ljava/lang/String;)V
    invoke-static {v11, v10, v12}, Lcom/android/server/MountService;->access$1800(Lcom/android/server/MountService;Landroid/os/storage/StorageVolume;Ljava/lang/String;)V

    .line 871
    const-string v1, "android.intent.action.MEDIA_UNMOUNTED"

    .line 874
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/MountService$5;->this$0:Lcom/android/server/MountService;

    const-string v12, "bad_removal"

    # invokes: Lcom/android/server/MountService;->updatePublicVolumeState(Landroid/os/storage/StorageVolume;Ljava/lang/String;)V
    invoke-static {v11, v10, v12}, Lcom/android/server/MountService;->access$1800(Lcom/android/server/MountService;Landroid/os/storage/StorageVolume;Ljava/lang/String;)V

    .line 875
    const-string v1, "android.intent.action.MEDIA_BAD_REMOVAL"

    goto :goto_2

    .line 876
    :cond_5
    move-object/from16 v0, p0

    iget v11, v0, Lcom/android/server/MountService$5;->val$code:I

    const/16 v12, 0x2bc

    if-ne v11, v12, :cond_6

    .line 877
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v11

    invoke-static {v11, v12}, Lcom/android/server/EventLogTags;->writeFstrimFinish(J)V

    goto :goto_2

    .line 879
    :cond_6
    const-string v11, "MountService"

    const-string v12, "Unknown code {%d}"

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/server/MountService$5;->val$code:I

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2
.end method
