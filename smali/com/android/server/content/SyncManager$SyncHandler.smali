.class Lcom/android/server/content/SyncManager$SyncHandler;
.super Landroid/os/Handler;
.source "SyncManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/content/SyncManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SyncHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;
    }
.end annotation


# static fields
.field private static final MESSAGE_CANCEL:I = 0x6

.field private static final MESSAGE_CHECK_ALARMS:I = 0x3

.field private static final MESSAGE_SERVICE_CONNECTED:I = 0x4

.field private static final MESSAGE_SERVICE_DISCONNECTED:I = 0x5

.field private static final MESSAGE_SYNC_ALARM:I = 0x2

.field private static final MESSAGE_SYNC_FINISHED:I = 0x1


# instance fields
.field private mAlarmScheduleTime:Ljava/lang/Long;

.field private volatile mReadyToRunLatch:Ljava/util/concurrent/CountDownLatch;

.field public final mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

.field public final mSyncTimeTracker:Lcom/android/server/content/SyncManager$SyncTimeTracker;

.field private final mWakeLocks:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/util/Pair",
            "<",
            "Landroid/accounts/Account;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/PowerManager$WakeLock;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/server/content/SyncManager;


# direct methods
.method public constructor <init>(Lcom/android/server/content/SyncManager;Landroid/os/Looper;)V
    .locals 3
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    const/4 v2, 0x0

    .line 1821
    iput-object p1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    .line 1822
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1754
    new-instance v0, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    invoke-direct {v0, p0}, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;-><init>(Lcom/android/server/content/SyncManager$SyncHandler;)V

    iput-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    .line 1755
    iput-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mAlarmScheduleTime:Ljava/lang/Long;

    .line 1756
    new-instance v0, Lcom/android/server/content/SyncManager$SyncTimeTracker;

    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    invoke-direct {v0, v1, v2}, Lcom/android/server/content/SyncManager$SyncTimeTracker;-><init>(Lcom/android/server/content/SyncManager;Lcom/android/server/content/SyncManager$1;)V

    iput-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncTimeTracker:Lcom/android/server/content/SyncManager$SyncTimeTracker;

    .line 1757
    invoke-static {}, Lcom/google/android/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mWakeLocks:Ljava/util/HashMap;

    .line 1760
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mReadyToRunLatch:Ljava/util/concurrent/CountDownLatch;

    .line 1823
    return-void
.end method

.method static synthetic access$1300(Lcom/android/server/content/SyncManager$SyncHandler;Landroid/accounts/Account;Ljava/lang/String;)Landroid/os/PowerManager$WakeLock;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/content/SyncManager$SyncHandler;
    .param p1, "x1"    # Landroid/accounts/Account;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 1745
    invoke-direct {p0, p1, p2}, Lcom/android/server/content/SyncManager$SyncHandler;->getSyncWakeLock(Landroid/accounts/Account;Ljava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1600(Lcom/android/server/content/SyncManager$SyncHandler;)Ljava/lang/Long;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/content/SyncManager$SyncHandler;

    .prologue
    .line 1745
    iget-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mAlarmScheduleTime:Ljava/lang/Long;

    return-object v0
.end method

.method private cancelActiveSyncLocked(Landroid/accounts/Account;ILjava/lang/String;)V
    .locals 4
    .param p1, "account"    # Landroid/accounts/Account;
    .param p2, "userId"    # I
    .param p3, "authority"    # Ljava/lang/String;

    .prologue
    .line 2365
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v3, v3, Lcom/android/server/content/SyncManager;->mActiveSyncContexts:Ljava/util/ArrayList;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 2367
    .local v1, "activeSyncs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/content/SyncManager$ActiveSyncContext;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;

    .line 2368
    .local v0, "activeSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    if-eqz v0, :cond_0

    .line 2370
    if-eqz p1, :cond_1

    .line 2371
    iget-object v3, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    iget-object v3, v3, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    invoke-virtual {p1, v3}, Landroid/accounts/Account;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2376
    :cond_1
    if-eqz p3, :cond_2

    .line 2377
    iget-object v3, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    iget-object v3, v3, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2382
    :cond_2
    const/4 v3, -0x1

    if-eq p2, v3, :cond_3

    iget-object v3, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    iget v3, v3, Lcom/android/server/content/SyncOperation;->userId:I

    if-ne p2, v3, :cond_0

    .line 2386
    :cond_3
    const/4 v3, 0x0

    invoke-direct {p0, v3, v0}, Lcom/android/server/content/SyncManager$SyncHandler;->runSyncFinishedOrCanceledLocked(Landroid/content/SyncResult;Lcom/android/server/content/SyncManager$ActiveSyncContext;)V

    goto :goto_0

    .line 2390
    .end local v0    # "activeSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    :cond_4
    return-void
.end method

.method private closeActiveSyncContext(Lcom/android/server/content/SyncManager$ActiveSyncContext;)V
    .locals 3
    .param p1, "activeSyncContext"    # Lcom/android/server/content/SyncManager$ActiveSyncContext;

    .prologue
    .line 2477
    invoke-virtual {p1}, Lcom/android/server/content/SyncManager$ActiveSyncContext;->close()V

    .line 2478
    iget-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v0, v0, Lcom/android/server/content/SyncManager;->mActiveSyncContexts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2479
    iget-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v0}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v0

    iget-object v1, p1, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncInfo:Landroid/content/SyncInfo;

    iget-object v2, p1, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    iget v2, v2, Lcom/android/server/content/SyncOperation;->userId:I

    invoke-virtual {v0, v1, v2}, Lcom/android/server/content/SyncStorageEngine;->removeActiveSync(Landroid/content/SyncInfo;I)V

    .line 2481
    return-void
.end method

