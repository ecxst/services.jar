.class abstract Lcom/android/server/BackupManagerService$ObbServiceClient;
.super Ljava/lang/Object;
.source "BackupManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/BackupManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "ObbServiceClient"
.end annotation


# instance fields
.field public mObbService:Lcom/android/internal/backup/IObbBackupService;

.field final synthetic this$0:Lcom/android/server/BackupManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/BackupManagerService;)V
    .locals 0

    .prologue
    .line 2356
    iput-object p1, p0, Lcom/android/server/BackupManagerService$ObbServiceClient;->this$0:Lcom/android/server/BackupManagerService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setObbBinder(Lcom/android/internal/backup/IObbBackupService;)V
    .locals 0
    .param p1, "binder"    # Lcom/android/internal/backup/IObbBackupService;

    .prologue
    .line 2359
    iput-object p1, p0, Lcom/android/server/BackupManagerService$ObbServiceClient;->mObbService:Lcom/android/internal/backup/IObbBackupService;

    .line 2360
    return-void
.end method
