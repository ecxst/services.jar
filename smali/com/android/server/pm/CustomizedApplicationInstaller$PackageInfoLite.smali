.class Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;
.super Ljava/lang/Object;
.source "CustomizedApplicationInstaller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/pm/CustomizedApplicationInstaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PackageInfoLite"
.end annotation


# instance fields
.field final mPackageName:Ljava/lang/String;

.field final mPath:Ljava/lang/String;

.field final mVersionCode:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "version"    # I

    .prologue
    .line 542
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 543
    iput-object p1, p0, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;->mPackageName:Ljava/lang/String;

    .line 544
    iput-object p2, p0, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;->mPath:Ljava/lang/String;

    .line 545
    iput p3, p0, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;->mVersionCode:I

    .line 546
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 549
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": version="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;->mVersionCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " : path="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
