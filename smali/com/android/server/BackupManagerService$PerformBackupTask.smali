.class Lcom/android/server/BackupManagerService$PerformBackupTask;
.super Ljava/lang/Object;
.source "BackupManagerService.java"

# interfaces
.implements Lcom/android/server/BackupManagerService$BackupRestoreTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PerformBackupTask"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PerformBackupTask"


# instance fields
.field mBackupData:Landroid/os/ParcelFileDescriptor;

.field mBackupDataName:Ljava/io/File;

.field mCurrentPackage:Landroid/content/pm/PackageInfo;

.field mCurrentState:Lcom/android/server/BackupManagerService$BackupState;

.field mFinished:Z

.field mJournal:Ljava/io/File;

.field mNewState:Landroid/os/ParcelFileDescriptor;

.field mNewStateName:Ljava/io/File;

.field mOriginalQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/BackupManagerService$BackupRequest;",
            ">;"
        }
    .end annotation
.end field

.field mQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/BackupManagerService$BackupRequest;",
            ">;"
        }
    .end annotation
.end field

.field mSavedState:Landroid/os/ParcelFileDescriptor;

.field mSavedStateName:Ljava/io/File;

.field mStateDir:Ljava/io/File;

.field mStatus:I

.field mTransport:Lcom/android/internal/backup/IBackupTransport;

.field final synthetic this$0:Lcom/android/server/BackupManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/BackupManagerService;Lcom/android/internal/backup/IBackupTransport;Ljava/util/ArrayList;Ljava/io/File;)V
    .locals 3
    .param p2, "transport"    # Lcom/android/internal/backup/IBackupTransport;
    .param p4, "journal"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/backup/IBackupTransport;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/BackupManagerService$BackupRequest;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1862
    .local p3, "queue":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/BackupManagerService$BackupRequest;>;"
    iput-object p1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1863
    iput-object p2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    .line 1864
    iput-object p3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    .line 1865
    iput-object p4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    .line 1868
    :try_start_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/android/server/BackupManagerService;->mBaseStateDir:Ljava/io/File;

    invoke-interface {p2}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1873
    :goto_0
    sget-object v0, Lcom/android/server/BackupManagerService$BackupState;->INITIAL:Lcom/android/server/BackupManagerService$BackupState;

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentState:Lcom/android/server/BackupManagerService$BackupState;

    .line 1874
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mFinished:Z

    .line 1876
    const-string v0, "STATE => INITIAL"

    invoke-virtual {p1, v0}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1877
    return-void

    .line 1869
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method agentErrorCleanup()V
    .locals 1

    .prologue
    .line 2308
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 2309
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 2310
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->clearAgentState()V

    .line 2312
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    .line 2313
    return-void

    .line 2312
    :cond_0
    sget-object v0, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    goto :goto_0
.end method