.method private dispatchSyncOperation(Lcom/android/server/content/SyncOperation;)Z
    .locals 12
    .param p1, "op"    # Lcom/android/server/content/SyncOperation;

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x0

    .line 2308
    const-string v1, "SyncManager"

    invoke-static {v1, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2309
    const-string v1, "SyncManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchSyncOperation: we are going to sync "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2310
    const-string v1, "SyncManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "num active syncs: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v3, v3, Lcom/android/server/content/SyncManager;->mActiveSyncContexts:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2311
    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v1, v1, Lcom/android/server/content/SyncManager;->mActiveSyncContexts:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/server/content/SyncManager$ActiveSyncContext;

    .line 2312
    .local v9, "syncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    const-string v1, "SyncManager"

    invoke-virtual {v9}, Lcom/android/server/content/SyncManager$ActiveSyncContext;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 2317
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "syncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    :cond_0
    iget-object v1, p1, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    iget-object v2, p1, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    iget-object v2, v2, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/content/SyncAdapterType;->newKey(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SyncAdapterType;

    move-result-object v8

    .line 2319
    .local v8, "syncAdapterType":Landroid/content/SyncAdapterType;
    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v1, v1, Lcom/android/server/content/SyncManager;->mSyncAdapters:Landroid/content/SyncAdaptersCache;

    iget v2, p1, Lcom/android/server/content/SyncOperation;->userId:I

    invoke-virtual {v1, v8, v2}, Landroid/content/SyncAdaptersCache;->getServiceInfo(Ljava/lang/Object;I)Landroid/content/pm/RegisteredServicesCache$ServiceInfo;

    move-result-object v7

    .line 2320
    .local v7, "syncAdapterInfo":Landroid/content/pm/RegisteredServicesCache$ServiceInfo;, "Landroid/content/pm/RegisteredServicesCache$ServiceInfo<Landroid/content/SyncAdapterType;>;"
    if-nez v7, :cond_1

    .line 2321
    const-string v1, "SyncManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can\'t find a sync adapter for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", removing settings for it"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2323
    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v1}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v1

    iget-object v2, p1, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    iget v3, p1, Lcom/android/server/content/SyncOperation;->userId:I

    iget-object v4, p1, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4}, Lcom/android/server/content/SyncStorageEngine;->removeAuthority(Landroid/accounts/Account;ILjava/lang/String;)V

    move v1, v10

    .line 2340
    :goto_1
    return v1

    .line 2327
    :cond_1
    new-instance v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;

    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    invoke-virtual {p0, p1}, Lcom/android/server/content/SyncManager$SyncHandler;->insertStartSyncEvent(Lcom/android/server/content/SyncOperation;)J

    move-result-wide v3

    iget v5, v7, Landroid/content/pm/RegisteredServicesCache$ServiceInfo;->uid:I

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/server/content/SyncManager$ActiveSyncContext;-><init>(Lcom/android/server/content/SyncManager;Lcom/android/server/content/SyncOperation;JI)V

    .line 2329
    .local v0, "activeSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v1}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/server/content/SyncStorageEngine;->addActiveSync(Lcom/android/server/content/SyncManager$ActiveSyncContext;)Landroid/content/SyncInfo;

    move-result-object v1

    iput-object v1, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncInfo:Landroid/content/SyncInfo;

    .line 2330
    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v1, v1, Lcom/android/server/content/SyncManager;->mActiveSyncContexts:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2331
    const-string v1, "SyncManager"

    invoke-static {v1, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2332
    const-string v1, "SyncManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchSyncOperation: starting "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2334
    :cond_2
    iget v1, p1, Lcom/android/server/content/SyncOperation;->userId:I

    invoke-virtual {v0, v7, v1}, Lcom/android/server/content/SyncManager$ActiveSyncContext;->bindToSyncAdapter(Landroid/content/pm/RegisteredServicesCache$ServiceInfo;I)Z

    move-result v1

    if-nez v1, :cond_3

    .line 2335
    const-string v1, "SyncManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bind attempt failed to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2336
    invoke-direct {p0, v0}, Lcom/android/server/content/SyncManager$SyncHandler;->closeActiveSyncContext(Lcom/android/server/content/SyncManager$ActiveSyncContext;)V

    move v1, v10

    .line 2337
    goto :goto_1

    .line 2340
    :cond_3
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private getSyncWakeLock(Landroid/accounts/Account;Ljava/lang/String;)Landroid/os/PowerManager$WakeLock;
    .locals 5
    .param p1, "account"    # Landroid/accounts/Account;
    .param p2, "authority"    # Ljava/lang/String;

    .prologue
    .line 1773
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v2

    .line 1774
    .local v2, "wakeLockKey":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/accounts/Account;Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mWakeLocks:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager$WakeLock;

    .line 1775
    .local v1, "wakeLock":Landroid/os/PowerManager$WakeLock;
    if-nez v1, :cond_0

    .line 1776
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "*sync*_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1777
    .local v0, "name":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mPowerManager:Landroid/os/PowerManager;
    invoke-static {v3}, Lcom/android/server/content/SyncManager;->access$2200(Lcom/android/server/content/SyncManager;)Landroid/os/PowerManager;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4, v0}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    .line 1778
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 1779
    iget-object v3, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mWakeLocks:Ljava/util/HashMap;

    invoke-virtual {v3, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1781
    .end local v0    # "name":Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method private installHandleTooManyDeletesNotification(Landroid/accounts/Account;Ljava/lang/String;JI)V
    .locals 13
    .param p1, "account"    # Landroid/accounts/Account;
    .param p2, "authority"    # Ljava/lang/String;
    .param p3, "numDeletes"    # J
    .param p5, "userId"    # I

    .prologue
    .line 2678
    iget-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mNotificationMgr:Landroid/app/NotificationManager;
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$3600(Lcom/android/server/content/SyncManager;)Landroid/app/NotificationManager;

    move-result-object v2

    if-nez v2, :cond_1

    .line 2716
    :cond_0
    :goto_0
    return-void

    .line 2680
    :cond_1
    iget-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, p2, v3}, Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;

    move-result-object v11

    .line 2682
    .local v11, "providerInfo":Landroid/content/pm/ProviderInfo;
    if-eqz v11, :cond_0

    .line 2685
    iget-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v11, v2}, Landroid/content/pm/ProviderInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v8

    .line 2687
    .local v8, "authorityName":Ljava/lang/CharSequence;
    new-instance v4, Landroid/content/Intent;

    iget-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v2

    const-class v3, Landroid/content/SyncActivityTooManyDeletes;

    invoke-direct {v4, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2688
    .local v4, "clickIntent":Landroid/content/Intent;
    const-string v2, "account"

    invoke-virtual {v4, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2689
    const-string v2, "authority"

    invoke-virtual {v4, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2690
    const-string v2, "provider"

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2691
    const-string v2, "numDeletes"

    move-wide/from16 v0, p3

    invoke-virtual {v4, v2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 2693
    invoke-direct {p0, v4}, Lcom/android/server/content/SyncManager$SyncHandler;->isActivityAvailable(Landroid/content/Intent;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 2694
    const-string v2, "SyncManager"

    const-string v3, "No activity found to handle too many deletes."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 2698
    :cond_2
    iget-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    const/high16 v5, 0x10000000

    const/4 v6, 0x0

    new-instance v7, Landroid/os/UserHandle;

    move/from16 v0, p5

    invoke-direct {v7, v0}, Landroid/os/UserHandle;-><init>(I)V

    invoke-static/range {v2 .. v7}, Landroid/app/PendingIntent;->getActivityAsUser(Landroid/content/Context;ILandroid/content/Intent;ILandroid/os/Bundle;Landroid/os/UserHandle;)Landroid/app/PendingIntent;

    move-result-object v10

    .line 2702
    .local v10, "pendingIntent":Landroid/app/PendingIntent;
    iget-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x10400de

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v12

    .line 2705
    .local v12, "tooManyDeletesDescFormat":Ljava/lang/CharSequence;
    new-instance v9, Landroid/app/Notification;

    const v2, 0x10807e4

    iget-object v3, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v3

    const v5, 0x10400dc

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-direct {v9, v2, v3, v5, v6}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 2709
    .local v9, "notification":Landroid/app/Notification;
    iget-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v3

    const v5, 0x10400dd

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v2, v3, v5, v10}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 2713
    iget v2, v9, Landroid/app/Notification;->flags:I

    or-int/lit8 v2, v2, 0x2

    iput v2, v9, Landroid/app/Notification;->flags:I

    .line 2714
    iget-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mNotificationMgr:Landroid/app/NotificationManager;
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$3600(Lcom/android/server/content/SyncManager;)Landroid/app/NotificationManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/accounts/Account;->hashCode()I

    move-result v5

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v6

    xor-int/2addr v5, v6

    new-instance v6, Landroid/os/UserHandle;

    move/from16 v0, p5

    invoke-direct {v6, v0}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {v2, v3, v5, v9, v6}, Landroid/app/NotificationManager;->notifyAsUser(Ljava/lang/String;ILandroid/app/Notification;Landroid/os/UserHandle;)V

    goto/16 :goto_0
.end method

.method private isActivityAvailable(Landroid/content/Intent;)Z
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    .line 2725
    iget-object v6, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v6}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 2726
    .local v3, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v3, p1, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 2727
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    .line 2728
    .local v2, "listSize":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 2729
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 2730
    .local v4, "resolveInfo":Landroid/content/pm/ResolveInfo;
    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v6, v6, 0x1

    if-eqz v6, :cond_1

    .line 2732
    const/4 v5, 0x1

    .line 2736
    .end local v4    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :cond_0
    return v5

    .line 2728
    .restart local v4    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private manageSyncAlarmLocked(JJ)V
    .locals 25
    .param p1, "nextPeriodicEventElapsedTime"    # J
    .param p3, "nextPendingEventElapsedTime"    # J

    .prologue
    .line 2577
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v19, v0

    # getter for: Lcom/android/server/content/SyncManager;->mDataConnectionIsConnected:Z
    invoke-static/range {v19 .. v19}, Lcom/android/server/content/SyncManager;->access$400(Lcom/android/server/content/SyncManager;)Z

    move-result v19

    if-nez v19, :cond_1

    .line 2666
    :cond_0
    :goto_0
    return-void

    .line 2578
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v19, v0

    # getter for: Lcom/android/server/content/SyncManager;->mStorageIsLow:Z
    invoke-static/range {v19 .. v19}, Lcom/android/server/content/SyncManager;->access$000(Lcom/android/server/content/SyncManager;)Z

    move-result v19

    if-nez v19, :cond_0

    .line 2581
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v19, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncHandler:Lcom/android/server/content/SyncManager$SyncHandler;
    invoke-static/range {v19 .. v19}, Lcom/android/server/content/SyncManager;->access$200(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncManager$SyncHandler;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-boolean v0, v0, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->isActive:Z

    move/from16 v19, v0

    if-nez v19, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v19, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncHandler:Lcom/android/server/content/SyncManager$SyncHandler;
    invoke-static/range {v19 .. v19}, Lcom/android/server/content/SyncManager;->access$200(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncManager$SyncHandler;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->startTime:Ljava/lang/Long;

    move-object/from16 v19, v0

    if-eqz v19, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v19, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncHandler:Lcom/android/server/content/SyncManager$SyncHandler;
    invoke-static/range {v19 .. v19}, Lcom/android/server/content/SyncManager;->access$200(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncManager$SyncHandler;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->startTime:Ljava/lang/Long;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Long;->longValue()J

    move-result-wide v19

    # getter for: Lcom/android/server/content/SyncManager;->SYNC_NOTIFICATION_DELAY:J
    invoke-static {}, Lcom/android/server/content/SyncManager;->access$3700()J

    move-result-wide v21

    add-long v13, v19, v21

    .line 2588
    .local v13, "notificationTime":J
    :goto_1
    const-wide v9, 0x7fffffffffffffffL

    .line 2589
    .local v9, "earliestTimeoutTime":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/server/content/SyncManager;->mActiveSyncContexts:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_5

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/content/SyncManager$ActiveSyncContext;

    .line 2590
    .local v6, "currentSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    iget-wide v0, v6, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mTimeoutStartTime:J

    move-wide/from16 v19, v0

    # getter for: Lcom/android/server/content/SyncManager;->MAX_TIME_PER_SYNC:J
    invoke-static {}, Lcom/android/server/content/SyncManager;->access$3000()J

    move-result-wide v21

    add-long v7, v19, v21

    .line 2592
    .local v7, "currentSyncTimeoutTime":J
    const-string v19, "SyncManager"

    const/16 v20, 0x2

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 2593
    const-string v19, "SyncManager"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "manageSyncAlarm: active sync, mTimeoutStartTime + MAX is "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2596
    :cond_3
    cmp-long v19, v9, v7

    if-lez v19, :cond_2

    .line 2597
    move-wide v9, v7

    goto :goto_2

    .line 2581
    .end local v6    # "currentSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    .end local v7    # "currentSyncTimeoutTime":J
    .end local v9    # "earliestTimeoutTime":J
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v13    # "notificationTime":J
    :cond_4
    const-wide v13, 0x7fffffffffffffffL

    goto :goto_1

    .line 2601
    .restart local v9    # "earliestTimeoutTime":J
    .restart local v11    # "i$":Ljava/util/Iterator;
    .restart local v13    # "notificationTime":J
    :cond_5
    const-string v19, "SyncManager"

    const/16 v20, 0x2

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 2602
    const-string v19, "SyncManager"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "manageSyncAlarm: notificationTime is "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2605
    :cond_6
    const-string v19, "SyncManager"

    const/16 v20, 0x2

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 2606
    const-string v19, "SyncManager"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "manageSyncAlarm: earliestTimeoutTime is "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2609
    :cond_7
    const-string v19, "SyncManager"

    const/16 v20, 0x2

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v19

    if-eqz v19, :cond_8

    .line 2610
    const-string v19, "SyncManager"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "manageSyncAlarm: nextPeriodicEventElapsedTime is "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2613
    :cond_8
    const-string v19, "SyncManager"

    const/16 v20, 0x2

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v19

    if-eqz v19, :cond_9

    .line 2614
    const-string v19, "SyncManager"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "manageSyncAlarm: nextPendingEventElapsedTime is "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-wide/from16 v1, p3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2618
    :cond_9
    invoke-static {v13, v14, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 2619
    .local v4, "alarmTime":J
    move-wide/from16 v0, p1

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 2620
    move-wide/from16 v0, p3

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    .line 2623
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v15

    .line 2624
    .local v15, "now":J
    const-wide/16 v19, 0x7530

    add-long v19, v19, v15

    cmp-long v19, v4, v19

    if-gez v19, :cond_f

    .line 2625
    const-string v19, "SyncManager"

    const/16 v20, 0x2

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v19

    if-eqz v19, :cond_a

    .line 2626
    const-string v19, "SyncManager"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "manageSyncAlarm: the alarmTime is too small, "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", setting to "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-wide/16 v21, 0x7530

    add-long v21, v21, v15

    invoke-virtual/range {v20 .. v22}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2629
    :cond_a
    const-wide/16 v19, 0x7530

    add-long v4, v15, v19

    .line 2639
    :cond_b
    :goto_3
    const/16 v18, 0x0

    .line 2640
    .local v18, "shouldSet":Z
    const/16 v17, 0x0

    .line 2641
    .local v17, "shouldCancel":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->mAlarmScheduleTime:Ljava/lang/Long;

    move-object/from16 v19, v0

    if-eqz v19, :cond_11

    const/4 v3, 0x1

    .line 2642
    .local v3, "alarmIsActive":Z
    :goto_4
    const-wide v19, 0x7fffffffffffffffL

    cmp-long v19, v4, v19

    if-eqz v19, :cond_12

    const/4 v12, 0x1

    .line 2643
    .local v12, "needAlarm":Z
    :goto_5
    if-eqz v12, :cond_13

    .line 2644
    if-eqz v3, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->mAlarmScheduleTime:Ljava/lang/Long;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Long;->longValue()J

    move-result-wide v19

    cmp-long v19, v4, v19

    if-gez v19, :cond_d

    .line 2645
    :cond_c
    const/16 v18, 0x1

    .line 2652
    :cond_d
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v19, v0

    # invokes: Lcom/android/server/content/SyncManager;->ensureAlarmService()V
    invoke-static/range {v19 .. v19}, Lcom/android/server/content/SyncManager;->access$3900(Lcom/android/server/content/SyncManager;)V

    .line 2653
    if-eqz v18, :cond_14

    .line 2654
    const-string v19, "SyncManager"

    const/16 v20, 0x2

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v19

    if-eqz v19, :cond_e

    .line 2655
    const-string v19, "SyncManager"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "requesting that the alarm manager wake us up at elapsed time "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", now is "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-wide v1, v15

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    sub-long v21, v4, v15

    const-wide/16 v23, 0x3e8

    div-long v21, v21, v23

    invoke-virtual/range {v20 .. v22}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " secs from now"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2659
    :cond_e
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/content/SyncManager$SyncHandler;->mAlarmScheduleTime:Ljava/lang/Long;

    .line 2660
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v19, v0

    # getter for: Lcom/android/server/content/SyncManager;->mAlarmService:Landroid/app/AlarmManager;
    invoke-static/range {v19 .. v19}, Lcom/android/server/content/SyncManager;->access$4100(Lcom/android/server/content/SyncManager;)Landroid/app/AlarmManager;

    move-result-object v19

    const/16 v20, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v21, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncAlarmIntent:Landroid/app/PendingIntent;
    invoke-static/range {v21 .. v21}, Lcom/android/server/content/SyncManager;->access$4000(Lcom/android/server/content/SyncManager;)Landroid/app/PendingIntent;

    move-result-object v21

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v4, v5, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto/16 :goto_0

    .line 2630
    .end local v3    # "alarmIsActive":Z
    .end local v12    # "needAlarm":Z
    .end local v17    # "shouldCancel":Z
    .end local v18    # "shouldSet":Z
    :cond_f
    const-wide/32 v19, 0x6ddd00

    add-long v19, v19, v15

    cmp-long v19, v4, v19

    if-lez v19, :cond_b

    .line 2631
    const-string v19, "SyncManager"

    const/16 v20, 0x2

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v19

    if-eqz v19, :cond_10

    .line 2632
    const-string v19, "SyncManager"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "manageSyncAlarm: the alarmTime is too large, "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", setting to "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-wide/16 v21, 0x7530

    add-long v21, v21, v15

    invoke-virtual/range {v20 .. v22}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2635
    :cond_10
    const-wide/32 v19, 0x6ddd00

    add-long v4, v15, v19

    goto/16 :goto_3

    .line 2641
    .restart local v17    # "shouldCancel":Z
    .restart local v18    # "shouldSet":Z
    :cond_11
    const/4 v3, 0x0

    goto/16 :goto_4

    .line 2642
    .restart local v3    # "alarmIsActive":Z
    :cond_12
    const/4 v12, 0x0

    goto/16 :goto_5

    .line 2648
    .restart local v12    # "needAlarm":Z
    :cond_13
    move/from16 v17, v3

    goto/16 :goto_6

    .line 2662
    :cond_14
    if-eqz v17, :cond_0

    .line 2663
    const/16 v19, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/content/SyncManager$SyncHandler;->mAlarmScheduleTime:Ljava/lang/Long;

    .line 2664
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v19, v0

    # getter for: Lcom/android/server/content/SyncManager;->mAlarmService:Landroid/app/AlarmManager;
    invoke-static/range {v19 .. v19}, Lcom/android/server/content/SyncManager;->access$4100(Lcom/android/server/content/SyncManager;)Landroid/app/AlarmManager;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v20, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncAlarmIntent:Landroid/app/PendingIntent;
    invoke-static/range {v20 .. v20}, Lcom/android/server/content/SyncManager;->access$4000(Lcom/android/server/content/SyncManager;)Landroid/app/PendingIntent;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    goto/16 :goto_0
.end method

.method private manageSyncNotificationLocked()V
    .locals 14

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 2516
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v10, v10, Lcom/android/server/content/SyncManager;->mActiveSyncContexts:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 2517
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    const/4 v11, 0x0

    iput-object v11, v10, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->startTime:Ljava/lang/Long;

    .line 2521
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    iget-boolean v5, v10, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->isActive:Z

    .line 2522
    .local v5, "shouldCancel":Z
    const/4 v6, 0x0

    .line 2560
    :cond_0
    :goto_0
    if-eqz v5, :cond_1

    if-nez v6, :cond_1

    .line 2561
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # setter for: Lcom/android/server/content/SyncManager;->mNeedSyncActiveNotification:Z
    invoke-static {v10, v9}, Lcom/android/server/content/SyncManager;->access$3802(Lcom/android/server/content/SyncManager;Z)Z

    .line 2562
    invoke-direct {p0}, Lcom/android/server/content/SyncManager$SyncHandler;->sendSyncStateIntent()V

    .line 2563
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    iput-boolean v9, v10, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->isActive:Z

    .line 2566
    :cond_1
    if-eqz v6, :cond_2

    .line 2567
    iget-object v9, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # setter for: Lcom/android/server/content/SyncManager;->mNeedSyncActiveNotification:Z
    invoke-static {v9, v8}, Lcom/android/server/content/SyncManager;->access$3802(Lcom/android/server/content/SyncManager;Z)Z

    .line 2568
    invoke-direct {p0}, Lcom/android/server/content/SyncManager$SyncHandler;->sendSyncStateIntent()V

    .line 2569
    iget-object v9, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    iput-boolean v8, v9, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->isActive:Z

    .line 2571
    :cond_2
    return-void

    .line 2525
    .end local v5    # "shouldCancel":Z
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    .line 2526
    .local v3, "now":J
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    iget-object v10, v10, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->startTime:Ljava/lang/Long;

    if-nez v10, :cond_4

    .line 2527
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    iput-object v11, v10, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->startTime:Ljava/lang/Long;

    .line 2535
    :cond_4
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    iget-boolean v10, v10, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->isActive:Z

    if-eqz v10, :cond_5

    .line 2536
    const/4 v5, 0x0

    .restart local v5    # "shouldCancel":Z
    move v6, v5

    .local v6, "shouldInstall":I
    goto :goto_0

    .line 2539
    .end local v5    # "shouldCancel":Z
    .end local v6    # "shouldInstall":I
    :cond_5
    const/4 v5, 0x0

    .line 2541
    .restart local v5    # "shouldCancel":Z
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncNotificationInfo:Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;

    iget-object v10, v10, Lcom/android/server/content/SyncManager$SyncHandler$SyncNotificationInfo;->startTime:Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    # getter for: Lcom/android/server/content/SyncManager;->SYNC_NOTIFICATION_DELAY:J
    invoke-static {}, Lcom/android/server/content/SyncManager;->access$3700()J

    move-result-wide v12

    add-long/2addr v10, v12

    cmp-long v10, v3, v10

    if-lez v10, :cond_6

    move v7, v8

    .line 2543
    .local v7, "timeToShowNotification":Z
    :goto_1
    if-eqz v7, :cond_7

    .line 2544
    const/4 v6, 0x1

    .local v6, "shouldInstall":Z
    goto :goto_0

    .end local v6    # "shouldInstall":Z
    .end local v7    # "timeToShowNotification":Z
    :cond_6
    move v7, v9

    .line 2541
    goto :goto_1

    .line 2547
    .restart local v7    # "timeToShowNotification":Z
    :cond_7
    const/4 v6, 0x0

    .line 2548
    .restart local v6    # "shouldInstall":Z
    iget-object v10, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v10, v10, Lcom/android/server/content/SyncManager;->mActiveSyncContexts:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;

    .line 2549
    .local v0, "activeSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    iget-object v10, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    iget-object v10, v10, Lcom/android/server/content/SyncOperation;->extras:Landroid/os/Bundle;

    const-string v11, "force"

    invoke-virtual {v10, v11, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 2551
    .local v2, "manualSync":Z
    if-eqz v2, :cond_8

    .line 2552
    const/4 v6, 0x1

    .line 2553
    goto :goto_0
.end method

.method private maybeStartNextSyncLocked()J
    .locals 41

    .prologue
    .line 2058
    const-string v36, "SyncManager"

    const/16 v37, 0x2

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v15

    .line 2059
    .local v15, "isLoggable":Z
    if-eqz v15, :cond_0

    const-string v36, "SyncManager"

    const-string v37, "maybeStartNextSync"

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2062
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mDataConnectionIsConnected:Z
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$400(Lcom/android/server/content/SyncManager;)Z

    move-result v36

    if-nez v36, :cond_3

    .line 2063
    if-eqz v15, :cond_1

    .line 2064
    const-string v36, "SyncManager"

    const-string v37, "maybeStartNextSync: no data connection, skipping"

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2066
    :cond_1
    const-wide v18, 0x7fffffffffffffffL

    .line 2304
    :cond_2
    :goto_0
    return-wide v18

    .line 2069
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mStorageIsLow:Z
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$000(Lcom/android/server/content/SyncManager;)Z

    move-result v36

    if-eqz v36, :cond_5

    .line 2070
    if-eqz v15, :cond_4

    .line 2071
    const-string v36, "SyncManager"

    const-string v37, "maybeStartNextSync: memory low, skipping"

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2073
    :cond_4
    const-wide v18, 0x7fffffffffffffffL

    goto :goto_0

    .line 2078
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mRunningAccounts:[Landroid/accounts/AccountAndUser;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$2500(Lcom/android/server/content/SyncManager;)[Landroid/accounts/AccountAndUser;

    move-result-object v5

    .line 2079
    .local v5, "accounts":[Landroid/accounts/AccountAndUser;
    # getter for: Lcom/android/server/content/SyncManager;->INITIAL_ACCOUNTS_ARRAY:[Landroid/accounts/AccountAndUser;
    invoke-static {}, Lcom/android/server/content/SyncManager;->access$2800()[Landroid/accounts/AccountAndUser;

    move-result-object v36

    move-object/from16 v0, v36

    if-ne v5, v0, :cond_7

    .line 2080
    if-eqz v15, :cond_6

    .line 2081
    const-string v36, "SyncManager"

    const-string v37, "maybeStartNextSync: accounts not known, skipping"

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2083
    :cond_6
    const-wide v18, 0x7fffffffffffffffL

    goto :goto_0

    .line 2089
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # invokes: Lcom/android/server/content/SyncManager;->getConnectivityManager()Landroid/net/ConnectivityManager;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$300(Lcom/android/server/content/SyncManager;)Landroid/net/ConnectivityManager;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Landroid/net/ConnectivityManager;->getBackgroundDataSetting()Z

    move-result v9

    .line 2092
    .local v9, "backgroundDataUsageAllowed":Z
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v20

    .line 2095
    .local v20, "now":J
    const-wide v18, 0x7fffffffffffffffL

    .line 2098
    .local v18, "nextReadyToRunTime":J
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 2099
    .local v27, "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/content/SyncOperation;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncQueue:Lcom/android/server/content/SyncQueue;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$600(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncQueue;

    move-result-object v37

    monitor-enter v37

    .line 2100
    if-eqz v15, :cond_8

    .line 2101
    :try_start_0
    const-string v36, "SyncManager"

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {v38 .. v38}, Ljava/lang/StringBuilder;-><init>()V

    const-string v39, "build the operation array, syncQueue size is "

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v39, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncQueue:Lcom/android/server/content/SyncQueue;
    invoke-static/range {v39 .. v39}, Lcom/android/server/content/SyncManager;->access$600(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncQueue;

    move-result-object v39

    invoke-virtual/range {v39 .. v39}, Lcom/android/server/content/SyncQueue;->getOperations()Ljava/util/Collection;

    move-result-object v39

    invoke-interface/range {v39 .. v39}, Ljava/util/Collection;->size()I

    move-result v39

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2104
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncQueue:Lcom/android/server/content/SyncQueue;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$600(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncQueue;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Lcom/android/server/content/SyncQueue;->getOperations()Ljava/util/Collection;

    move-result-object v36

    invoke-interface/range {v36 .. v36}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v26

    .line 2107
    .local v26, "operationIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/android/server/content/SyncOperation;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v36

    const-string v38, "activity"

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/ActivityManager;

    .line 2109
    .local v8, "activityManager":Landroid/app/ActivityManager;
    invoke-static {}, Lcom/google/android/collect/Sets;->newHashSet()Ljava/util/HashSet;

    move-result-object v28

    .line 2110
    .local v28, "removedUsers":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_9
    :goto_1
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v36

    if-eqz v36, :cond_12

    .line 2111
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lcom/android/server/content/SyncOperation;

    .line 2114
    .local v25, "op":Lcom/android/server/content/SyncOperation;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    move-object/from16 v38, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v39, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    move/from16 v2, v39

    # invokes: Lcom/android/server/content/SyncManager;->containsAccountAndUser([Landroid/accounts/AccountAndUser;Landroid/accounts/Account;I)Z
    invoke-static {v0, v5, v1, v2}, Lcom/android/server/content/SyncManager;->access$2700(Lcom/android/server/content/SyncManager;[Landroid/accounts/AccountAndUser;Landroid/accounts/Account;I)Z

    move-result v36

    if-nez v36, :cond_a

    .line 2115
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->remove()V

    .line 2116
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v36

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->pendingOperation:Lcom/android/server/content/SyncStorageEngine$PendingOperation;

    move-object/from16 v38, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Lcom/android/server/content/SyncStorageEngine;->deleteFromPending(Lcom/android/server/content/SyncStorageEngine$PendingOperation;)Z

    goto :goto_1

    .line 2184
    .end local v8    # "activityManager":Landroid/app/ActivityManager;
    .end local v25    # "op":Lcom/android/server/content/SyncOperation;
    .end local v26    # "operationIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/android/server/content/SyncOperation;>;"
    .end local v28    # "removedUsers":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v36

    monitor-exit v37
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v36

    .line 2121
    .restart local v8    # "activityManager":Landroid/app/ActivityManager;
    .restart local v25    # "op":Lcom/android/server/content/SyncOperation;
    .restart local v26    # "operationIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/android/server/content/SyncOperation;>;"
    .restart local v28    # "removedUsers":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_a
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    move-object/from16 v38, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v39, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    move-object/from16 v40, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    move/from16 v2, v39

    move-object/from16 v3, v40

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/server/content/SyncManager;->getIsSyncable(Landroid/accounts/Account;ILjava/lang/String;)I

    move-result v31

    .line 2123
    .local v31, "syncableState":I
    if-nez v31, :cond_b

    .line 2124
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->remove()V

    .line 2125
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v36

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->pendingOperation:Lcom/android/server/content/SyncStorageEngine$PendingOperation;

    move-object/from16 v38, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Lcom/android/server/content/SyncStorageEngine;->deleteFromPending(Lcom/android/server/content/SyncStorageEngine$PendingOperation;)Z

    goto/16 :goto_1

    .line 2130
    :cond_b
    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v36, v0

    move/from16 v0, v36

    invoke-virtual {v8, v0}, Landroid/app/ActivityManager;->isUserRunning(I)Z

    move-result v36

    if-nez v36, :cond_c

    .line 2131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mUserManager:Landroid/os/UserManager;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$2900(Lcom/android/server/content/SyncManager;)Landroid/os/UserManager;

    move-result-object v36

    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v38, v0

    move-object/from16 v0, v36

    move/from16 v1, v38

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v35

    .line 2132
    .local v35, "userInfo":Landroid/content/pm/UserInfo;
    if-nez v35, :cond_9

    .line 2133
    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v36, v0

    invoke-static/range {v36 .. v36}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v36

    move-object/from16 v0, v28

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 2140
    .end local v35    # "userInfo":Landroid/content/pm/UserInfo;
    :cond_c
    move-object/from16 v0, v25

    iget-wide v0, v0, Lcom/android/server/content/SyncOperation;->effectiveRunTime:J

    move-wide/from16 v38, v0

    cmp-long v36, v38, v20

    if-lez v36, :cond_d

    .line 2141
    move-object/from16 v0, v25

    iget-wide v0, v0, Lcom/android/server/content/SyncOperation;->effectiveRunTime:J

    move-wide/from16 v38, v0

    cmp-long v36, v18, v38

    if-lez v36, :cond_9

    .line 2142
    move-object/from16 v0, v25

    iget-wide v0, v0, Lcom/android/server/content/SyncOperation;->effectiveRunTime:J

    move-wide/from16 v18, v0

    goto/16 :goto_1

    .line 2148
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    iget-object v0, v0, Lcom/android/server/content/SyncManager;->mSyncAdapters:Landroid/content/SyncAdaptersCache;

    move-object/from16 v36, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    move-object/from16 v38, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    move-object/from16 v39, v0

    move-object/from16 v0, v39

    iget-object v0, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    move-object/from16 v39, v0

    invoke-static/range {v38 .. v39}, Landroid/content/SyncAdapterType;->newKey(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SyncAdapterType;

    move-result-object v38

    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v39, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    move/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Landroid/content/SyncAdaptersCache;->getServiceInfo(Ljava/lang/Object;I)Landroid/content/pm/RegisteredServicesCache$ServiceInfo;

    move-result-object v30

    .line 2153
    .local v30, "syncAdapterInfo":Landroid/content/pm/RegisteredServicesCache$ServiceInfo;, "Landroid/content/pm/RegisteredServicesCache$ServiceInfo<Landroid/content/SyncAdapterType;>;"
    if-eqz v30, :cond_10

    .line 2154
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # invokes: Lcom/android/server/content/SyncManager;->getConnectivityManager()Landroid/net/ConnectivityManager;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$300(Lcom/android/server/content/SyncManager;)Landroid/net/ConnectivityManager;

    move-result-object v36

    move-object/from16 v0, v30

    iget v0, v0, Landroid/content/pm/RegisteredServicesCache$ServiceInfo;->uid:I

    move/from16 v38, v0

    move-object/from16 v0, v36

    move/from16 v1, v38

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfoForUid(I)Landroid/net/NetworkInfo;

    move-result-object v17

    .line 2156
    .local v17, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v17, :cond_f

    invoke-virtual/range {v17 .. v17}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v36

    if-eqz v36, :cond_f

    const/16 v33, 0x1

    .line 2164
    .end local v17    # "networkInfo":Landroid/net/NetworkInfo;
    .local v33, "uidNetworkConnected":Z
    :goto_2
    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->extras:Landroid/os/Bundle;

    move-object/from16 v36, v0

    const-string v38, "ignore_settings"

    const/16 v39, 0x0

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    move/from16 v2, v39

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v36

    if-nez v36, :cond_11

    if-lez v31, :cond_11

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v36

    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v38, v0

    move-object/from16 v0, v36

    move/from16 v1, v38

    invoke-virtual {v0, v1}, Lcom/android/server/content/SyncStorageEngine;->getMasterSyncAutomatically(I)Z

    move-result v36

    if-eqz v36, :cond_e

    if-eqz v9, :cond_e

    if-eqz v33, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v36

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    move-object/from16 v38, v0

    move-object/from16 v0, v25

    iget v0, v0, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v39, v0

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    move-object/from16 v40, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    move/from16 v2, v39

    move-object/from16 v3, v40

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/server/content/SyncStorageEngine;->getSyncAutomatically(Landroid/accounts/Account;ILjava/lang/String;)Z

    move-result v36

    if-nez v36, :cond_11

    .line 2171
    :cond_e
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->remove()V

    .line 2172
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v36

    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/android/server/content/SyncOperation;->pendingOperation:Lcom/android/server/content/SyncStorageEngine$PendingOperation;

    move-object/from16 v38, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Lcom/android/server/content/SyncStorageEngine;->deleteFromPending(Lcom/android/server/content/SyncStorageEngine$PendingOperation;)Z

    goto/16 :goto_1

    .line 2156
    .end local v33    # "uidNetworkConnected":Z
    .restart local v17    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_f
    const/16 v33, 0x0

    goto :goto_2

    .line 2158
    .end local v17    # "networkInfo":Landroid/net/NetworkInfo;
    :cond_10
    const/16 v33, 0x0

    .restart local v33    # "uidNetworkConnected":Z
    goto/16 :goto_2

    .line 2176
    :cond_11
    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 2178
    .end local v25    # "op":Lcom/android/server/content/SyncOperation;
    .end local v30    # "syncAdapterInfo":Landroid/content/pm/RegisteredServicesCache$ServiceInfo;, "Landroid/content/pm/RegisteredServicesCache$ServiceInfo<Landroid/content/SyncAdapterType;>;"
    .end local v31    # "syncableState":I
    .end local v33    # "uidNetworkConnected":Z
    :cond_12
    invoke-interface/range {v28 .. v28}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :cond_13
    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v36

    if-eqz v36, :cond_14

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Ljava/lang/Integer;

    .line 2180
    .local v34, "user":Ljava/lang/Integer;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mUserManager:Landroid/os/UserManager;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$2900(Lcom/android/server/content/SyncManager;)Landroid/os/UserManager;

    move-result-object v36

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Integer;->intValue()I

    move-result v38

    move-object/from16 v0, v36

    move/from16 v1, v38

    invoke-virtual {v0, v1}, Landroid/os/UserManager;->getUserInfo(I)Landroid/content/pm/UserInfo;

    move-result-object v36

    if-nez v36, :cond_13

    .line 2181
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Integer;->intValue()I

    move-result v38

    move-object/from16 v0, v36

    move/from16 v1, v38

    # invokes: Lcom/android/server/content/SyncManager;->onUserRemoved(I)V
    invoke-static {v0, v1}, Lcom/android/server/content/SyncManager;->access$800(Lcom/android/server/content/SyncManager;I)V

    goto :goto_3

    .line 2184
    .end local v34    # "user":Ljava/lang/Integer;
    :cond_14
    monitor-exit v37
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2191
    if-eqz v15, :cond_15

    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "sort the candidate operations, size "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v38

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2192
    :cond_15
    invoke-static/range {v27 .. v27}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 2193
    if-eqz v15, :cond_16

    const-string v36, "SyncManager"

    const-string v37, "dispatch all ready sync operations"

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2194
    :cond_16
    const/4 v13, 0x0

    .local v13, "i":I
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v4

    .local v4, "N":I
    :goto_4
    if-ge v13, v4, :cond_2

    .line 2195
    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/server/content/SyncOperation;

    .line 2196
    .local v10, "candidate":Lcom/android/server/content/SyncOperation;
    invoke-virtual {v10}, Lcom/android/server/content/SyncOperation;->isInitialization()Z

    move-result v11

    .line 2198
    .local v11, "candidateIsInitialization":Z
    const/16 v22, 0x0

    .line 2199
    .local v22, "numInit":I
    const/16 v23, 0x0

    .line 2200
    .local v23, "numRegular":I
    const/4 v12, 0x0

    .line 2201
    .local v12, "conflict":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    const/16 v16, 0x0

    .line 2202
    .local v16, "longRunning":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    const/16 v32, 0x0

    .line 2203
    .local v32, "toReschedule":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    const/16 v24, 0x0

    .line 2205
    .local v24, "oldestNonExpeditedRegular":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    iget-object v0, v0, Lcom/android/server/content/SyncManager;->mActiveSyncContexts:Ljava/util/ArrayList;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_17
    :goto_5
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v36

    if-eqz v36, :cond_1d

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/server/content/SyncManager$ActiveSyncContext;

    .line 2206
    .local v7, "activeSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    iget-object v6, v7, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    .line 2207
    .local v6, "activeOp":Lcom/android/server/content/SyncOperation;
    invoke-virtual {v6}, Lcom/android/server/content/SyncOperation;->isInitialization()Z

    move-result v36

    if-eqz v36, :cond_1a

    .line 2208
    add-int/lit8 v22, v22, 0x1

    .line 2219
    :cond_18
    :goto_6
    iget-object v0, v6, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    iget-object v0, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    move-object/from16 v36, v0

    iget-object v0, v10, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    iget-object v0, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    move-object/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_1c

    iget-object v0, v6, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    move-object/from16 v36, v0

    iget-object v0, v10, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    move-object/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_1c

    iget v0, v6, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v36, v0

    iget v0, v10, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v37, v0

    move/from16 v0, v36

    move/from16 v1, v37

    if-ne v0, v1, :cond_1c

    iget-boolean v0, v6, Lcom/android/server/content/SyncOperation;->allowParallelSyncs:Z

    move/from16 v36, v0

    if-eqz v36, :cond_19

    iget-object v0, v6, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    move-object/from16 v36, v0

    iget-object v0, v10, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    move-object/from16 v37, v0

    move-object/from16 v0, v37

    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    move-object/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-eqz v36, :cond_1c

    .line 2224
    :cond_19
    move-object v12, v7

    goto :goto_5

    .line 2210
    :cond_1a
    add-int/lit8 v23, v23, 0x1

    .line 2211
    invoke-virtual {v6}, Lcom/android/server/content/SyncOperation;->isExpedited()Z

    move-result v36

    if-nez v36, :cond_18

    .line 2212
    if-eqz v24, :cond_1b

    move-object/from16 v0, v24

    iget-wide v0, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mStartTime:J

    move-wide/from16 v36, v0

    iget-wide v0, v7, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mStartTime:J

    move-wide/from16 v38, v0

    cmp-long v36, v36, v38

    if-lez v36, :cond_18

    .line 2215
    :cond_1b
    move-object/from16 v24, v7

    goto :goto_6

    .line 2227
    :cond_1c
    invoke-virtual {v6}, Lcom/android/server/content/SyncOperation;->isInitialization()Z

    move-result v36

    move/from16 v0, v36

    if-ne v11, v0, :cond_17

    iget-wide v0, v7, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mStartTime:J

    move-wide/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->MAX_TIME_PER_SYNC:J
    invoke-static {}, Lcom/android/server/content/SyncManager;->access$3000()J

    move-result-wide v38

    add-long v36, v36, v38

    cmp-long v36, v36, v20

    if-gez v36, :cond_17

    .line 2229
    move-object/from16 v16, v7

    goto/16 :goto_5

    .line 2235
    .end local v6    # "activeOp":Lcom/android/server/content/SyncOperation;
    .end local v7    # "activeSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    :cond_1d
    if-eqz v15, :cond_1e

    .line 2236
    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "candidate "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    add-int/lit8 v38, v13, 0x1

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, " of "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, ": "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2237
    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "  numActiveInit="

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    const-string v38, ", numActiveRegular="

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2238
    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "  longRunning: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2239
    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "  conflict: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2240
    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "  oldestNonExpeditedRegular: "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2243
    :cond_1e
    if-eqz v11, :cond_23

    # getter for: Lcom/android/server/content/SyncManager;->MAX_SIMULTANEOUS_INITIALIZATION_SYNCS:I
    invoke-static {}, Lcom/android/server/content/SyncManager;->access$3100()I

    move-result v36

    move/from16 v0, v22

    move/from16 v1, v36

    if-ge v0, v1, :cond_22

    const/16 v29, 0x1

    .line 2247
    .local v29, "roomAvailable":Z
    :goto_7
    if-eqz v12, :cond_26

    .line 2248
    if-eqz v11, :cond_25

    iget-object v0, v12, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lcom/android/server/content/SyncOperation;->isInitialization()Z

    move-result v36

    if-nez v36, :cond_25

    # getter for: Lcom/android/server/content/SyncManager;->MAX_SIMULTANEOUS_INITIALIZATION_SYNCS:I
    invoke-static {}, Lcom/android/server/content/SyncManager;->access$3100()I

    move-result v36

    move/from16 v0, v22

    move/from16 v1, v36

    if-ge v0, v1, :cond_25

    .line 2250
    move-object/from16 v32, v12

    .line 2251
    const-string v36, "SyncManager"

    const/16 v37, 0x2

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v36

    if-eqz v36, :cond_1f

    .line 2252
    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "canceling and rescheduling sync since an initialization takes higher priority, "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2294
    :cond_1f
    :goto_8
    if-eqz v32, :cond_20

    .line 2295
    const/16 v36, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    move-object/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lcom/android/server/content/SyncManager$SyncHandler;->runSyncFinishedOrCanceledLocked(Landroid/content/SyncResult;Lcom/android/server/content/SyncManager$ActiveSyncContext;)V

    .line 2296
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    move-object/from16 v0, v32

    iget-object v0, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    move-object/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Lcom/android/server/content/SyncManager;->scheduleSyncOperation(Lcom/android/server/content/SyncOperation;)V

    .line 2298
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncQueue:Lcom/android/server/content/SyncQueue;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$600(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncQueue;

    move-result-object v37

    monitor-enter v37

    .line 2299
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v36, v0

    # getter for: Lcom/android/server/content/SyncManager;->mSyncQueue:Lcom/android/server/content/SyncQueue;
    invoke-static/range {v36 .. v36}, Lcom/android/server/content/SyncManager;->access$600(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncQueue;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v10}, Lcom/android/server/content/SyncQueue;->remove(Lcom/android/server/content/SyncOperation;)V

    .line 2300
    monitor-exit v37
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2301
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/android/server/content/SyncManager$SyncHandler;->dispatchSyncOperation(Lcom/android/server/content/SyncOperation;)Z

    .line 2194
    :cond_21
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_4

    .line 2243
    .end local v29    # "roomAvailable":Z
    :cond_22
    const/16 v29, 0x0

    goto :goto_7

    :cond_23
    # getter for: Lcom/android/server/content/SyncManager;->MAX_SIMULTANEOUS_REGULAR_SYNCS:I
    invoke-static {}, Lcom/android/server/content/SyncManager;->access$3200()I

    move-result v36

    move/from16 v0, v23

    move/from16 v1, v36

    if-ge v0, v1, :cond_24

    const/16 v29, 0x1

    goto/16 :goto_7

    :cond_24
    const/16 v29, 0x0

    goto/16 :goto_7

    .line 2255
    .restart local v29    # "roomAvailable":Z
    :cond_25
    iget-boolean v0, v10, Lcom/android/server/content/SyncOperation;->expedited:Z

    move/from16 v36, v0

    if-eqz v36, :cond_21

    iget-object v0, v12, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    iget-boolean v0, v0, Lcom/android/server/content/SyncOperation;->expedited:Z

    move/from16 v36, v0

    if-nez v36, :cond_21

    iget-object v0, v12, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lcom/android/server/content/SyncOperation;->isInitialization()Z

    move-result v36

    move/from16 v0, v36

    if-ne v11, v0, :cond_21

    .line 2258
    move-object/from16 v32, v12

    .line 2259
    const-string v36, "SyncManager"

    const/16 v37, 0x2

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v36

    if-eqz v36, :cond_1f

    .line 2260
    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "canceling and rescheduling sync since an expedited takes higher priority, "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 2266
    :cond_26
    if-nez v29, :cond_1f

    .line 2268
    invoke-virtual {v10}, Lcom/android/server/content/SyncOperation;->isExpedited()Z

    move-result v36

    if-eqz v36, :cond_27

    if-eqz v24, :cond_27

    if-nez v11, :cond_27

    .line 2273
    move-object/from16 v32, v24

    .line 2274
    const-string v36, "SyncManager"

    const/16 v37, 0x2

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v36

    if-eqz v36, :cond_1f

    .line 2275
    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "canceling and rescheduling sync since an expedited is ready to run, "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 2278
    :cond_27
    if-eqz v16, :cond_21

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lcom/android/server/content/SyncOperation;->isInitialization()Z

    move-result v36

    move/from16 v0, v36

    if-ne v11, v0, :cond_21

    .line 2283
    move-object/from16 v32, v16

    .line 2284
    const-string v36, "SyncManager"

    const/16 v37, 0x2

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v36

    if-eqz v36, :cond_1f

    .line 2285
    const-string v36, "SyncManager"

    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "canceling and rescheduling sync since it ran roo long, "

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v36 .. v37}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    .line 2300
    :catchall_1
    move-exception v36

    :try_start_3
    monitor-exit v37
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v36
.end method

.method private runBoundToSyncAdapter(Lcom/android/server/content/SyncManager$ActiveSyncContext;Landroid/content/ISyncAdapter;)V
    .locals 6
    .param p1, "activeSyncContext"    # Lcom/android/server/content/SyncManager$ActiveSyncContext;
    .param p2, "syncAdapter"    # Landroid/content/ISyncAdapter;

    .prologue
    .line 2345
    iput-object p2, p1, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncAdapter:Landroid/content/ISyncAdapter;

    .line 2346
    iget-object v2, p1, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    .line 2348
    .local v2, "syncOperation":Lcom/android/server/content/SyncOperation;
    const/4 v3, 0x1

    :try_start_0
    iput-boolean v3, p1, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mIsLinkedToDeath:Z

    .line 2349
    invoke-interface {p2}, Landroid/content/ISyncAdapter;->asBinder()Landroid/os/IBinder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v3, p1, v4}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 2351
    iget-object v3, v2, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    iget-object v4, v2, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    iget-object v5, v2, Lcom/android/server/content/SyncOperation;->extras:Landroid/os/Bundle;

    invoke-interface {p2, p1, v3, v4, v5}, Landroid/content/ISyncAdapter;->startSync(Landroid/content/ISyncContext;Ljava/lang/String;Landroid/accounts/Account;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 2362
    :goto_0
    return-void

    .line 2353
    :catch_0
    move-exception v1

    .line 2354
    .local v1, "remoteExc":Landroid/os/RemoteException;
    const-string v3, "SyncManager"

    const-string v4, "maybeStartNextSync: caught a RemoteException, rescheduling"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2355
    invoke-direct {p0, p1}, Lcom/android/server/content/SyncManager$SyncHandler;->closeActiveSyncContext(Lcom/android/server/content/SyncManager$ActiveSyncContext;)V

    .line 2356
    iget-object v3, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # invokes: Lcom/android/server/content/SyncManager;->increaseBackoffSetting(Lcom/android/server/content/SyncOperation;)V
    invoke-static {v3, v2}, Lcom/android/server/content/SyncManager;->access$3300(Lcom/android/server/content/SyncManager;Lcom/android/server/content/SyncOperation;)V

    .line 2357
    iget-object v3, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    new-instance v4, Lcom/android/server/content/SyncOperation;

    invoke-direct {v4, v2}, Lcom/android/server/content/SyncOperation;-><init>(Lcom/android/server/content/SyncOperation;)V

    invoke-virtual {v3, v4}, Lcom/android/server/content/SyncManager;->scheduleSyncOperation(Lcom/android/server/content/SyncOperation;)V

    goto :goto_0

    .line 2358
    .end local v1    # "remoteExc":Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 2359
    .local v0, "exc":Ljava/lang/RuntimeException;
    invoke-direct {p0, p1}, Lcom/android/server/content/SyncManager$SyncHandler;->closeActiveSyncContext(Lcom/android/server/content/SyncManager$ActiveSyncContext;)V

    .line 2360
    const-string v3, "SyncManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Caught RuntimeException while starting the sync "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private runSyncFinishedOrCanceledLocked(Landroid/content/SyncResult;Lcom/android/server/content/SyncManager$ActiveSyncContext;)V
    .locals 26
    .param p1, "syncResult"    # Landroid/content/SyncResult;
    .param p2, "activeSyncContext"    # Lcom/android/server/content/SyncManager$ActiveSyncContext;

    .prologue
    .line 2394
    const-string v2, "SyncManager"

    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v25

    .line 2396
    .local v25, "isLoggable":Z
    move-object/from16 v0, p2

    iget-boolean v2, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mIsLinkedToDeath:Z

    if-eqz v2, :cond_0

    .line 2397
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncAdapter:Landroid/content/ISyncAdapter;

    invoke-interface {v2}, Landroid/content/ISyncAdapter;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-interface {v2, v0, v3}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 2398
    const/4 v2, 0x0

    move-object/from16 v0, p2

    iput-boolean v2, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mIsLinkedToDeath:Z

    .line 2400
    :cond_0
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/server/content/SyncManager$SyncHandler;->closeActiveSyncContext(Lcom/android/server/content/SyncManager$ActiveSyncContext;)V

    .line 2402
    move-object/from16 v0, p2

    iget-object v5, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncOperation:Lcom/android/server/content/SyncOperation;

    .line 2404
    .local v5, "syncOperation":Lcom/android/server/content/SyncOperation;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    move-object/from16 v0, p2

    iget-wide v11, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mStartTime:J

    sub-long v9, v2, v11

    .line 2409
    .local v9, "elapsedTime":J
    if-eqz p1, :cond_5

    .line 2410
    if-eqz v25, :cond_1

    .line 2411
    const-string v2, "SyncManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "runSyncFinishedOrCanceled [finished]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", result "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2415
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/content/SyncResult;->hasError()Z

    move-result v2

    if-nez v2, :cond_3

    .line 2416
    const-string v6, "success"

    .line 2418
    .local v6, "historyMessage":Ljava/lang/String;
    const/4 v8, 0x0

    .line 2419
    .local v8, "downstreamActivity":I
    const/4 v7, 0x0

    .line 2420
    .local v7, "upstreamActivity":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # invokes: Lcom/android/server/content/SyncManager;->clearBackoffSetting(Lcom/android/server/content/SyncOperation;)V
    invoke-static {v2, v5}, Lcom/android/server/content/SyncManager;->access$3400(Lcom/android/server/content/SyncManager;Lcom/android/server/content/SyncOperation;)V

    .line 2436
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v0, p1

    iget-wide v3, v0, Landroid/content/SyncResult;->delayUntil:J

    # invokes: Lcom/android/server/content/SyncManager;->setDelayUntilTime(Lcom/android/server/content/SyncOperation;J)V
    invoke-static {v2, v5, v3, v4}, Lcom/android/server/content/SyncManager;->access$3500(Lcom/android/server/content/SyncManager;Lcom/android/server/content/SyncOperation;J)V

    .line 2453
    :goto_1
    move-object/from16 v0, p2

    iget-wide v3, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mHistoryRowId:J

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v10}, Lcom/android/server/content/SyncManager$SyncHandler;->stopSyncEvent(JLcom/android/server/content/SyncOperation;Ljava/lang/String;IIJ)V

    .line 2456
    if-eqz p1, :cond_8

    move-object/from16 v0, p1

    iget-boolean v2, v0, Landroid/content/SyncResult;->tooManyDeletions:Z

    if-eqz v2, :cond_8

    .line 2457
    iget-object v12, v5, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    iget-object v13, v5, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v2, v0, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v14, v2, Landroid/content/SyncStats;->numDeletes:J

    iget v0, v5, Lcom/android/server/content/SyncOperation;->userId:I

    move/from16 v16, v0

    move-object/from16 v11, p0

    invoke-direct/range {v11 .. v16}, Lcom/android/server/content/SyncManager$SyncHandler;->installHandleTooManyDeletesNotification(Landroid/accounts/Account;Ljava/lang/String;JI)V

    .line 2466
    :goto_2
    if-eqz p1, :cond_2

    move-object/from16 v0, p1

    iget-boolean v2, v0, Landroid/content/SyncResult;->fullSyncRequested:Z

    if-eqz v2, :cond_2

    .line 2467
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    new-instance v11, Lcom/android/server/content/SyncOperation;

    iget-object v12, v5, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    iget v13, v5, Lcom/android/server/content/SyncOperation;->userId:I

    iget v14, v5, Lcom/android/server/content/SyncOperation;->reason:I

    iget v15, v5, Lcom/android/server/content/SyncOperation;->syncSource:I

    iget-object v0, v5, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    move-object/from16 v16, v0

    new-instance v17, Landroid/os/Bundle;

    invoke-direct/range {v17 .. v17}, Landroid/os/Bundle;-><init>()V

    const-wide/16 v18, 0x0

    iget-object v3, v5, Lcom/android/server/content/SyncOperation;->backoff:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    iget-wide v0, v5, Lcom/android/server/content/SyncOperation;->delayUntil:J

    move-wide/from16 v22, v0

    iget-boolean v0, v5, Lcom/android/server/content/SyncOperation;->allowParallelSyncs:Z

    move/from16 v24, v0

    invoke-direct/range {v11 .. v24}, Lcom/android/server/content/SyncOperation;-><init>(Landroid/accounts/Account;IIILjava/lang/String;Landroid/os/Bundle;JJJZ)V

    invoke-virtual {v2, v11}, Lcom/android/server/content/SyncManager;->scheduleSyncOperation(Lcom/android/server/content/SyncOperation;)V

    .line 2474
    :cond_2
    return-void

    .line 2422
    .end local v6    # "historyMessage":Ljava/lang/String;
    .end local v7    # "upstreamActivity":I
    .end local v8    # "downstreamActivity":I
    :cond_3
    const-string v2, "SyncManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "failed sync operation "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2424
    move-object/from16 v0, p1

    iget-boolean v2, v0, Landroid/content/SyncResult;->syncAlreadyInProgress:Z

    if-nez v2, :cond_4

    .line 2425
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # invokes: Lcom/android/server/content/SyncManager;->increaseBackoffSetting(Lcom/android/server/content/SyncOperation;)V
    invoke-static {v2, v5}, Lcom/android/server/content/SyncManager;->access$3300(Lcom/android/server/content/SyncManager;Lcom/android/server/content/SyncOperation;)V

    .line 2428
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0, v5}, Lcom/android/server/content/SyncManager;->maybeRescheduleSync(Landroid/content/SyncResult;Lcom/android/server/content/SyncOperation;)V

    .line 2429
    invoke-direct/range {p0 .. p1}, Lcom/android/server/content/SyncManager$SyncHandler;->syncResultToErrorNumber(Landroid/content/SyncResult;)I

    move-result v2

    invoke-static {v2}, Landroid/content/ContentResolver;->syncErrorToString(I)Ljava/lang/String;

    move-result-object v6

    .line 2432
    .restart local v6    # "historyMessage":Ljava/lang/String;
    const/4 v8, 0x0

    .line 2433
    .restart local v8    # "downstreamActivity":I
    const/4 v7, 0x0

    .restart local v7    # "upstreamActivity":I
    goto/16 :goto_0

    .line 2438
    .end local v6    # "historyMessage":Ljava/lang/String;
    .end local v7    # "upstreamActivity":I
    .end local v8    # "downstreamActivity":I
    :cond_5
    if-eqz v25, :cond_6

    .line 2439
    const-string v2, "SyncManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "runSyncFinishedOrCanceled [canceled]: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2441
    :cond_6
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncAdapter:Landroid/content/ISyncAdapter;

    if-eqz v2, :cond_7

    .line 2443
    :try_start_0
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncAdapter:Landroid/content/ISyncAdapter;

    move-object/from16 v0, p2

    invoke-interface {v2, v0}, Landroid/content/ISyncAdapter;->cancelSync(Landroid/content/ISyncContext;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2448
    :cond_7
    :goto_3
    const-string v6, "canceled"

    .line 2449
    .restart local v6    # "historyMessage":Ljava/lang/String;
    const/4 v8, 0x0

    .line 2450
    .restart local v8    # "downstreamActivity":I
    const/4 v7, 0x0

    .restart local v7    # "upstreamActivity":I
    goto/16 :goto_1

    .line 2461
    :cond_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mNotificationMgr:Landroid/app/NotificationManager;
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$3600(Lcom/android/server/content/SyncManager;)Landroid/app/NotificationManager;

    move-result-object v2

    const/4 v3, 0x0

    iget-object v4, v5, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    invoke-virtual {v4}, Landroid/accounts/Account;->hashCode()I

    move-result v4

    iget-object v11, v5, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->hashCode()I

    move-result v11

    xor-int/2addr v4, v11

    new-instance v11, Landroid/os/UserHandle;

    iget v12, v5, Lcom/android/server/content/SyncOperation;->userId:I

    invoke-direct {v11, v12}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {v2, v3, v4, v11}, Landroid/app/NotificationManager;->cancelAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)V

    goto/16 :goto_2

    .line 2444
    .end local v6    # "historyMessage":Ljava/lang/String;
    .end local v7    # "upstreamActivity":I
    .end local v8    # "downstreamActivity":I
    :catch_0
    move-exception v2

    goto :goto_3
.end method

.method private scheduleReadyPeriodicSyncs()J
    .locals 43

    .prologue
    .line 1949
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # invokes: Lcom/android/server/content/SyncManager;->getConnectivityManager()Landroid/net/ConnectivityManager;
    invoke-static {v4}, Lcom/android/server/content/SyncManager;->access$300(Lcom/android/server/content/SyncManager;)Landroid/net/ConnectivityManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/ConnectivityManager;->getBackgroundDataSetting()Z

    move-result v20

    .line 1951
    .local v20, "backgroundDataUsageAllowed":Z
    const-wide v22, 0x7fffffffffffffffL

    .line 1952
    .local v22, "earliestFuturePollTime":J
    if-nez v20, :cond_0

    move-wide/from16 v4, v22

    .line 2051
    :goto_0
    return-wide v4

    .line 1956
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mRunningAccounts:[Landroid/accounts/AccountAndUser;
    invoke-static {v4}, Lcom/android/server/content/SyncManager;->access$2500(Lcom/android/server/content/SyncManager;)[Landroid/accounts/AccountAndUser;

    move-result-object v19

    .line 1958
    .local v19, "accounts":[Landroid/accounts/AccountAndUser;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v32

    .line 1959
    .local v32, "nowAbsolute":J
    const-wide/16 v4, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncRandomOffsetMillis:I
    invoke-static {v6}, Lcom/android/server/content/SyncManager;->access$2600(Lcom/android/server/content/SyncManager;)I

    move-result v6

    int-to-long v6, v6

    sub-long v6, v32, v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncRandomOffsetMillis:I
    invoke-static {v4}, Lcom/android/server/content/SyncManager;->access$2600(Lcom/android/server/content/SyncManager;)I

    move-result v4

    int-to-long v4, v4

    sub-long v37, v32, v4

    .line 1962
    .local v37, "shiftedNowAbsolute":J
    :goto_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v4}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/server/content/SyncStorageEngine;->getAuthorities()Ljava/util/ArrayList;

    move-result-object v27

    .line 1963
    .local v27, "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;>;"
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v25

    .local v25, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;

    .line 1965
    .local v26, "info":Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v0, v26

    iget-object v5, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->account:Landroid/accounts/Account;

    move-object/from16 v0, v26

    iget v6, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->userId:I

    move-object/from16 v0, v19

    # invokes: Lcom/android/server/content/SyncManager;->containsAccountAndUser([Landroid/accounts/AccountAndUser;Landroid/accounts/Account;I)Z
    invoke-static {v4, v0, v5, v6}, Lcom/android/server/content/SyncManager;->access$2700(Lcom/android/server/content/SyncManager;[Landroid/accounts/AccountAndUser;Landroid/accounts/Account;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1969
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v4}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v4

    move-object/from16 v0, v26

    iget v5, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->userId:I

    invoke-virtual {v4, v5}, Lcom/android/server/content/SyncStorageEngine;->getMasterSyncAutomatically(I)Z

    move-result v4

    if-eqz v4, :cond_1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v4}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v4

    move-object/from16 v0, v26

    iget-object v5, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->account:Landroid/accounts/Account;

    move-object/from16 v0, v26

    iget v6, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->userId:I

    move-object/from16 v0, v26

    iget-object v7, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->authority:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/android/server/content/SyncStorageEngine;->getSyncAutomatically(Landroid/accounts/Account;ILjava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1975
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v0, v26

    iget-object v5, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->account:Landroid/accounts/Account;

    move-object/from16 v0, v26

    iget v6, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->userId:I

    move-object/from16 v0, v26

    iget-object v7, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->authority:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/android/server/content/SyncManager;->getIsSyncable(Landroid/accounts/Account;ILjava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_1

    .line 1980
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v4}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/android/server/content/SyncStorageEngine;->getOrCreateSyncStatus(Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;)Landroid/content/SyncStatusInfo;

    move-result-object v39

    .line 1981
    .local v39, "status":Landroid/content/SyncStatusInfo;
    const/16 v24, 0x0

    .local v24, "i":I
    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->periodicSyncs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v18

    .local v18, "N":I
    :goto_2
    move/from16 v0, v24

    move/from16 v1, v18

    if-ge v0, v1, :cond_1

    .line 1982
    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->periodicSyncs:Ljava/util/ArrayList;

    move/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    iget-object v10, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v10, Landroid/os/Bundle;

    .line 1983
    .local v10, "extras":Landroid/os/Bundle;
    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->periodicSyncs:Ljava/util/ArrayList;

    move/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    iget-object v4, v4, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v34

    .line 1985
    .local v34, "periodInMillis":Ljava/lang/Long;
    invoke-virtual/range {v34 .. v34}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-gtz v4, :cond_4

    .line 1981
    :cond_2
    :goto_3
    add-int/lit8 v24, v24, 0x1

    goto :goto_2

    .line 1959
    .end local v10    # "extras":Landroid/os/Bundle;
    .end local v18    # "N":I
    .end local v24    # "i":I
    .end local v25    # "i$":Ljava/util/Iterator;
    .end local v26    # "info":Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;
    .end local v27    # "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;>;"
    .end local v34    # "periodInMillis":Ljava/lang/Long;
    .end local v37    # "shiftedNowAbsolute":J
    .end local v39    # "status":Landroid/content/SyncStatusInfo;
    :cond_3
    const-wide/16 v37, 0x0

    goto/16 :goto_1

    .line 1989
    .restart local v10    # "extras":Landroid/os/Bundle;
    .restart local v18    # "N":I
    .restart local v24    # "i":I
    .restart local v25    # "i$":Ljava/util/Iterator;
    .restart local v26    # "info":Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;
    .restart local v27    # "infos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;>;"
    .restart local v34    # "periodInMillis":Ljava/lang/Long;
    .restart local v37    # "shiftedNowAbsolute":J
    .restart local v39    # "status":Landroid/content/SyncStatusInfo;
    :cond_4
    move-object/from16 v0, v39

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/content/SyncStatusInfo;->getPeriodicSyncTime(I)J

    move-result-wide v28

    .line 1991
    .local v28, "lastPollTimeAbsolute":J
    invoke-virtual/range {v34 .. v34}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    rem-long v6, v37, v6

    sub-long v35, v4, v6

    .line 2011
    .local v35, "remainingMillis":J
    invoke-virtual/range {v34 .. v34}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    cmp-long v4, v35, v4

    if-eqz v4, :cond_5

    cmp-long v4, v28, v32

    if-gtz v4, :cond_5

    sub-long v4, v32, v28

    const-wide/16 v6, 0x3e8

    add-long/2addr v4, v6

    invoke-virtual/range {v34 .. v34}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_6

    .line 2016
    :cond_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v4}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v4

    move-object/from16 v0, v26

    iget-object v5, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->account:Landroid/accounts/Account;

    move-object/from16 v0, v26

    iget v6, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->userId:I

    move-object/from16 v0, v26

    iget-object v7, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->authority:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v7}, Lcom/android/server/content/SyncStorageEngine;->getBackoff(Landroid/accounts/Account;ILjava/lang/String;)Landroid/util/Pair;

    move-result-object v21

    .line 2019
    .local v21, "backoff":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v4, v4, Lcom/android/server/content/SyncManager;->mSyncAdapters:Landroid/content/SyncAdaptersCache;

    move-object/from16 v0, v26

    iget-object v5, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->authority:Ljava/lang/String;

    move-object/from16 v0, v26

    iget-object v6, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->account:Landroid/accounts/Account;

    iget-object v6, v6, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-static {v5, v6}, Landroid/content/SyncAdapterType;->newKey(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SyncAdapterType;

    move-result-object v5

    move-object/from16 v0, v26

    iget v6, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->userId:I

    invoke-virtual {v4, v5, v6}, Landroid/content/SyncAdaptersCache;->getServiceInfo(Ljava/lang/Object;I)Landroid/content/pm/RegisteredServicesCache$ServiceInfo;

    move-result-object v40

    .line 2022
    .local v40, "syncAdapterInfo":Landroid/content/pm/RegisteredServicesCache$ServiceInfo;, "Landroid/content/pm/RegisteredServicesCache$ServiceInfo<Landroid/content/SyncAdapterType;>;"
    if-eqz v40, :cond_2

    .line 2025
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v41, v0

    new-instance v4, Lcom/android/server/content/SyncOperation;

    move-object/from16 v0, v26

    iget-object v5, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->account:Landroid/accounts/Account;

    move-object/from16 v0, v26

    iget v6, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->userId:I

    const/4 v7, -0x4

    const/4 v8, 0x4

    move-object/from16 v0, v26

    iget-object v9, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->authority:Ljava/lang/String;

    const-wide/16 v11, 0x0

    if-eqz v21, :cond_7

    move-object/from16 v0, v21

    iget-object v13, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v13, Ljava/lang/Long;

    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    :goto_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v15}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v15

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->account:Landroid/accounts/Account;

    move-object/from16 v16, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->userId:I

    move/from16 v17, v0

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;->authority:Ljava/lang/String;

    move-object/from16 v42, v0

    move-object/from16 v0, v16

    move/from16 v1, v17

    move-object/from16 v2, v42

    invoke-virtual {v15, v0, v1, v2}, Lcom/android/server/content/SyncStorageEngine;->getDelayUntilTime(Landroid/accounts/Account;ILjava/lang/String;)J

    move-result-wide v15

    move-object/from16 v0, v40

    iget-object v0, v0, Landroid/content/pm/RegisteredServicesCache$ServiceInfo;->type:Ljava/lang/Object;

    move-object/from16 v17, v0

    check-cast v17, Landroid/content/SyncAdapterType;

    invoke-virtual/range {v17 .. v17}, Landroid/content/SyncAdapterType;->allowParallelSyncs()Z

    move-result v17

    invoke-direct/range {v4 .. v17}, Lcom/android/server/content/SyncOperation;-><init>(Landroid/accounts/Account;IIILjava/lang/String;Landroid/os/Bundle;JJJZ)V

    move-object/from16 v0, v41

    invoke-virtual {v0, v4}, Lcom/android/server/content/SyncManager;->scheduleSyncOperation(Lcom/android/server/content/SyncOperation;)V

    .line 2034
    move-object/from16 v0, v39

    move/from16 v1, v24

    move-wide/from16 v2, v32

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/SyncStatusInfo;->setPeriodicSyncTime(IJ)V

    .line 2037
    .end local v21    # "backoff":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    .end local v40    # "syncAdapterInfo":Landroid/content/pm/RegisteredServicesCache$ServiceInfo;, "Landroid/content/pm/RegisteredServicesCache$ServiceInfo<Landroid/content/SyncAdapterType;>;"
    :cond_6
    add-long v30, v32, v35

    .line 2040
    .local v30, "nextPollTimeAbsolute":J
    cmp-long v4, v30, v22

    if-gez v4, :cond_2

    .line 2041
    move-wide/from16 v22, v30

    goto/16 :goto_3

    .line 2025
    .end local v30    # "nextPollTimeAbsolute":J
    .restart local v21    # "backoff":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    .restart local v40    # "syncAdapterInfo":Landroid/content/pm/RegisteredServicesCache$ServiceInfo;, "Landroid/content/pm/RegisteredServicesCache$ServiceInfo<Landroid/content/SyncAdapterType;>;"
    :cond_7
    const-wide/16 v13, 0x0

    goto :goto_4

    .line 2046
    .end local v10    # "extras":Landroid/os/Bundle;
    .end local v18    # "N":I
    .end local v21    # "backoff":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Long;>;"
    .end local v24    # "i":I
    .end local v26    # "info":Lcom/android/server/content/SyncStorageEngine$AuthorityInfo;
    .end local v28    # "lastPollTimeAbsolute":J
    .end local v34    # "periodInMillis":Ljava/lang/Long;
    .end local v35    # "remainingMillis":J
    .end local v39    # "status":Landroid/content/SyncStatusInfo;
    .end local v40    # "syncAdapterInfo":Landroid/content/pm/RegisteredServicesCache$ServiceInfo;, "Landroid/content/pm/RegisteredServicesCache$ServiceInfo<Landroid/content/SyncAdapterType;>;"
    :cond_8
    const-wide v4, 0x7fffffffffffffffL

    cmp-long v4, v22, v4

    if-nez v4, :cond_9

    .line 2047
    const-wide v4, 0x7fffffffffffffffL

    goto/16 :goto_0

    .line 2051
    :cond_9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    cmp-long v4, v22, v32

    if-gez v4, :cond_a

    const-wide/16 v4, 0x0

    :goto_5
    add-long/2addr v4, v6

    goto/16 :goto_0

    :cond_a
    sub-long v4, v22, v32

    goto :goto_5
.end method

.method private sendSyncStateIntent()V
    .locals 3

    .prologue
    .line 2669
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SYNC_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2670
    .local v0, "syncStateIntent":Landroid/content/Intent;
    const/high16 v1, 0x8000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2671
    const-string v1, "active"

    iget-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mNeedSyncActiveNotification:Z
    invoke-static {v2}, Lcom/android/server/content/SyncManager;->access$3800(Lcom/android/server/content/SyncManager;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2672
    const-string v1, "failing"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2673
    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/server/content/SyncManager;->access$1500(Lcom/android/server/content/SyncManager;)Landroid/content/Context;

    move-result-object v1

    sget-object v2, Landroid/os/UserHandle;->OWNER:Landroid/os/UserHandle;

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    .line 2674
    return-void
.end method

.method private syncResultToErrorNumber(Landroid/content/SyncResult;)I
    .locals 4
    .param p1, "syncResult"    # Landroid/content/SyncResult;

    .prologue
    const-wide/16 v2, 0x0

    .line 2493
    iget-boolean v0, p1, Landroid/content/SyncResult;->syncAlreadyInProgress:Z

    if-eqz v0, :cond_0

    .line 2494
    const/4 v0, 0x1

    .line 2508
    :goto_0
    return v0

    .line 2495
    :cond_0
    iget-object v0, p1, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v0, v0, Landroid/content/SyncStats;->numAuthExceptions:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 2496
    const/4 v0, 0x2

    goto :goto_0

    .line 2497
    :cond_1
    iget-object v0, p1, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v0, v0, Landroid/content/SyncStats;->numIoExceptions:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 2498
    const/4 v0, 0x3

    goto :goto_0

    .line 2499
    :cond_2
    iget-object v0, p1, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v0, v0, Landroid/content/SyncStats;->numParseExceptions:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_3

    .line 2500
    const/4 v0, 0x4

    goto :goto_0

    .line 2501
    :cond_3
    iget-object v0, p1, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v0, v0, Landroid/content/SyncStats;->numConflictDetectedExceptions:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_4

    .line 2502
    const/4 v0, 0x5

    goto :goto_0

    .line 2503
    :cond_4
    iget-boolean v0, p1, Landroid/content/SyncResult;->tooManyDeletions:Z

    if-eqz v0, :cond_5

    .line 2504
    const/4 v0, 0x6

    goto :goto_0

    .line 2505
    :cond_5
    iget-boolean v0, p1, Landroid/content/SyncResult;->tooManyRetries:Z

    if-eqz v0, :cond_6

    .line 2506
    const/4 v0, 0x7

    goto :goto_0

    .line 2507
    :cond_6
    iget-boolean v0, p1, Landroid/content/SyncResult;->databaseError:Z

    if-eqz v0, :cond_7

    .line 2508
    const/16 v0, 0x8

    goto :goto_0

    .line 2509
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "we are not in an error state, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private waitUntilReadyToRun()V
    .locals 3

    .prologue
    .line 1785
    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mReadyToRunLatch:Ljava/util/concurrent/CountDownLatch;

    .line 1786
    .local v1, "latch":Ljava/util/concurrent/CountDownLatch;
    if-eqz v1, :cond_0

    .line 1789
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 1790
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mReadyToRunLatch:Ljava/util/concurrent/CountDownLatch;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1797
    :cond_0
    return-void

    .line 1792
    :catch_0
    move-exception v0

    .line 1793
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 16
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 1826
    const-wide v2, 0x7fffffffffffffffL

    .line 1827
    .local v2, "earliestFuturePollTime":J
    const-wide v6, 0x7fffffffffffffffL

    .line 1832
    .local v6, "nextPendingSyncTime":J
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/SyncManager$SyncHandler;->waitUntilReadyToRun()V

    .line 1833
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # invokes: Lcom/android/server/content/SyncManager;->readDataConnectionState()Z
    invoke-static {v12}, Lcom/android/server/content/SyncManager;->access$500(Lcom/android/server/content/SyncManager;)Z

    move-result v12

    # setter for: Lcom/android/server/content/SyncManager;->mDataConnectionIsConnected:Z
    invoke-static {v11, v12}, Lcom/android/server/content/SyncManager;->access$402(Lcom/android/server/content/SyncManager;Z)Z

    .line 1834
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncManagerWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v11}, Lcom/android/server/content/SyncManager;->access$2300(Lcom/android/server/content/SyncManager;)Landroid/os/PowerManager$WakeLock;

    move-result-object v11

    invoke-virtual {v11}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 1839
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/SyncManager$SyncHandler;->scheduleReadyPeriodicSyncs()J

    move-result-wide v2

    .line 1840
    move-object/from16 v0, p1

    iget v11, v0, Landroid/os/Message;->what:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    packed-switch v11, :pswitch_data_0

    .line 1936
    :cond_0
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/SyncManager$SyncHandler;->manageSyncNotificationLocked()V

    .line 1937
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v6, v7}, Lcom/android/server/content/SyncManager$SyncHandler;->manageSyncAlarmLocked(JJ)V

    .line 1938
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncTimeTracker:Lcom/android/server/content/SyncManager$SyncTimeTracker;

    invoke-virtual {v11}, Lcom/android/server/content/SyncManager$SyncTimeTracker;->update()V

    .line 1939
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncManagerWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v11}, Lcom/android/server/content/SyncManager;->access$2300(Lcom/android/server/content/SyncManager;)Landroid/os/PowerManager$WakeLock;

    move-result-object v11

    invoke-virtual {v11}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1941
    return-void

    .line 1842
    :pswitch_0
    :try_start_1
    move-object/from16 v0, p1

    iget-object v9, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v9, Landroid/util/Pair;

    .line 1843
    .local v9, "payload":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/accounts/Account;Ljava/lang/String;>;"
    const-string v11, "SyncManager"

    const/4 v12, 0x2

    invoke-static {v11, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 1844
    const-string v12, "SyncManager"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "handleSyncHandlerMessage: MESSAGE_SERVICE_CANCEL: "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v13, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v13, ", "

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v11, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v12, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1847
    :cond_1
    iget-object v11, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v11, Landroid/accounts/Account;

    move-object/from16 v0, p1

    iget v13, v0, Landroid/os/Message;->arg1:I

    iget-object v12, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v13, v12}, Lcom/android/server/content/SyncManager$SyncHandler;->cancelActiveSyncLocked(Landroid/accounts/Account;ILjava/lang/String;)V

    .line 1848
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/SyncManager$SyncHandler;->maybeStartNextSyncLocked()J

    move-result-wide v6

    .line 1849
    goto :goto_0

    .line 1853
    .end local v9    # "payload":Landroid/util/Pair;, "Landroid/util/Pair<Landroid/accounts/Account;Ljava/lang/String;>;"
    :pswitch_1
    const-string v11, "SyncManager"

    const/4 v12, 0x2

    invoke-static {v11, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 1854
    const-string v11, "SyncManager"

    const-string v12, "handleSyncHandlerMessage: MESSAGE_SYNC_FINISHED"

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1856
    :cond_2
    move-object/from16 v0, p1

    iget-object v8, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v8, Lcom/android/server/content/SyncManager$SyncHandlerMessagePayload;

    .line 1857
    .local v8, "payload":Lcom/android/server/content/SyncManager$SyncHandlerMessagePayload;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v12, v8, Lcom/android/server/content/SyncManager$SyncHandlerMessagePayload;->activeSyncContext:Lcom/android/server/content/SyncManager$ActiveSyncContext;

    # invokes: Lcom/android/server/content/SyncManager;->isSyncStillActive(Lcom/android/server/content/SyncManager$ActiveSyncContext;)Z
    invoke-static {v11, v12}, Lcom/android/server/content/SyncManager;->access$2400(Lcom/android/server/content/SyncManager;Lcom/android/server/content/SyncManager$ActiveSyncContext;)Z

    move-result v11

    if-nez v11, :cond_3

    .line 1858
    const-string v11, "SyncManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "handleSyncHandlerMessage: dropping since the sync is no longer active: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v8, Lcom/android/server/content/SyncManager$SyncHandlerMessagePayload;->activeSyncContext:Lcom/android/server/content/SyncManager$ActiveSyncContext;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 1936
    .end local v8    # "payload":Lcom/android/server/content/SyncManager$SyncHandlerMessagePayload;
    :catchall_0
    move-exception v11

    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/SyncManager$SyncHandler;->manageSyncNotificationLocked()V

    .line 1937
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v6, v7}, Lcom/android/server/content/SyncManager$SyncHandler;->manageSyncAlarmLocked(JJ)V

    .line 1938
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/content/SyncManager$SyncHandler;->mSyncTimeTracker:Lcom/android/server/content/SyncManager$SyncTimeTracker;

    invoke-virtual {v12}, Lcom/android/server/content/SyncManager$SyncTimeTracker;->update()V

    .line 1939
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncManagerWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v12}, Lcom/android/server/content/SyncManager;->access$2300(Lcom/android/server/content/SyncManager;)Landroid/os/PowerManager$WakeLock;

    move-result-object v12

    invoke-virtual {v12}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1936
    throw v11

    .line 1863
    .restart local v8    # "payload":Lcom/android/server/content/SyncManager$SyncHandlerMessagePayload;
    :cond_3
    :try_start_2
    iget-object v11, v8, Lcom/android/server/content/SyncManager$SyncHandlerMessagePayload;->syncResult:Landroid/content/SyncResult;

    iget-object v12, v8, Lcom/android/server/content/SyncManager$SyncHandlerMessagePayload;->activeSyncContext:Lcom/android/server/content/SyncManager$ActiveSyncContext;

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v12}, Lcom/android/server/content/SyncManager$SyncHandler;->runSyncFinishedOrCanceledLocked(Landroid/content/SyncResult;Lcom/android/server/content/SyncManager$ActiveSyncContext;)V

    .line 1866
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/SyncManager$SyncHandler;->maybeStartNextSyncLocked()J

    move-result-wide v6

    .line 1867
    goto/16 :goto_0

    .line 1870
    .end local v8    # "payload":Lcom/android/server/content/SyncManager$SyncHandlerMessagePayload;
    :pswitch_2
    move-object/from16 v0, p1

    iget-object v5, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, Lcom/android/server/content/SyncManager$ServiceConnectionData;

    .line 1871
    .local v5, "msgData":Lcom/android/server/content/SyncManager$ServiceConnectionData;
    const-string v11, "SyncManager"

    const/4 v12, 0x2

    invoke-static {v11, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 1872
    const-string v11, "SyncManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "handleSyncHandlerMessage: MESSAGE_SERVICE_CONNECTED: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v5, Lcom/android/server/content/SyncManager$ServiceConnectionData;->activeSyncContext:Lcom/android/server/content/SyncManager$ActiveSyncContext;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1876
    :cond_4
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    iget-object v12, v5, Lcom/android/server/content/SyncManager$ServiceConnectionData;->activeSyncContext:Lcom/android/server/content/SyncManager$ActiveSyncContext;

    # invokes: Lcom/android/server/content/SyncManager;->isSyncStillActive(Lcom/android/server/content/SyncManager$ActiveSyncContext;)Z
    invoke-static {v11, v12}, Lcom/android/server/content/SyncManager;->access$2400(Lcom/android/server/content/SyncManager;Lcom/android/server/content/SyncManager$ActiveSyncContext;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 1877
    iget-object v11, v5, Lcom/android/server/content/SyncManager$ServiceConnectionData;->activeSyncContext:Lcom/android/server/content/SyncManager$ActiveSyncContext;

    iget-object v12, v5, Lcom/android/server/content/SyncManager$ServiceConnectionData;->syncAdapter:Landroid/content/ISyncAdapter;

    move-object/from16 v0, p0

    invoke-direct {v0, v11, v12}, Lcom/android/server/content/SyncManager$SyncHandler;->runBoundToSyncAdapter(Lcom/android/server/content/SyncManager$ActiveSyncContext;Landroid/content/ISyncAdapter;)V

    goto/16 :goto_0

    .line 1883
    .end local v5    # "msgData":Lcom/android/server/content/SyncManager$ServiceConnectionData;
    :pswitch_3
    move-object/from16 v0, p1

    iget-object v11, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v11, Lcom/android/server/content/SyncManager$ServiceConnectionData;

    iget-object v1, v11, Lcom/android/server/content/SyncManager$ServiceConnectionData;->activeSyncContext:Lcom/android/server/content/SyncManager$ActiveSyncContext;

    .line 1885
    .local v1, "currentSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    const-string v11, "SyncManager"

    const/4 v12, 0x2

    invoke-static {v11, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 1886
    const-string v11, "SyncManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "handleSyncHandlerMessage: MESSAGE_SERVICE_DISCONNECTED: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1890
    :cond_5
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # invokes: Lcom/android/server/content/SyncManager;->isSyncStillActive(Lcom/android/server/content/SyncManager$ActiveSyncContext;)Z
    invoke-static {v11, v1}, Lcom/android/server/content/SyncManager;->access$2400(Lcom/android/server/content/SyncManager;Lcom/android/server/content/SyncManager$ActiveSyncContext;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 1893
    iget-object v11, v1, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncAdapter:Landroid/content/ISyncAdapter;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v11, :cond_6

    .line 1895
    :try_start_3
    iget-object v11, v1, Lcom/android/server/content/SyncManager$ActiveSyncContext;->mSyncAdapter:Landroid/content/ISyncAdapter;

    invoke-interface {v11, v1}, Landroid/content/ISyncAdapter;->cancelSync(Landroid/content/ISyncContext;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1903
    :cond_6
    :goto_1
    :try_start_4
    new-instance v10, Landroid/content/SyncResult;

    invoke-direct {v10}, Landroid/content/SyncResult;-><init>()V

    .line 1904
    .local v10, "syncResult":Landroid/content/SyncResult;
    iget-object v11, v10, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v12, v11, Landroid/content/SyncStats;->numIoExceptions:J

    const-wide/16 v14, 0x1

    add-long/2addr v12, v14

    iput-wide v12, v11, Landroid/content/SyncStats;->numIoExceptions:J

    .line 1905
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v1}, Lcom/android/server/content/SyncManager$SyncHandler;->runSyncFinishedOrCanceledLocked(Landroid/content/SyncResult;Lcom/android/server/content/SyncManager$ActiveSyncContext;)V

    .line 1908
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/SyncManager$SyncHandler;->maybeStartNextSyncLocked()J

    move-result-wide v6

    .line 1909
    goto/16 :goto_0

    .line 1915
    .end local v1    # "currentSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    .end local v10    # "syncResult":Landroid/content/SyncResult;
    :pswitch_4
    const-string v11, "SyncManager"

    const/4 v12, 0x2

    invoke-static {v11, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    .line 1916
    .local v4, "isLoggable":Z
    if-eqz v4, :cond_7

    .line 1917
    const-string v11, "SyncManager"

    const-string v12, "handleSyncHandlerMessage: MESSAGE_SYNC_ALARM"

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1919
    :cond_7
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/server/content/SyncManager$SyncHandler;->mAlarmScheduleTime:Ljava/lang/Long;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1921
    :try_start_5
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/SyncManager$SyncHandler;->maybeStartNextSyncLocked()J
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result-wide v6

    .line 1923
    :try_start_6
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mHandleAlarmWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v11}, Lcom/android/server/content/SyncManager;->access$1100(Lcom/android/server/content/SyncManager;)Landroid/os/PowerManager$WakeLock;

    move-result-object v11

    invoke-virtual {v11}, Landroid/os/PowerManager$WakeLock;->release()V

    goto/16 :goto_0

    :catchall_1
    move-exception v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mHandleAlarmWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v12}, Lcom/android/server/content/SyncManager;->access$1100(Lcom/android/server/content/SyncManager;)Landroid/os/PowerManager$WakeLock;

    move-result-object v12

    invoke-virtual {v12}, Landroid/os/PowerManager$WakeLock;->release()V

    throw v11

    .line 1929
    .end local v4    # "isLoggable":Z
    :pswitch_5
    const-string v11, "SyncManager"

    const/4 v12, 0x2

    invoke-static {v11, v12}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 1930
    const-string v11, "SyncManager"

    const-string v12, "handleSyncHandlerMessage: MESSAGE_CHECK_ALARMS"

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1932
    :cond_8
    invoke-direct/range {p0 .. p0}, Lcom/android/server/content/SyncManager$SyncHandler;->maybeStartNextSyncLocked()J
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-wide v6

    goto/16 :goto_0

    .line 1896
    .restart local v1    # "currentSyncContext":Lcom/android/server/content/SyncManager$ActiveSyncContext;
    :catch_0
    move-exception v11

    goto :goto_1

    .line 1840
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_2
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method public insertStartSyncEvent(Lcom/android/server/content/SyncOperation;)J
    .locals 10
    .param p1, "syncOperation"    # Lcom/android/server/content/SyncOperation;

    .prologue
    const/4 v3, 0x0

    .line 2740
    iget v7, p1, Lcom/android/server/content/SyncOperation;->syncSource:I

    .line 2741
    .local v7, "source":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    .line 2743
    .local v5, "now":J
    const/16 v0, 0xaa0

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p1, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    aput-object v2, v1, v3

    const/4 v2, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p1, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    iget-object v3, v3, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2747
    iget-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v0}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v0

    iget-object v1, p1, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    iget v2, p1, Lcom/android/server/content/SyncOperation;->userId:I

    iget v3, p1, Lcom/android/server/content/SyncOperation;->reason:I

    iget-object v4, p1, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/android/server/content/SyncOperation;->isInitialization()Z

    move-result v8

    iget-object v9, p1, Lcom/android/server/content/SyncOperation;->extras:Landroid/os/Bundle;

    invoke-virtual/range {v0 .. v9}, Lcom/android/server/content/SyncStorageEngine;->insertStartSyncEvent(Landroid/accounts/Account;IILjava/lang/String;JIZLandroid/os/Bundle;)J

    move-result-wide v0

    return-wide v0
.end method

.method public onBootCompleted()V
    .locals 2

    .prologue
    .line 1763
    iget-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    const/4 v1, 0x1

    # setter for: Lcom/android/server/content/SyncManager;->mBootCompleted:Z
    invoke-static {v0, v1}, Lcom/android/server/content/SyncManager;->access$2002(Lcom/android/server/content/SyncManager;Z)Z

    .line 1765
    iget-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # invokes: Lcom/android/server/content/SyncManager;->doDatabaseCleanup()V
    invoke-static {v0}, Lcom/android/server/content/SyncManager;->access$2100(Lcom/android/server/content/SyncManager;)V

    .line 1767
    iget-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mReadyToRunLatch:Ljava/util/concurrent/CountDownLatch;

    if-eqz v0, :cond_0

    .line 1768
    iget-object v0, p0, Lcom/android/server/content/SyncManager$SyncHandler;->mReadyToRunLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 1770
    :cond_0
    return-void
.end method

.method public stopSyncEvent(JLcom/android/server/content/SyncOperation;Ljava/lang/String;IIJ)V
    .locals 11
    .param p1, "rowId"    # J
    .param p3, "syncOperation"    # Lcom/android/server/content/SyncOperation;
    .param p4, "resultMessage"    # Ljava/lang/String;
    .param p5, "upstreamActivity"    # I
    .param p6, "downstreamActivity"    # I
    .param p7, "elapsedTime"    # J

    .prologue
    .line 2756
    const/16 v1, 0xaa0

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p3, Lcom/android/server/content/SyncOperation;->authority:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget v4, p3, Lcom/android/server/content/SyncOperation;->syncSource:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-object v4, p3, Lcom/android/server/content/SyncOperation;->account:Landroid/accounts/Account;

    iget-object v4, v4, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2760
    iget-object v1, p0, Lcom/android/server/content/SyncManager$SyncHandler;->this$0:Lcom/android/server/content/SyncManager;

    # getter for: Lcom/android/server/content/SyncManager;->mSyncStorageEngine:Lcom/android/server/content/SyncStorageEngine;
    invoke-static {v1}, Lcom/android/server/content/SyncManager;->access$700(Lcom/android/server/content/SyncManager;)Lcom/android/server/content/SyncStorageEngine;

    move-result-object v1

    move/from16 v0, p6

    int-to-long v7, v0

    move/from16 v0, p5

    int-to-long v9, v0

    move-wide v2, p1

    move-wide/from16 v4, p7

    move-object v6, p4

    invoke-virtual/range {v1 .. v10}, Lcom/android/server/content/SyncStorageEngine;->stopSyncEvent(JJLjava/lang/String;JJ)V

    .line 2762
    return-void
.end method
