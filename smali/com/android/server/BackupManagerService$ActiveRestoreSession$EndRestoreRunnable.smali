.class Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;
.super Ljava/lang/Object;
.source "BackupManagerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService$ActiveRestoreSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "EndRestoreRunnable"
.end annotation


# instance fields
.field mBackupManager:Lcom/android/server/BackupManagerService;

.field mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

.field final synthetic this$1:Lcom/android/server/BackupManagerService$ActiveRestoreSession;


# direct methods
.method constructor <init>(Lcom/android/server/BackupManagerService$ActiveRestoreSession;Lcom/android/server/BackupManagerService;Lcom/android/server/BackupManagerService$ActiveRestoreSession;)V
    .locals 0
    .param p2, "manager"    # Lcom/android/server/BackupManagerService;
    .param p3, "session"    # Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    .prologue
    .line 6093
    iput-object p1, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->this$1:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 6094
    iput-object p2, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mBackupManager:Lcom/android/server/BackupManagerService;

    .line 6095
    iput-object p3, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    .line 6096
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 6100
    iget-object v2, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    monitor-enter v2

    .line 6102
    :try_start_0
    iget-object v1, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    # getter for: Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mRestoreTransport:Lcom/android/internal/backup/IBackupTransport;
    invoke-static {v1}, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->access$2100(Lcom/android/server/BackupManagerService$ActiveRestoreSession;)Lcom/android/internal/backup/IBackupTransport;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 6103
    iget-object v1, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    # getter for: Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mRestoreTransport:Lcom/android/internal/backup/IBackupTransport;
    invoke-static {v1}, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->access$2100(Lcom/android/server/BackupManagerService$ActiveRestoreSession;)Lcom/android/internal/backup/IBackupTransport;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/backup/IBackupTransport;->finishRestore()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6108
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    const/4 v3, 0x0

    # setter for: Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mRestoreTransport:Lcom/android/internal/backup/IBackupTransport;
    invoke-static {v1, v3}, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->access$2102(Lcom/android/server/BackupManagerService$ActiveRestoreSession;Lcom/android/internal/backup/IBackupTransport;)Lcom/android/internal/backup/IBackupTransport;

    .line 6109
    iget-object v1, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mEnded:Z

    .line 6111
    :goto_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 6115
    iget-object v1, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mBackupManager:Lcom/android/server/BackupManagerService;

    iget-object v2, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    invoke-virtual {v1, v2}, Lcom/android/server/BackupManagerService;->clearRestoreSession(Lcom/android/server/BackupManagerService$ActiveRestoreSession;)V

    .line 6116
    return-void

    .line 6105
    :catch_0
    move-exception v0

    .line 6106
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    const-string v1, "RestoreSession"

    const-string v3, "Error in finishRestore"

    invoke-static {v1, v3, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 6108
    :try_start_3
    iget-object v1, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    const/4 v3, 0x0

    # setter for: Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mRestoreTransport:Lcom/android/internal/backup/IBackupTransport;
    invoke-static {v1, v3}, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->access$2102(Lcom/android/server/BackupManagerService$ActiveRestoreSession;Lcom/android/internal/backup/IBackupTransport;)Lcom/android/internal/backup/IBackupTransport;

    .line 6109
    iget-object v1, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    const/4 v3, 0x1

    iput-boolean v3, v1, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mEnded:Z

    goto :goto_0

    .line 6111
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 6108
    :catchall_1
    move-exception v1

    :try_start_4
    iget-object v3, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    const/4 v4, 0x0

    # setter for: Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mRestoreTransport:Lcom/android/internal/backup/IBackupTransport;
    invoke-static {v3, v4}, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->access$2102(Lcom/android/server/BackupManagerService$ActiveRestoreSession;Lcom/android/internal/backup/IBackupTransport;)Lcom/android/internal/backup/IBackupTransport;

    .line 6109
    iget-object v3, p0, Lcom/android/server/BackupManagerService$ActiveRestoreSession$EndRestoreRunnable;->mSession:Lcom/android/server/BackupManagerService$ActiveRestoreSession;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/android/server/BackupManagerService$ActiveRestoreSession;->mEnded:Z

    .line 6108
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method