.method beginBackup()V
    .locals 11

    .prologue
    const/4 v9, 0x0

    .line 1906
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v7}, Lcom/android/server/BackupManagerService;->clearBackupTrace()V

    .line 1907
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v7, 0x100

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1908
    .local v0, "b":Ljava/lang/StringBuilder;
    const-string v7, "beginBackup: ["

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1909
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/BackupManagerService$BackupRequest;

    .line 1910
    .local v5, "req":Lcom/android/server/BackupManagerService$BackupRequest;
    const/16 v7, 0x20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1911
    iget-object v7, v5, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1913
    .end local v5    # "req":Lcom/android/server/BackupManagerService$BackupRequest;
    :cond_0
    const-string v7, " ]"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1914
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1917
    iput v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1920
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1921
    const-string v7, "PerformBackupTask"

    const-string v8, "Backup begun with an empty queue - nothing to do."

    invoke-static {v7, v8}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1922
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v8, "queue empty at begin"

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1923
    sget-object v7, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v7}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    .line 1990
    :cond_1
    :goto_1
    return-void

    .line 1930
    :cond_2
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/ArrayList;

    iput-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    .line 1932
    const-string v7, "PerformBackupTask"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Beginning backup of "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " targets"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1934
    new-instance v4, Ljava/io/File;

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    const-string v8, "@pm@"

    invoke-direct {v4, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1936
    .local v4, "pmState":Ljava/io/File;
    :try_start_0
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v7}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v6

    .line 1937
    .local v6, "transportName":Ljava/lang/String;
    const/16 v7, 0xb05

    invoke-static {v7, v6}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 1940
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v7, :cond_3

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v7, v7, v9

    if-gtz v7, :cond_3

    .line 1941
    const-string v7, "PerformBackupTask"

    const-string v8, "Initializing (wiping) backup state and transport storage"

    invoke-static {v7, v8}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1942
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "initializing transport "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1943
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 1944
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v7}, Lcom/android/internal/backup/IBackupTransport;->initializeDevice()I

    move-result v7

    iput v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1946
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "transport.initializeDevice() == "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1947
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v7, :cond_6

    .line 1948
    const/16 v7, 0xb0b

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v7, v8}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 1960
    :cond_3
    :goto_2
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v7, :cond_4

    .line 1961
    new-instance v3, Lcom/android/server/PackageManagerBackupAgent;

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    # getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v7}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v8}, Lcom/android/server/BackupManagerService;->allAgentPackages()Ljava/util/List;

    move-result-object v8

    invoke-direct {v3, v7, v8}, Lcom/android/server/PackageManagerBackupAgent;-><init>(Landroid/content/pm/PackageManager;Ljava/util/List;)V

    .line 1963
    .local v3, "pmAgent":Lcom/android/server/PackageManagerBackupAgent;
    const-string v7, "@pm@"

    invoke-virtual {v3}, Lcom/android/server/PackageManagerBackupAgent;->onBind()Landroid/os/IBinder;

    move-result-object v8

    invoke-static {v8}, Landroid/app/IBackupAgent$Stub;->asInterface(Landroid/os/IBinder;)Landroid/app/IBackupAgent;

    move-result-object v8

    iget-object v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-virtual {p0, v7, v8, v9}, Lcom/android/server/BackupManagerService$PerformBackupTask;->invokeAgentForBackup(Ljava/lang/String;Landroid/app/IBackupAgent;Lcom/android/internal/backup/IBackupTransport;)I

    move-result v7

    iput v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1965
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "PMBA invoke: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1968
    .end local v3    # "pmAgent":Lcom/android/server/PackageManagerBackupAgent;
    :cond_4
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_5

    .line 1972
    const/16 v7, 0xb0a

    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v8}, Lcom/android/internal/backup/IBackupTransport;->transportDirName()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1982
    :cond_5
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "exiting prelim: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1983
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v7, :cond_1

    .line 1986
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 1987
    sget-object v7, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v7}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    goto/16 :goto_1

    .line 1950
    :cond_6
    const/16 v7, 0xb06

    :try_start_1
    const-string v8, "(initialize)"

    invoke-static {v7, v8}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 1951
    const-string v7, "PerformBackupTask"

    const-string v8, "Transport error in initializeDevice()"

    invoke-static {v7, v8}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_2

    .line 1974
    .end local v6    # "transportName":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 1975
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    const-string v7, "PerformBackupTask"

    const-string v8, "Error in backup thread"

    invoke-static {v7, v8, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1976
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Exception in backup thread: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1977
    const/4 v7, 0x1

    iput v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1982
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "exiting prelim: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1983
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v7, :cond_1

    .line 1986
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v7, v8}, Lcom/android/server/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 1987
    sget-object v7, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v7}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    goto/16 :goto_1

    .line 1982
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "exiting prelim: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 1983
    iget v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v8, :cond_7

    .line 1986
    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v9, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-virtual {v8, v9}, Lcom/android/server/BackupManagerService;->resetBackupState(Ljava/io/File;)V

    .line 1987
    sget-object v8, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v8}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    :cond_7
    throw v7
.end method

.method clearAgentState()V
    .locals 3

    .prologue
    .line 2317
    :try_start_0
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 2318
    :cond_0
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 2319
    :cond_1
    :goto_1
    :try_start_2
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 2320
    :cond_2
    :goto_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    .line 2321
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v0, Lcom/android/server/BackupManagerService;->mCurrentOpLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2322
    :try_start_3
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mCurrentOperations:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 2323
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2326
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v0, :cond_3

    .line 2327
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unbinding "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2329
    :try_start_4
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    # getter for: Lcom/android/server/BackupManagerService;->mActivityManager:Landroid/app/IActivityManager;
    invoke-static {v0}, Lcom/android/server/BackupManagerService;->access$800(Lcom/android/server/BackupManagerService;)Landroid/app/IActivityManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-interface {v0, v1}, Landroid/app/IActivityManager;->unbindBackupAgent(Landroid/content/pm/ApplicationInfo;)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0

    .line 2332
    :cond_3
    :goto_3
    return-void

    .line 2323
    :catchall_0
    move-exception v0

    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v0

    .line 2330
    :catch_0
    move-exception v0

    goto :goto_3

    .line 2319
    :catch_1
    move-exception v0

    goto :goto_2

    .line 2318
    :catch_2
    move-exception v0

    goto :goto_1

    .line 2317
    :catch_3
    move-exception v0

    goto :goto_0
.end method

.method clearMetadata()V
    .locals 3

    .prologue
    .line 2134
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    const-string v2, "@pm@"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2135
    .local v0, "pmState":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 2136
    :cond_0
    return-void
.end method

.method public execute()V
    .locals 2

    .prologue
    .line 1883
    sget-object v0, Lcom/android/server/BackupManagerService$4;->$SwitchMap$com$android$server$BackupManagerService$BackupState:[I

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentState:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {v1}, Lcom/android/server/BackupManagerService$BackupState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 1900
    :goto_0
    return-void

    .line 1885
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->beginBackup()V

    goto :goto_0

    .line 1889
    :pswitch_1
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->invokeNextAgent()V

    goto :goto_0

    .line 1893
    :pswitch_2
    iget-boolean v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mFinished:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->finalizeBackup()V

    .line 1897
    :goto_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mFinished:Z

    goto :goto_0

    .line 1895
    :cond_0
    const-string v0, "PerformBackupTask"

    const-string v1, "Duplicate finish"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 1883
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V
    .locals 4
    .param p1, "nextState"    # Lcom/android/server/BackupManagerService$BackupState;

    .prologue
    .line 2346
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "executeNextState => "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2347
    iput-object p1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentState:Lcom/android/server/BackupManagerService$BackupState;

    .line 2348
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mBackupHandler:Lcom/android/server/BackupManagerService$BackupHandler;

    const/16 v2, 0x14

    invoke-virtual {v1, v2, p0}, Lcom/android/server/BackupManagerService$BackupHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 2349
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mBackupHandler:Lcom/android/server/BackupManagerService$BackupHandler;

    invoke-virtual {v1, v0}, Lcom/android/server/BackupManagerService$BackupHandler;->sendMessage(Landroid/os/Message;)Z

    .line 2350
    return-void
.end method

.method finalizeBackup()V
    .locals 4

    .prologue
    .line 2091
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v1, "finishing"

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2097
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2098
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to remove backup journal file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mJournal:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2104
    :cond_0
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-wide v0, v0, Lcom/android/server/BackupManagerService;->mCurrentToken:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    iget v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v0, :cond_1

    .line 2105
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v1, "success; recording token"

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2107
    :try_start_0
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v1}, Lcom/android/internal/backup/IBackupTransport;->getCurrentRestoreSet()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/android/server/BackupManagerService;->mCurrentToken:J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2109
    :goto_0
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v0}, Lcom/android/server/BackupManagerService;->writeRestoreTokens()V

    .line 2115
    :cond_1
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v0, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2116
    :try_start_1
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/android/server/BackupManagerService;->mBackupRunning:Z

    .line 2117
    iget v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 2119
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->clearMetadata()V

    .line 2120
    const-string v0, "PerformBackupTask"

    const-string v2, "Server requires init; rerunning"

    invoke-static {v0, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2121
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v2, "init required; rerunning"

    invoke-virtual {v0, v2}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2122
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v0}, Lcom/android/server/BackupManagerService;->backupNow()V

    .line 2124
    :cond_2
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2127
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v0}, Lcom/android/server/BackupManagerService;->clearBackupTrace()V

    .line 2128
    const-string v0, "PerformBackupTask"

    const-string v1, "Backup pass finished."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2129
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v0, v0, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 2130
    return-void

    .line 2124
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 2108
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public handleTimeout()V
    .locals 4

    .prologue
    .line 2288
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Timeout backing up "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2289
    const/16 v0, 0xb07

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "timeout"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2291
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "timeout of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2292
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->agentErrorCleanup()V

    .line 2293
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/server/BackupManagerService;->access$700(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    .line 2294
    return-void
.end method

.method invokeAgentForBackup(Ljava/lang/String;Landroid/app/IBackupAgent;Lcom/android/internal/backup/IBackupTransport;)I
    .locals 8
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "agent"    # Landroid/app/IBackupAgent;
    .param p3, "transport"    # Lcom/android/internal/backup/IBackupTransport;

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x0

    .line 2142
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invokeAgentForBackup on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2143
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invoking "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2145
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedStateName:Ljava/io/File;

    .line 2146
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v1, Lcom/android/server/BackupManagerService;->mDataDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".data"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    .line 2147
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStateDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".new"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    .line 2149
    iput-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    .line 2150
    iput-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    .line 2151
    iput-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    .line 2153
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    invoke-virtual {v0}, Lcom/android/server/BackupManagerService;->generateToken()I

    move-result v4

    .line 2158
    .local v4, "token":I
    :try_start_0
    const-string v0, "@pm@"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2161
    new-instance v0, Landroid/content/pm/PackageInfo;

    invoke-direct {v0}, Landroid/content/pm/PackageInfo;-><init>()V

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    .line 2162
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iput-object p1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 2168
    :cond_0
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedStateName:Ljava/io/File;

    const/high16 v1, 0x18000000

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    .line 2172
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    const/high16 v1, 0x3c000000

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    .line 2177
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-static {v0}, Landroid/os/SELinux;->restorecon(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2178
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SELinux restorecon failed on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2181
    :cond_1
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    const/high16 v1, 0x3c000000

    invoke-static {v0, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    .line 2187
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v1, "setting timeout"

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2188
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-wide/16 v1, 0x7530

    invoke-virtual {v0, v4, v1, v2, p0}, Lcom/android/server/BackupManagerService;->prepareOperationTimeout(IJLcom/android/server/BackupManagerService$BackupRestoreTask;)V

    .line 2189
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v1, "calling agent doBackup()"

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2190
    iget-object v1, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedState:Landroid/os/ParcelFileDescriptor;

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupData:Landroid/os/ParcelFileDescriptor;

    iget-object v3, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewState:Landroid/os/ParcelFileDescriptor;

    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v0, Lcom/android/server/BackupManagerService;->mBackupManagerBinder:Landroid/app/backup/IBackupManager;

    move-object v0, p2

    invoke-interface/range {v0 .. v5}, Landroid/app/IBackupAgent;->doBackup(Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;Landroid/os/ParcelFileDescriptor;ILandroid/app/backup/IBackupManager;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2204
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v1, "invoke success"

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    move v0, v7

    .line 2205
    :goto_0
    return v0

    .line 2191
    :catch_0
    move-exception v6

    .line 2192
    .local v6, "e":Ljava/lang/Exception;
    const-string v0, "PerformBackupTask"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error invoking for backup on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2193
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2194
    const/16 v0, 0xb07

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v7

    const/4 v2, 0x1

    invoke-virtual {v6}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2196
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->agentErrorCleanup()V

    .line 2197
    const/4 v0, 0x3

    goto :goto_0
.end method

.method invokeNextAgent()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v6, 0x0

    .line 1995
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 1996
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "invoke q="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2000
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2001
    const-string v5, "PerformBackupTask"

    const-string v6, "queue now empty"

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2002
    sget-object v5, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v5}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    .line 2088
    :goto_0
    return-void

    .line 2007
    :cond_0
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/BackupManagerService$BackupRequest;

    .line 2008
    .local v4, "request":Lcom/android/server/BackupManagerService$BackupRequest;
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2010
    const-string v5, "PerformBackupTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "starting agent for backup of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2011
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "launch agent for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2019
    :try_start_0
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    # getter for: Lcom/android/server/BackupManagerService;->mPackageManager:Landroid/content/pm/PackageManager;
    invoke-static {v5}, Lcom/android/server/BackupManagerService;->access$600(Lcom/android/server/BackupManagerService;)Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v7, v4, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    const/16 v8, 0x40

    invoke-virtual {v5, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iput-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    .line 2021
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->backupAgentName:Ljava/lang/String;

    if-nez v5, :cond_2

    .line 2025
    const-string v5, "PerformBackupTask"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Package "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " no longer supports backup; skipping"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2027
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v7, "skipping - no agent, completion is noop"

    invoke-virtual {v5, v7}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2028
    sget-object v5, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    invoke-virtual {p0, v5}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2058
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5, v11}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2062
    iget v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v5, :cond_c

    .line 2063
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    .line 2067
    .local v3, "nextState":Lcom/android/server/BackupManagerService$BackupState;
    iget v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v9, :cond_d

    .line 2070
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, v4, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v5, v7}, Lcom/android/server/BackupManagerService;->access$700(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    .line 2071
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2072
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    .line 2083
    :cond_1
    :goto_1
    invoke-virtual {p0, v3}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    goto/16 :goto_0

    .line 2032
    .end local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :cond_2
    const/4 v0, 0x0

    .line 2034
    .local v0, "agent":Landroid/app/IBackupAgent;
    :try_start_1
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    new-instance v7, Landroid/os/WorkSource;

    iget-object v8, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v8, v8, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-direct {v7, v8}, Landroid/os/WorkSource;-><init>(I)V

    invoke-virtual {v5, v7}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2035
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v7, v7, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Lcom/android/server/BackupManagerService;->bindToAgentSynchronous(Landroid/content/pm/ApplicationInfo;I)Landroid/app/IBackupAgent;

    move-result-object v0

    .line 2037
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "agent bound; a? = "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v0, :cond_3

    const/4 v5, 0x1

    :goto_2
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2038
    if-eqz v0, :cond_4

    .line 2039
    iget-object v5, v4, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-virtual {p0, v5, v0, v7}, Lcom/android/server/BackupManagerService$PerformBackupTask;->invokeAgentForBackup(Ljava/lang/String;Landroid/app/IBackupAgent;Lcom/android/internal/backup/IBackupTransport;)I

    move-result v5

    iput v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2058
    :goto_3
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5, v11}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2062
    iget v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v5, :cond_f

    .line 2063
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    .line 2067
    .restart local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    iget v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v9, :cond_10

    .line 2070
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, v4, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v5, v7}, Lcom/android/server/BackupManagerService;->access$700(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    .line 2071
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2072
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto :goto_1

    .end local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :cond_3
    move v5, v6

    .line 2037
    goto :goto_2

    .line 2045
    :cond_4
    const/4 v5, 0x3

    :try_start_2
    iput v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    .line 2047
    :catch_0
    move-exception v2

    .line 2049
    .local v2, "ex":Ljava/lang/SecurityException;
    :try_start_3
    const-string v5, "PerformBackupTask"

    const-string v7, "error in bind/backup"

    invoke-static {v5, v7, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2050
    const/4 v5, 0x3

    iput v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2051
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v7, "agent SE"

    invoke-virtual {v5, v7}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    .line 2053
    .end local v0    # "agent":Landroid/app/IBackupAgent;
    .end local v2    # "ex":Ljava/lang/SecurityException;
    :catch_1
    move-exception v1

    .line 2054
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :try_start_4
    const-string v5, "PerformBackupTask"

    const-string v7, "Package does not exist; skipping"

    invoke-static {v5, v7}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2055
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v7, "no such package"

    invoke-virtual {v5, v7}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2056
    const/4 v5, 0x4

    iput v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 2058
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, v5, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v5, v11}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2062
    iget v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v5, :cond_9

    .line 2063
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    .line 2067
    .restart local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    iget v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v9, :cond_a

    .line 2070
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, v4, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v5, v7}, Lcom/android/server/BackupManagerService;->access$700(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    .line 2071
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2072
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto/16 :goto_1

    .line 2058
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :catchall_0
    move-exception v5

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v7, v7, Lcom/android/server/BackupManagerService;->mWakelock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v7, v11}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    .line 2062
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v7, :cond_6

    .line 2063
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    .line 2067
    .restart local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v7, v9, :cond_7

    .line 2070
    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v8, v4, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/android/server/BackupManagerService;->access$700(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    .line 2071
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2072
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5

    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    .line 2083
    :cond_5
    :goto_4
    invoke-virtual {p0, v3}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    .line 2058
    .end local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :goto_5
    throw v5

    .line 2085
    :cond_6
    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v7, "expecting completion/timeout callback"

    invoke-virtual {v6, v7}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    goto :goto_5

    .line 2073
    .restart local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :cond_7
    iget v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v7, v10, :cond_8

    .line 2076
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    goto :goto_4

    .line 2079
    :cond_8
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2080
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto :goto_4

    .line 2085
    .end local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    .restart local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_9
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v6, "expecting completion/timeout callback"

    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :goto_6
    invoke-virtual {v5, v6}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2073
    .restart local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :cond_a
    iget v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v10, :cond_b

    .line 2076
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    goto/16 :goto_1

    .line 2079
    :cond_b
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2080
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto/16 :goto_1

    .line 2085
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .end local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :cond_c
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v6, "expecting completion/timeout callback"

    goto :goto_6

    .line 2073
    .restart local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :cond_d
    iget v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v10, :cond_e

    .line 2076
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    goto/16 :goto_1

    .line 2079
    :cond_e
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2080
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto/16 :goto_1

    .line 2085
    .end local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    .restart local v0    # "agent":Landroid/app/IBackupAgent;
    :cond_f
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v6, "expecting completion/timeout callback"

    goto :goto_6

    .line 2073
    .restart local v3    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :cond_10
    iget v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-ne v5, v10, :cond_11

    .line 2076
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    goto/16 :goto_1

    .line 2079
    :cond_11
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2080
    sget-object v3, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    goto/16 :goto_1
.end method

.method public operationComplete()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    .line 2214
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v4, v4, Lcom/android/server/BackupManagerService;->mBackupHandler:Lcom/android/server/BackupManagerService$BackupHandler;

    const/4 v5, 0x7

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService$BackupHandler;->removeMessages(I)V

    .line 2215
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->clearAgentState()V

    .line 2216
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v5, "operation complete"

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2218
    const/4 v0, 0x0

    .line 2219
    .local v0, "backupData":Landroid/os/ParcelFileDescriptor;
    iput v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2221
    :try_start_0
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    long-to-int v3, v4

    .line 2222
    .local v3, "size":I
    if-lez v3, :cond_3

    .line 2223
    iget v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v4, :cond_0

    .line 2224
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    const/high16 v5, 0x10000000

    invoke-static {v4, v5}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 2226
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v5, "sending data to transport"

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2227
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    invoke-interface {v4, v5, v0}, Lcom/android/internal/backup/IBackupTransport;->performBackup(Landroid/content/pm/PackageInfo;Landroid/os/ParcelFileDescriptor;)I

    move-result v4

    iput v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2235
    :cond_0
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "data delivered: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2236
    iget v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v4, :cond_1

    .line 2237
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v5, "finishing op on transport"

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2238
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v4}, Lcom/android/internal/backup/IBackupTransport;->finishBackup()I

    move-result v4

    iput v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    .line 2239
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "finished: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2249
    :cond_1
    :goto_0
    iget v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-nez v4, :cond_4

    .line 2250
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mBackupDataName:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 2251
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mNewStateName:Ljava/io/File;

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mSavedStateName:Ljava/io/File;

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 2252
    const/16 v4, 0xb08

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v7, v7, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2254
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService;->logBackupComplete(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2265
    :goto_1
    if-eqz v0, :cond_2

    :try_start_1
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2271
    .end local v3    # "size":I
    :cond_2
    :goto_2
    iget v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I

    if-eqz v4, :cond_6

    .line 2272
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->revertAndEndBackup()V

    .line 2273
    sget-object v2, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    .line 2279
    .local v2, "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :goto_3
    invoke-virtual {p0, v2}, Lcom/android/server/BackupManagerService$PerformBackupTask;->executeNextState(Lcom/android/server/BackupManagerService$BackupState;)V

    .line 2280
    return-void

    .line 2242
    .end local v2    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    .restart local v3    # "size":I
    :cond_3
    :try_start_2
    const-string v4, "PerformBackupTask"

    const-string v5, "no backup data written; not calling transport"

    invoke-static {v4, v5}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2243
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v5, "no data to send"

    invoke-virtual {v4, v5}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 2259
    .end local v3    # "size":I
    :catch_0
    move-exception v1

    .line 2260
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    const-string v4, "PerformBackupTask"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Transport error backing up "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v6, v6, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2261
    const/16 v4, 0xb06

    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    .line 2263
    const/4 v4, 0x1

    iput v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mStatus:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2265
    if-eqz v0, :cond_2

    :try_start_4
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    .end local v1    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v4

    goto :goto_2

    .line 2256
    .restart local v3    # "size":I
    :cond_4
    const/16 v4, 0xb06

    :try_start_5
    iget-object v5, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mCurrentPackage:Landroid/content/pm/PackageInfo;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v4, v5}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 2265
    .end local v3    # "size":I
    :catchall_0
    move-exception v4

    if-eqz v0, :cond_5

    :try_start_6
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    :cond_5
    :goto_4
    throw v4

    .line 2276
    :cond_6
    iget-object v4, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mQueue:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_7

    sget-object v2, Lcom/android/server/BackupManagerService$BackupState;->FINAL:Lcom/android/server/BackupManagerService$BackupState;

    .restart local v2    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :goto_5
    goto :goto_3

    .end local v2    # "nextState":Lcom/android/server/BackupManagerService$BackupState;
    :cond_7
    sget-object v2, Lcom/android/server/BackupManagerService$BackupState;->RUNNING_QUEUE:Lcom/android/server/BackupManagerService$BackupState;

    goto :goto_5

    .line 2265
    :catch_2
    move-exception v5

    goto :goto_4
.end method

.method restartBackupAlarm()V
    .locals 4

    .prologue
    .line 2335
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v1, "setting backup trigger"

    invoke-virtual {v0, v1}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2336
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v1, v0, Lcom/android/server/BackupManagerService;->mQueueLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2338
    :try_start_0
    iget-object v0, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mTransport:Lcom/android/internal/backup/IBackupTransport;

    invoke-interface {v2}, Lcom/android/internal/backup/IBackupTransport;->requestBackupTime()J

    move-result-wide v2

    # invokes: Lcom/android/server/BackupManagerService;->startBackupAlarmsLocked(J)V
    invoke-static {v0, v2, v3}, Lcom/android/server/BackupManagerService;->access$000(Lcom/android/server/BackupManagerService;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2340
    :goto_0
    :try_start_1
    monitor-exit v1

    .line 2341
    return-void

    .line 2340
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 2339
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method revertAndEndBackup()V
    .locals 4

    .prologue
    .line 2298
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    const-string v3, "transport error; reverting"

    invoke-virtual {v2, v3}, Lcom/android/server/BackupManagerService;->addBackupTrace(Ljava/lang/String;)V

    .line 2299
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->mOriginalQueue:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/BackupManagerService$BackupRequest;

    .line 2300
    .local v1, "request":Lcom/android/server/BackupManagerService$BackupRequest;
    iget-object v2, p0, Lcom/android/server/BackupManagerService$PerformBackupTask;->this$0:Lcom/android/server/BackupManagerService;

    iget-object v3, v1, Lcom/android/server/BackupManagerService$BackupRequest;->packageName:Ljava/lang/String;

    # invokes: Lcom/android/server/BackupManagerService;->dataChangedImpl(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/android/server/BackupManagerService;->access$700(Lcom/android/server/BackupManagerService;Ljava/lang/String;)V

    goto :goto_0

    .line 2304
    .end local v1    # "request":Lcom/android/server/BackupManagerService$BackupRequest;
    :cond_0
    invoke-virtual {p0}, Lcom/android/server/BackupManagerService$PerformBackupTask;->restartBackupAlarm()V

    .line 2305
    return-void
.end method
