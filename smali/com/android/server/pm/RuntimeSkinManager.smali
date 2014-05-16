.class Lcom/android/server/pm/RuntimeSkinManager;
.super Ljava/lang/Object;
.source "RuntimeSkinManager.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final DEBUG_VERBOSE:Z = false

.field static final TAG:Ljava/lang/String; = "RuntimeSkin"

.field private static final UPDATE_SEQUENCE:Ljava/lang/Runnable;


# instance fields
.field private final mApplicationSkinInstallDir:Ljava/io/File;

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private final mInstallLock:Ljava/lang/Object;

.field private final mInstaller:Lcom/android/server/pm/Installer;

.field private final mPackages:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/content/pm/PackageParser$Package;",
            ">;"
        }
    .end annotation
.end field

.field private final mPendingBroadcasts:Lcom/android/server/pm/PackageManagerService$PendingPackageBroadcasts;

.field private final mSettings:Lcom/android/server/pm/Settings;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 89
    new-instance v0, Lcom/android/server/pm/RuntimeSkinManager$1;

    invoke-direct {v0}, Lcom/android/server/pm/RuntimeSkinManager$1;-><init>()V

    sput-object v0, Lcom/android/server/pm/RuntimeSkinManager;->UPDATE_SEQUENCE:Ljava/lang/Runnable;

    return-void
.end method

.method constructor <init>(Ljava/io/File;Lcom/android/server/pm/PackageManagerService;)V
    .locals 2
    .param p1, "dataDir"    # Ljava/io/File;
    .param p2, "service"    # Lcom/android/server/pm/PackageManagerService;

    .prologue
    .line 156
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 157
    new-instance v0, Ljava/io/File;

    const-string v1, "app-skin"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mApplicationSkinInstallDir:Ljava/io/File;

    .line 158
    iget-object v0, p2, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    iput-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    .line 159
    iget-object v0, p2, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    iput-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    .line 160
    iget-object v0, p2, Lcom/android/server/pm/PackageManagerService;->mInstaller:Lcom/android/server/pm/Installer;

    iput-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstaller:Lcom/android/server/pm/Installer;

    .line 161
    iget-object v0, p2, Lcom/android/server/pm/PackageManagerService;->mInstallLock:Ljava/lang/Object;

    iput-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    .line 162
    iget-object v0, p2, Lcom/android/server/pm/PackageManagerService;->mPendingBroadcasts:Lcom/android/server/pm/PackageManagerService$PendingPackageBroadcasts;

    iput-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPendingBroadcasts:Lcom/android/server/pm/PackageManagerService$PendingPackageBroadcasts;

    .line 163
    iget-object v0, p2, Lcom/android/server/pm/PackageManagerService;->mContext:Landroid/content/Context;

    iput-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mContext:Landroid/content/Context;

    .line 164
    iget-object v0, p2, Lcom/android/server/pm/PackageManagerService;->mHandler:Lcom/android/server/pm/PackageManagerService$PackageHandler;

    iput-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mHandler:Landroid/os/Handler;

    .line 166
    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstaller:Lcom/android/server/pm/Installer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPendingBroadcasts:Lcom/android/server/pm/PackageManagerService$PendingPackageBroadcasts;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_1

    .line 169
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 171
    :cond_1
    return-void
.end method

.method private addPendingBroadcast(ILjava/lang/String;)V
    .locals 6
    .param p1, "userId"    # I
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 739
    iget-object v3, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPendingBroadcasts:Lcom/android/server/pm/PackageManagerService$PendingPackageBroadcasts;

    invoke-virtual {v3, p1, p2}, Lcom/android/server/pm/PackageManagerService$PendingPackageBroadcasts;->get(ILjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 740
    .local v0, "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-nez v0, :cond_3

    move v1, v2

    .line 741
    .local v1, "newPackage":Z
    :goto_0
    if-eqz v1, :cond_0

    .line 742
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 744
    .restart local v0    # "components":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 745
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 747
    :cond_1
    if-eqz v1, :cond_2

    .line 748
    iget-object v3, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPendingBroadcasts:Lcom/android/server/pm/PackageManagerService$PendingPackageBroadcasts;

    invoke-virtual {v3, p1, p2, v0}, Lcom/android/server/pm/PackageManagerService$PendingPackageBroadcasts;->put(ILjava/lang/String;Ljava/util/ArrayList;)V

    .line 751
    iget-object v3, p0, Lcom/android/server/pm/RuntimeSkinManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 752
    iget-object v3, p0, Lcom/android/server/pm/RuntimeSkinManager;->mHandler:Landroid/os/Handler;

    const-wide/16 v4, 0x12c

    invoke-virtual {v3, v2, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 754
    :cond_2
    return-void

    .line 740
    .end local v1    # "newPackage":Z
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private assertLock(Ljava/lang/Object;)V
    .locals 0
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 767
    return-void
.end method

.method private clearRuntimeSkinLP(I)Z
    .locals 3
    .param p1, "userId"    # I

    .prologue
    .line 778
    iget-object v2, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v2}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 779
    iget-object v2, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v2, v2, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/pm/PackageSetting;

    .line 780
    .local v1, "ps":Lcom/android/server/pm/PackageSetting;
    invoke-virtual {v1, p1}, Lcom/android/server/pm/PackageSetting;->readUserState(I)Landroid/content/pm/PackageUserState;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/PackageUserState;->runtimeSkinPaths:Ljava/util/LinkedHashSet;

    if-eqz v2, :cond_0

    .line 781
    iget-object v2, v1, Lcom/android/server/pm/PackageSettingBase;->name:Ljava/lang/String;

    invoke-direct {p0, p1, v2}, Lcom/android/server/pm/RuntimeSkinManager;->addPendingBroadcast(ILjava/lang/String;)V

    .line 783
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/android/server/pm/PackageSetting;->setUserRuntimeSkinState(ILjava/util/LinkedHashSet;)V

    goto :goto_0

    .line 785
    .end local v1    # "ps":Lcom/android/server/pm/PackageSetting;
    :cond_1
    const/4 v2, 0x1

    return v2
.end method

.method private copyApplicationSkin(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)Landroid/content/pm/RuntimeSkinDigest;
    .locals 9
    .param p1, "assets"    # Landroid/content/res/AssetManager;
    .param p2, "assetPath"    # Ljava/lang/String;
    .param p3, "scanPath"    # Ljava/lang/String;

    .prologue
    .line 799
    const/4 v5, 0x0

    .line 800
    .local v5, "result":Landroid/content/pm/RuntimeSkinDigest;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 801
    .local v0, "dest":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 802
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 805
    :cond_0
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 806
    .local v3, "is":Ljava/io/InputStream;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 807
    .local v4, "os":Ljava/io/OutputStream;
    invoke-static {v3, v4}, Landroid/content/pm/RuntimeSkinDigest;->createDigestFromStream(Ljava/io/InputStream;Ljava/io/OutputStream;)Landroid/content/pm/RuntimeSkinDigest;

    move-result-object v1

    .line 808
    .local v1, "digest":Landroid/content/pm/RuntimeSkinDigest;
    sget-object v6, Llibcore/io/Libcore;->os:Llibcore/io/Os;

    sget v7, Llibcore/io/OsConstants;->S_IRUSR:I

    sget v8, Llibcore/io/OsConstants;->S_IWUSR:I

    or-int/2addr v7, v8

    sget v8, Llibcore/io/OsConstants;->S_IRGRP:I

    or-int/2addr v7, v8

    sget v8, Llibcore/io/OsConstants;->S_IROTH:I

    or-int/2addr v7, v8

    invoke-interface {v6, p3, v7}, Llibcore/io/Os;->chmod(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Llibcore/io/ErrnoException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 809
    move-object v5, v1

    .line 815
    if-nez v5, :cond_1

    .line 816
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 823
    .end local v1    # "digest":Landroid/content/pm/RuntimeSkinDigest;
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v4    # "os":Ljava/io/OutputStream;
    :cond_1
    :goto_0
    return-object v5

    .line 810
    :catch_0
    move-exception v2

    .line 811
    .local v2, "e":Ljava/io/IOException;
    :try_start_1
    const-string v6, "RuntimeSkin"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error copying "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 815
    if-nez v5, :cond_1

    .line 816
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 812
    .end local v2    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 813
    .local v2, "e":Llibcore/io/ErrnoException;
    :try_start_2
    const-string v6, "RuntimeSkin"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error when attempting chmod on "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v2}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 815
    if-nez v5, :cond_1

    .line 816
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 815
    .end local v2    # "e":Llibcore/io/ErrnoException;
    :catchall_0
    move-exception v6

    if-nez v5, :cond_2

    .line 816
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_2
    throw v6
.end method

.method private deleteAllFiles(Ljava/io/File;)Z
    .locals 9
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 846
    const/4 v5, 0x1

    .line 847
    .local v5, "result":Z
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 848
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 849
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_1

    .line 850
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v1, v0, v3

    .line 851
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v6

    if-nez v6, :cond_0

    .line 852
    const-string v6, "RuntimeSkin"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error deleting "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 853
    const/4 v5, 0x0

    .line 850
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 857
    .end local v0    # "arr$":[Ljava/io/File;
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_1
    const-string v6, "RuntimeSkin"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error listing contents of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 860
    .end local v2    # "files":[Ljava/io/File;
    :cond_2
    return v5
.end method

.method private deleteApplicationSkinFolder(Ljava/lang/String;)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 831
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/android/server/pm/RuntimeSkinManager;->mApplicationSkinInstallDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 832
    .local v0, "appSkinDir":Ljava/io/File;
    invoke-direct {p0, v0}, Lcom/android/server/pm/RuntimeSkinManager;->deleteAllFiles(Ljava/io/File;)Z

    .line 833
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 834
    return-void
.end method

.method private deletePackageForUserLI(Ljava/lang/String;I)Z
    .locals 10
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "userId"    # I

    .prologue
    .line 877
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v8}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 879
    sget-object v8, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v8, p2}, Lcom/android/server/pm/UserManagerService;->exists(I)Z

    move-result v8

    if-nez v8, :cond_0

    .line 880
    const/4 v6, 0x0

    .line 914
    :goto_0
    return v6

    .line 883
    :cond_0
    const/4 v6, 0x0

    .line 884
    .local v6, "updateSequence":Z
    iget-object v9, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    monitor-enter v9

    .line 886
    const/4 v7, 0x0

    .line 887
    .local v7, "writeSettings":Z
    :try_start_0
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v8, v8, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/pm/PackageSetting;

    .line 888
    .local v3, "ps":Lcom/android/server/pm/PackageSetting;
    invoke-virtual {v3, p2}, Lcom/android/server/pm/PackageSetting;->readUserState(I)Landroid/content/pm/PackageUserState;

    move-result-object v8

    iget-object v5, v8, Landroid/content/pm/PackageUserState;->runtimeSkinPaths:Ljava/util/LinkedHashSet;

    .line 890
    .local v5, "skins":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz v5, :cond_1

    .line 891
    const/4 v0, 0x0

    .line 892
    .local v0, "change":Z
    invoke-virtual {v5}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    :cond_2
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 893
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    .line 894
    .local v4, "skin":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v8, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 899
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 900
    const/4 v0, 0x1

    goto :goto_2

    .line 903
    .end local v4    # "skin":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    if-eqz v0, :cond_1

    .line 904
    const/4 v7, 0x1

    .line 905
    invoke-virtual {v3, p2, v5}, Lcom/android/server/pm/PackageSetting;->setUserRuntimeSkinState(ILjava/util/LinkedHashSet;)V

    goto :goto_1

    .line 913
    .end local v0    # "change":Z
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v3    # "ps":Lcom/android/server/pm/PackageSetting;
    .end local v5    # "skins":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8

    .line 909
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_4
    if-eqz v7, :cond_5

    .line 910
    const/4 v6, 0x1

    .line 911
    :try_start_1
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v8, p2}, Lcom/android/server/pm/Settings;->writePackageRestrictionsLPr(I)V

    .line 913
    :cond_5
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method private deletePackageForUserLI(Ljava/lang/String;Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;I)Z
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "res"    # Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;
    .param p3, "userId"    # I

    .prologue
    .line 252
    iget-object v1, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v1}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 253
    iget-object v1, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v1}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 255
    const/4 v0, 0x0

    .line 256
    .local v0, "updateSequence":Z
    invoke-direct {p0, p1, p3}, Lcom/android/server/pm/RuntimeSkinManager;->deletePackageForUserLI(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 257
    if-eqz p2, :cond_0

    .line 258
    iget-object v1, p2, Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;->skinForUsers:[I

    invoke-static {v1, p3}, Lcom/android/internal/util/ArrayUtils;->appendInt([II)[I

    move-result-object v1

    iput-object v1, p2, Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;->skinForUsers:[I

    .line 260
    :cond_0
    const/4 v0, 0x1

    .line 262
    :cond_1
    return v0
.end method

.method private getApplicationSkinScanPath(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "appSkinDir"    # Ljava/io/File;
    .param p2, "assetPath"    # Ljava/lang/String;

    .prologue
    .line 925
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p2

    .line 926
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getDefaultSkinPackage()Ljava/lang/String;
    .locals 3

    .prologue
    .line 935
    iget-object v1, p0, Lcom/android/server/pm/RuntimeSkinManager;->mContext:Landroid/content/Context;

    const v2, 0x1040038

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 939
    .local v0, "packageName":Ljava/lang/String;
    const-string v1, "@0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    .end local v0    # "packageName":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method private getRuntimeSkinLP(I)Landroid/content/pm/PackageParser$Package;
    .locals 7
    .param p1, "userId"    # I

    .prologue
    .line 949
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v5}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 953
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v5, v5, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/pm/PackageSetting;

    .line 954
    .local v3, "ps":Lcom/android/server/pm/PackageSetting;
    invoke-virtual {v3, p1}, Lcom/android/server/pm/PackageSetting;->readUserState(I)Landroid/content/pm/PackageUserState;

    move-result-object v5

    iget-object v1, v5, Landroid/content/pm/PackageUserState;->runtimeSkinPaths:Ljava/util/LinkedHashSet;

    .line 956
    .local v1, "paths":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    .line 957
    invoke-virtual {v1}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/util/Pair;

    .line 958
    .local v4, "skin":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v5, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 959
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    iget-object v6, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/PackageParser$Package;

    .line 960
    .local v2, "pkg":Landroid/content/pm/PackageParser$Package;
    if-eqz v2, :cond_0

    iget-object v5, v2, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    if-eqz v5, :cond_0

    .line 966
    .end local v1    # "paths":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v2    # "pkg":Landroid/content/pm/PackageParser$Package;
    .end local v3    # "ps":Lcom/android/server/pm/PackageSetting;
    .end local v4    # "skin":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getUpgradedSkinPackageLP(I)Ljava/lang/String;
    .locals 4
    .param p1, "userId"    # I

    .prologue
    .line 977
    iget-object v3, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v3}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 978
    invoke-static {p1}, Lcom/android/server/pm/RuntimeSkinUpgradeUtil;->getUpgradedPath(I)Ljava/lang/String;

    move-result-object v1

    .line 979
    .local v1, "path":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 980
    iget-object v3, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/PackageParser$Package;

    .line 981
    .local v2, "pkg":Landroid/content/pm/PackageParser$Package;
    iget-object v3, v2, Landroid/content/pm/PackageParser$Package;->mScanPath:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, v2, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    if-eqz v3, :cond_0

    .line 982
    iget-object v3, v2, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    .line 986
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "pkg":Landroid/content/pm/PackageParser$Package;
    :goto_0
    return-object v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private getUsersForUserId(I)[I
    .locals 3
    .param p1, "userId"    # I

    .prologue
    const/4 v2, 0x0

    .line 997
    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    .line 998
    sget-object v1, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v1}, Lcom/android/server/pm/UserManagerService;->getUserIds()[I

    move-result-object v0

    .line 1005
    :goto_0
    return-object v0

    .line 1000
    :cond_0
    sget-object v1, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v1, p1}, Lcom/android/server/pm/UserManagerService;->exists(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1001
    new-array v0, v2, [I

    goto :goto_0

    .line 1003
    :cond_1
    const/4 v1, 0x1

    new-array v0, v1, [I

    aput p1, v0, v2

    .local v0, "users":[I
    goto :goto_0
.end method

.method private varargs initRuntimeSkinLI(I[Ljava/lang/String;)Z
    .locals 6
    .param p1, "userId"    # I
    .param p2, "skinPackages"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 1020
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v5}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 1021
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v5}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 1022
    sget-object v5, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v5, p1}, Lcom/android/server/pm/UserManagerService;->exists(I)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1038
    :cond_0
    :goto_0
    return v3

    .line 1027
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/server/pm/RuntimeSkinManager;->getRuntimeSkinLP(I)Landroid/content/pm/PackageParser$Package;

    move-result-object v5

    if-eqz v5, :cond_2

    const/4 v3, 0x1

    .line 1028
    .local v3, "result":Z
    :cond_2
    if-nez v3, :cond_0

    .line 1030
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 1031
    .local v4, "skinPackage":Ljava/lang/String;
    if-eqz v4, :cond_3

    invoke-direct {p0, p1, v4}, Lcom/android/server/pm/RuntimeSkinManager;->setRuntimeSkinLI(ILjava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1032
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v5, p1}, Lcom/android/server/pm/Settings;->writePackageRestrictionsLPr(I)V

    .line 1033
    const/4 v3, 0x1

    .line 1034
    goto :goto_0

    .line 1030
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private isSystemSignedLP(Landroid/content/pm/PackageParser$Package;)Z
    .locals 3
    .param p1, "pkg"    # Landroid/content/pm/PackageParser$Package;

    .prologue
    .line 1049
    iget-object v1, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v1}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 1055
    iget-object v1, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    const-string v2, "android"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageParser$Package;

    .line 1056
    .local v0, "apkg":Landroid/content/pm/PackageParser$Package;
    if-eqz v0, :cond_0

    iget-object v1, v0, Landroid/content/pm/PackageParser$Package;->mSignatures:[Landroid/content/pm/Signature;

    iget-object v2, p1, Landroid/content/pm/PackageParser$Package;->mSignatures:[Landroid/content/pm/Signature;

    invoke-static {v1, v2}, Lcom/android/server/pm/PackageManagerService;->compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I

    move-result v1

    if-nez v1, :cond_0

    .line 1058
    const/4 v1, 0x1

    .line 1061
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isValidLP(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)Z
    .locals 2
    .param p1, "ps"    # Lcom/android/server/pm/PackageSetting;
    .param p2, "skinPs"    # Lcom/android/server/pm/PackageSetting;
    .param p3, "rsi"    # Landroid/content/pm/RuntimeSkinInfo;

    .prologue
    .line 1211
    const/4 v0, 0x0

    .line 1212
    .local v0, "valid":Z
    iget-object v1, p1, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    invoke-virtual {p3, v1}, Landroid/content/pm/RuntimeSkinInfo;->isValid(Landroid/content/pm/PackageParser$Package;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1213
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/pm/RuntimeSkinManager;->isVerifiedLP(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1217
    const/4 v0, 0x1

    .line 1222
    :cond_0
    return v0
.end method

.method private isVerificationOkLP(Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinVerificationInfo;)Z
    .locals 5
    .param p1, "skinPs"    # Lcom/android/server/pm/PackageSetting;
    .param p2, "ver"    # Landroid/content/pm/RuntimeSkinVerificationInfo;

    .prologue
    .line 1271
    iget-object v2, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v2, v2, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    iget-object v3, p2, Landroid/content/pm/RuntimeSkinVerificationInfo;->targetPackageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/pm/PackageSetting;

    .line 1273
    .local v1, "ps":Lcom/android/server/pm/PackageSetting;
    if-eqz v1, :cond_1

    iget-boolean v2, p2, Landroid/content/pm/RuntimeSkinVerificationInfo;->verified:Z

    if-eqz v2, :cond_1

    iget-object v2, p2, Landroid/content/pm/RuntimeSkinVerificationInfo;->digest:Landroid/content/pm/RuntimeSkinDigest;

    if-eqz v2, :cond_1

    .line 1274
    iget-object v2, p2, Landroid/content/pm/RuntimeSkinVerificationInfo;->assetPath:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/android/server/pm/PackageSetting;->getRuntimeSkinDigest(Ljava/lang/String;)Landroid/content/pm/RuntimeSkinDigest;

    move-result-object v0

    .line 1277
    .local v0, "digest":Landroid/content/pm/RuntimeSkinDigest;
    iget-object v2, p2, Landroid/content/pm/RuntimeSkinVerificationInfo;->digest:Landroid/content/pm/RuntimeSkinDigest;

    invoke-virtual {v2, v0}, Landroid/content/pm/RuntimeSkinDigest;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v1, Lcom/android/server/pm/PackageSettingBase;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v2, v2, Lcom/android/server/pm/PackageSignatures;->mSignatures:[Landroid/content/pm/Signature;

    iget-object v3, p2, Landroid/content/pm/RuntimeSkinVerificationInfo;->targetSignatures:[Landroid/content/pm/Signature;

    invoke-static {v2, v3}, Lcom/android/server/pm/PackageManagerService;->compareSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)I

    move-result v2

    if-nez v2, :cond_0

    .line 1285
    const/4 v2, 0x1

    .line 1296
    .end local v0    # "digest":Landroid/content/pm/RuntimeSkinDigest;
    :goto_0
    return v2

    .line 1288
    .restart local v0    # "digest":Landroid/content/pm/RuntimeSkinDigest;
    :cond_0
    const-string v2, "RuntimeSkin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p2, Landroid/content/pm/RuntimeSkinVerificationInfo;->assetPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " can not be verified, digest="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p2, Landroid/content/pm/RuntimeSkinVerificationInfo;->digest:Landroid/content/pm/RuntimeSkinDigest;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") or signatures does not match stored digest="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1296
    .end local v0    # "digest":Landroid/content/pm/RuntimeSkinDigest;
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private isVerifiedLP(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)Z
    .locals 5
    .param p1, "ps"    # Lcom/android/server/pm/PackageSetting;
    .param p2, "skinPs"    # Lcom/android/server/pm/PackageSetting;
    .param p3, "rsi"    # Landroid/content/pm/RuntimeSkinInfo;

    .prologue
    .line 1236
    const/4 v0, 0x0

    .line 1237
    .local v0, "verified":Z
    iget-boolean v1, p3, Landroid/content/pm/RuntimeSkinInfo;->trusted:Z

    if-nez v1, :cond_0

    iget-object v1, p2, Lcom/android/server/pm/PackageSettingBase;->verifiedRuntimeSkins:Ljava/util/HashSet;

    if-eqz v1, :cond_1

    iget-object v1, p2, Lcom/android/server/pm/PackageSettingBase;->verifiedRuntimeSkins:Ljava/util/HashSet;

    new-instance v2, Landroid/util/Pair;

    iget-object v3, p3, Landroid/content/pm/RuntimeSkinInfo;->assetPath:Ljava/lang/String;

    iget v4, p1, Lcom/android/server/pm/PackageSettingBase;->versionCode:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1243
    :cond_0
    const/4 v0, 0x1

    .line 1257
    :cond_1
    return v0
.end method

.method private setRuntimeSkinLI(ILjava/lang/String;)Z
    .locals 9
    .param p1, "userId"    # I
    .param p2, "skinPackageName"    # Ljava/lang/String;

    .prologue
    .line 1073
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v8}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 1074
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v8}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 1076
    const/4 v4, 0x0

    .line 1082
    .local v4, "result":Z
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v8, v8, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/server/pm/PackageSetting;

    .line 1083
    .local v3, "ps":Lcom/android/server/pm/PackageSetting;
    invoke-virtual {v3, p1}, Lcom/android/server/pm/PackageSetting;->readUserState(I)Landroid/content/pm/PackageUserState;

    move-result-object v8

    iget-object v8, v8, Landroid/content/pm/PackageUserState;->runtimeSkinPaths:Ljava/util/LinkedHashSet;

    if-eqz v8, :cond_0

    .line 1084
    const/4 v8, 0x0

    invoke-virtual {v3, p1, v8}, Lcom/android/server/pm/PackageSetting;->setUserRuntimeSkinState(ILjava/util/LinkedHashSet;)V

    .line 1085
    const/4 v4, 0x1

    goto :goto_0

    .line 1089
    .end local v3    # "ps":Lcom/android/server/pm/PackageSetting;
    :cond_1
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v8, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/pm/PackageParser$Package;

    .line 1090
    .local v7, "skinPkg":Landroid/content/pm/PackageParser$Package;
    if-eqz v7, :cond_4

    iget-object v8, v7, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    if-eqz v8, :cond_4

    .line 1092
    iget-object v0, v7, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    .local v0, "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v2, :cond_4

    aget-object v6, v0, v1

    .line 1093
    .local v6, "rsi":Landroid/content/pm/RuntimeSkinInfo;
    invoke-direct {p0, p1, p2, v6}, Lcom/android/server/pm/RuntimeSkinManager;->setRuntimeSkinLI(ILjava/lang/String;Landroid/content/pm/RuntimeSkinInfo;)Z

    move-result v5

    .line 1094
    .local v5, "ret":Z
    if-nez v4, :cond_2

    if-eqz v5, :cond_3

    :cond_2
    const/4 v4, 0x1

    .line 1092
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1094
    :cond_3
    const/4 v4, 0x0

    goto :goto_2

    .line 1102
    .end local v0    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v5    # "ret":Z
    .end local v6    # "rsi":Landroid/content/pm/RuntimeSkinInfo;
    :cond_4
    return v4
.end method

.method private setRuntimeSkinLI(ILjava/lang/String;Landroid/content/pm/RuntimeSkinInfo;)Z
    .locals 7
    .param p1, "userId"    # I
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "rsi"    # Landroid/content/pm/RuntimeSkinInfo;

    .prologue
    .line 1115
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v5}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 1116
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v5}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 1120
    if-eqz p2, :cond_0

    iget-object v5, p3, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    if-nez v5, :cond_2

    .line 1121
    :cond_0
    const/4 v2, 0x0

    .line 1153
    :cond_1
    :goto_0
    return v2

    .line 1123
    :cond_2
    const/4 v2, 0x0

    .line 1124
    .local v2, "result":Z
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v5, v5, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    iget-object v6, p3, Landroid/content/pm/RuntimeSkinInfo;->targetPackageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/pm/PackageSetting;

    .line 1125
    .local v1, "ps":Lcom/android/server/pm/PackageSetting;
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v5, v5, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v5, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/pm/PackageSetting;

    .line 1126
    .local v4, "skinPs":Lcom/android/server/pm/PackageSetting;
    if-eqz v1, :cond_1

    if-eqz v4, :cond_1

    .line 1128
    invoke-direct {p0, v4, p3}, Lcom/android/server/pm/RuntimeSkinManager;->updateIdmapLI(Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)V

    .line 1131
    invoke-direct {p0, v1, v4, p3}, Lcom/android/server/pm/RuntimeSkinManager;->isValidLP(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 1132
    iget-object v5, p3, Landroid/content/pm/RuntimeSkinInfo;->targetPackageName:Ljava/lang/String;

    invoke-direct {p0, p1, v5}, Lcom/android/server/pm/RuntimeSkinManager;->addPendingBroadcast(ILjava/lang/String;)V

    .line 1133
    iget-object v3, p3, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    .line 1141
    .local v3, "scanPath":Ljava/lang/String;
    :goto_1
    invoke-virtual {v1, p1}, Lcom/android/server/pm/PackageSetting;->readUserState(I)Landroid/content/pm/PackageUserState;

    move-result-object v5

    iget-object v0, v5, Landroid/content/pm/PackageUserState;->runtimeSkinPaths:Ljava/util/LinkedHashSet;

    .line 1142
    .local v0, "paths":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-nez v0, :cond_3

    .line 1143
    new-instance v0, Ljava/util/LinkedHashSet;

    .end local v0    # "paths":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v5, 0x1

    invoke-direct {v0, v5}, Ljava/util/LinkedHashSet;-><init>(I)V

    .line 1145
    .restart local v0    # "paths":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    :cond_3
    new-instance v5, Landroid/util/Pair;

    invoke-direct {v5, p2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 1146
    invoke-virtual {v1, p1, v0}, Lcom/android/server/pm/PackageSetting;->setUserRuntimeSkinState(ILjava/util/LinkedHashSet;)V

    .line 1147
    const/4 v2, 0x1

    goto :goto_0

    .line 1139
    .end local v0    # "paths":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v3    # "scanPath":Ljava/lang/String;
    :cond_4
    const/4 v3, 0x0

    .restart local v3    # "scanPath":Ljava/lang/String;
    goto :goto_1
.end method

.method private updateIdmapLI(Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)V
    .locals 7
    .param p1, "skinPs"    # Lcom/android/server/pm/PackageSetting;
    .param p2, "rsi"    # Landroid/content/pm/RuntimeSkinInfo;

    .prologue
    .line 1163
    iget-object v4, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v4}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 1164
    iget-object v4, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v4}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 1166
    iget-object v4, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v4, v4, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    iget-object v5, p2, Landroid/content/pm/RuntimeSkinInfo;->targetPackageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/PackageSetting;

    .line 1167
    .local v0, "ps":Lcom/android/server/pm/PackageSetting;
    const/4 v1, 0x1

    .line 1169
    .local v1, "removeIdmap":Z
    if-eqz v0, :cond_0

    iget-object v4, v0, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    if-eqz v4, :cond_0

    invoke-direct {p0, v0, p1, p2}, Lcom/android/server/pm/RuntimeSkinManager;->isValidLP(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1170
    iget-object v4, v0, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    iget-object v4, v4, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v4, v4, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v4}, Landroid/os/UserHandle;->getSharedAppGid(I)I

    move-result v3

    .line 1171
    .local v3, "sharedGid":I
    iget-object v4, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstaller:Lcom/android/server/pm/Installer;

    iget-object v5, v0, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    iget-object v5, v5, Landroid/content/pm/PackageParser$Package;->mScanPath:Ljava/lang/String;

    iget-object v6, p2, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    invoke-virtual {v4, v5, v6, v3}, Lcom/android/server/pm/Installer;->idmap(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    .line 1172
    .local v2, "ret":I
    if-eqz v2, :cond_2

    const/4 v1, 0x1

    .line 1187
    .end local v2    # "ret":I
    .end local v3    # "sharedGid":I
    :cond_0
    :goto_0
    if-eqz v1, :cond_1

    .line 1191
    iget-object v4, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstaller:Lcom/android/server/pm/Installer;

    iget-object v5, p2, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/android/server/pm/Installer;->removeIdmap(Ljava/lang/String;)I

    .line 1193
    :cond_1
    return-void

    .line 1172
    .restart local v2    # "ret":I
    .restart local v3    # "sharedGid":I
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private updateRuntimeSkinSequence()V
    .locals 2

    .prologue
    .line 1304
    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mHandler:Landroid/os/Handler;

    sget-object v1, Lcom/android/server/pm/RuntimeSkinManager;->UPDATE_SEQUENCE:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1305
    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mHandler:Landroid/os/Handler;

    sget-object v1, Lcom/android/server/pm/RuntimeSkinManager;->UPDATE_SEQUENCE:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1306
    return-void
.end method


# virtual methods
.method public cleanPackageLI(Landroid/content/pm/PackageParser$Package;)V
    .locals 6
    .param p1, "pkg"    # Landroid/content/pm/PackageParser$Package;

    .prologue
    .line 183
    iget-object v4, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v4}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 184
    iget-object v4, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v4}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 186
    iget-object v4, p1, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    if-eqz v4, :cond_0

    .line 187
    iget-object v0, p1, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    .local v0, "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 192
    .local v3, "rsi":Landroid/content/pm/RuntimeSkinInfo;
    iget-object v4, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstaller:Lcom/android/server/pm/Installer;

    iget-object v5, v3, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/android/server/pm/Installer;->removeIdmap(Ljava/lang/String;)I

    .line 187
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 196
    .end local v0    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "rsi":Landroid/content/pm/RuntimeSkinInfo;
    :cond_0
    iget-object v4, p1, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/android/server/pm/RuntimeSkinManager;->deleteApplicationSkinFolder(Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public deletePackageLI(Ljava/lang/String;Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;)V
    .locals 8
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "res"    # Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;

    .prologue
    .line 209
    iget-object v6, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v6}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 211
    const/4 v4, 0x0

    .line 213
    .local v4, "updateSequence":Z
    iget-object v7, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    monitor-enter v7

    .line 214
    :try_start_0
    sget-object v6, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v6}, Lcom/android/server/pm/UserManagerService;->getUserIds()[I

    move-result-object v0

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget v5, v0, v1

    .line 215
    .local v5, "userId":I
    invoke-direct {p0, p1, p2, v5}, Lcom/android/server/pm/RuntimeSkinManager;->deletePackageForUserLI(Ljava/lang/String;Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;I)Z

    move-result v3

    .line 216
    .local v3, "ret":Z
    or-int/2addr v4, v3

    .line 214
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 218
    .end local v3    # "ret":Z
    .end local v5    # "userId":I
    :cond_0
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    if-eqz v4, :cond_1

    .line 221
    invoke-direct {p0}, Lcom/android/server/pm/RuntimeSkinManager;->updateRuntimeSkinSequence()V

    .line 223
    :cond_1
    return-void

    .line 218
    .end local v0    # "arr$":[I
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    :catchall_0
    move-exception v6

    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v6
.end method

.method public deletePackageLI(Ljava/lang/String;Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;I)V
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "res"    # Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;
    .param p3, "userId"    # I

    .prologue
    .line 236
    iget-object v0, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 238
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/pm/RuntimeSkinManager;->deletePackageForUserLI(Ljava/lang/String;Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 239
    invoke-direct {p0}, Lcom/android/server/pm/RuntimeSkinManager;->updateRuntimeSkinSequence()V

    .line 241
    :cond_0
    return-void
.end method

.method public getActiveRuntimeSkinPaths(I)[Ljava/lang/String;
    .locals 13
    .param p1, "userId"    # I

    .prologue
    .line 436
    new-instance v5, Ljava/util/LinkedHashSet;

    invoke-direct {v5}, Ljava/util/LinkedHashSet;-><init>()V

    .line 437
    .local v5, "paths":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    iget-object v12, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    monitor-enter v12

    .line 438
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/server/pm/RuntimeSkinManager;->getUsersForUserId(I)[I

    move-result-object v10

    .line 439
    .local v10, "users":[I
    iget-object v11, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v11, v11, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    invoke-virtual {v11}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/server/pm/PackageSetting;

    .line 440
    .local v6, "ps":Lcom/android/server/pm/PackageSetting;
    move-object v0, v10

    .local v0, "arr$":[I
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    move v3, v2

    .end local v2    # "i$":I
    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget v9, v0, v3

    .line 441
    .local v9, "uid":I
    invoke-virtual {v6, v9}, Lcom/android/server/pm/PackageSetting;->readUserState(I)Landroid/content/pm/PackageUserState;

    move-result-object v7

    .line 442
    .local v7, "pus":Landroid/content/pm/PackageUserState;
    iget-object v11, v7, Landroid/content/pm/PackageUserState;->runtimeSkinPaths:Ljava/util/LinkedHashSet;

    if-eqz v11, :cond_2

    .line 443
    iget-object v11, v7, Landroid/content/pm/PackageUserState;->runtimeSkinPaths:Ljava/util/LinkedHashSet;

    invoke-virtual {v11}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .end local v3    # "i$":I
    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/util/Pair;

    .line 444
    .local v8, "skin":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v11, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-eqz v11, :cond_1

    .line 445
    iget-object v11, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v5, v11}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 451
    .end local v0    # "arr$":[I
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v4    # "len$":I
    .end local v6    # "ps":Lcom/android/server/pm/PackageSetting;
    .end local v7    # "pus":Landroid/content/pm/PackageUserState;
    .end local v8    # "skin":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "uid":I
    .end local v10    # "users":[I
    :catchall_0
    move-exception v11

    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v11

    .line 440
    .restart local v0    # "arr$":[I
    .restart local v4    # "len$":I
    .restart local v6    # "ps":Lcom/android/server/pm/PackageSetting;
    .restart local v7    # "pus":Landroid/content/pm/PackageUserState;
    .restart local v9    # "uid":I
    .restart local v10    # "users":[I
    :cond_2
    add-int/lit8 v2, v3, 0x1

    .local v2, "i$":I
    move v3, v2

    .end local v2    # "i$":I
    .restart local v3    # "i$":I
    goto :goto_0

    .line 451
    .end local v0    # "arr$":[I
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v6    # "ps":Lcom/android/server/pm/PackageSetting;
    .end local v7    # "pus":Landroid/content/pm/PackageUserState;
    .end local v9    # "uid":I
    :cond_3
    :try_start_1
    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 452
    invoke-virtual {v5}, Ljava/util/LinkedHashSet;->size()I

    move-result v11

    new-array v11, v11, [Ljava/lang/String;

    invoke-virtual {v5, v11}, Ljava/util/LinkedHashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Ljava/lang/String;

    return-object v11
.end method

.method public getRuntimeSkin(I)Ljava/lang/String;
    .locals 4
    .param p1, "userId"    # I

    .prologue
    const/4 v2, 0x0

    .line 463
    sget-object v3, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v3, p1}, Lcom/android/server/pm/UserManagerService;->exists(I)Z

    move-result v3

    if-nez v3, :cond_0

    move-object v0, v2

    .line 475
    :goto_0
    return-object v0

    .line 467
    :cond_0
    const/4 v0, 0x0

    .line 468
    .local v0, "packageName":Ljava/lang/String;
    iget-object v3, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    monitor-enter v3

    .line 469
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/server/pm/RuntimeSkinManager;->getRuntimeSkinLP(I)Landroid/content/pm/PackageParser$Package;

    move-result-object v1

    .line 470
    .local v1, "pkg":Landroid/content/pm/PackageParser$Package;
    if-eqz v1, :cond_1

    iget-object v0, v1, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    .line 471
    :goto_1
    monitor-exit v3

    goto :goto_0

    .end local v1    # "pkg":Landroid/content/pm/PackageParser$Package;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v1    # "pkg":Landroid/content/pm/PackageParser$Package;
    :cond_1
    move-object v0, v2

    .line 470
    goto :goto_1
.end method

.method public getRuntimeSkinVerificationInfo(Ljava/lang/String;)[Landroid/content/pm/RuntimeSkinVerificationInfo;
    .locals 19
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 342
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    move-object/from16 v16, v0

    monitor-enter v16

    .line 343
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v15, v15, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/android/server/pm/PackageSetting;

    .line 344
    .local v14, "skinPs":Lcom/android/server/pm/PackageSetting;
    if-eqz v14, :cond_4

    iget-object v15, v14, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    iget-object v15, v15, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    if-eqz v15, :cond_4

    .line 345
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 347
    .local v9, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/pm/RuntimeSkinVerificationInfo;>;"
    iget-object v15, v14, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    iget-object v2, v15, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    .local v2, "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    array-length v7, v2

    .local v7, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v7, :cond_3

    aget-object v10, v2, v4

    .line 348
    .local v10, "rsi":Landroid/content/pm/RuntimeSkinInfo;
    new-instance v11, Landroid/content/pm/RuntimeSkinVerificationInfo;

    invoke-direct {v11}, Landroid/content/pm/RuntimeSkinVerificationInfo;-><init>()V

    .line 349
    .local v11, "rsvi":Landroid/content/pm/RuntimeSkinVerificationInfo;
    iget-object v15, v10, Landroid/content/pm/RuntimeSkinInfo;->assetPath:Ljava/lang/String;

    iput-object v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->assetPath:Ljava/lang/String;

    .line 350
    iget-object v15, v10, Landroid/content/pm/RuntimeSkinInfo;->targetPackageName:Ljava/lang/String;

    iput-object v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->targetPackageName:Ljava/lang/String;

    .line 351
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v15, v15, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    iget-object v0, v10, Landroid/content/pm/RuntimeSkinInfo;->targetPackageName:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/server/pm/PackageSetting;

    .line 352
    .local v8, "ps":Lcom/android/server/pm/PackageSetting;
    if-eqz v8, :cond_2

    .line 353
    iget v15, v8, Lcom/android/server/pm/PackageSettingBase;->versionCode:I

    iput v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->targetVersionCode:I

    .line 354
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v14, v10}, Lcom/android/server/pm/RuntimeSkinManager;->isValidLP(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)Z

    move-result v15

    iput-boolean v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->valid:Z

    .line 355
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v14, v10}, Lcom/android/server/pm/RuntimeSkinManager;->isVerifiedLP(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)Z

    move-result v15

    iput-boolean v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->verified:Z

    .line 357
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/server/pm/RuntimeSkinManager;->mContext:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v15

    iget-object v0, v10, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    move-object/from16 v17, v0

    iget-object v0, v8, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->publicSourceDir:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v15, v0, v1}, Landroid/content/res/AssetManager;->scanRuntimeSkinResources(Ljava/lang/String;Ljava/lang/String;)[I

    move-result-object v12

    .line 360
    .local v12, "scan":[I
    if-eqz v12, :cond_1

    array-length v15, v12

    if-lez v15, :cond_1

    array-length v15, v12

    rem-int/lit8 v15, v15, 0x2

    if-nez v15, :cond_1

    .line 361
    array-length v15, v12

    div-int/lit8 v13, v15, 0x2

    .line 362
    .local v13, "size":I
    new-array v15, v13, [I

    iput-object v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->resourceIds:[I

    .line 363
    new-array v15, v13, [I

    iput-object v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->targetResourceIds:[I

    .line 364
    const/4 v5, 0x0

    .line 365
    .local v5, "j":I
    const/4 v3, 0x0

    .local v3, "i":I
    move v6, v5

    .end local v5    # "j":I
    .local v6, "j":I
    :goto_1
    array-length v15, v12

    if-ge v3, v15, :cond_0

    .line 366
    iget-object v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->resourceIds:[I

    aget v17, v12, v3

    aput v17, v15, v6

    .line 367
    iget-object v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->targetResourceIds:[I

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "j":I
    .restart local v5    # "j":I
    add-int/lit8 v17, v3, 0x1

    aget v17, v12, v17

    aput v17, v15, v6

    .line 365
    add-int/lit8 v3, v3, 0x2

    move v6, v5

    .end local v5    # "j":I
    .restart local v6    # "j":I
    goto :goto_1

    .line 369
    :cond_0
    iget-object v15, v10, Landroid/content/pm/RuntimeSkinInfo;->assetPath:Ljava/lang/String;

    invoke-virtual {v14, v15}, Lcom/android/server/pm/PackageSetting;->getRuntimeSkinDigest(Ljava/lang/String;)Landroid/content/pm/RuntimeSkinDigest;

    move-result-object v15

    iput-object v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->digest:Landroid/content/pm/RuntimeSkinDigest;

    .line 370
    iget-object v15, v8, Lcom/android/server/pm/PackageSettingBase;->signatures:Lcom/android/server/pm/PackageSignatures;

    if-eqz v15, :cond_1

    .line 371
    iget-object v15, v8, Lcom/android/server/pm/PackageSettingBase;->signatures:Lcom/android/server/pm/PackageSignatures;

    iget-object v15, v15, Lcom/android/server/pm/PackageSignatures;->mSignatures:[Landroid/content/pm/Signature;

    iput-object v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->targetSignatures:[Landroid/content/pm/Signature;

    .line 388
    .end local v3    # "i":I
    .end local v6    # "j":I
    .end local v12    # "scan":[I
    .end local v13    # "size":I
    :cond_1
    :goto_2
    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 347
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .line 375
    :cond_2
    const/4 v15, 0x0

    iput-boolean v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->valid:Z

    .line 376
    iget-boolean v15, v10, Landroid/content/pm/RuntimeSkinInfo;->trusted:Z

    iput-boolean v15, v11, Landroid/content/pm/RuntimeSkinVerificationInfo;->verified:Z

    goto :goto_2

    .line 392
    .end local v2    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .end local v4    # "i$":I
    .end local v7    # "len$":I
    .end local v8    # "ps":Lcom/android/server/pm/PackageSetting;
    .end local v9    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/pm/RuntimeSkinVerificationInfo;>;"
    .end local v10    # "rsi":Landroid/content/pm/RuntimeSkinInfo;
    .end local v11    # "rsvi":Landroid/content/pm/RuntimeSkinVerificationInfo;
    .end local v14    # "skinPs":Lcom/android/server/pm/PackageSetting;
    :catchall_0
    move-exception v15

    monitor-exit v16
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v15

    .line 390
    .restart local v2    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .restart local v4    # "i$":I
    .restart local v7    # "len$":I
    .restart local v9    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/pm/RuntimeSkinVerificationInfo;>;"
    .restart local v14    # "skinPs":Lcom/android/server/pm/PackageSetting;
    :cond_3
    :try_start_1
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v15

    new-array v15, v15, [Landroid/content/pm/RuntimeSkinVerificationInfo;

    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v15

    check-cast v15, [Landroid/content/pm/RuntimeSkinVerificationInfo;

    monitor-exit v16

    .line 393
    .end local v2    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .end local v4    # "i$":I
    .end local v7    # "len$":I
    .end local v9    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/pm/RuntimeSkinVerificationInfo;>;"
    :goto_3
    return-object v15

    .line 392
    :cond_4
    monitor-exit v16
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    const/4 v15, 0x0

    goto :goto_3
.end method

.method public initRuntimeSkin(I)Z
    .locals 12
    .param p1, "userId"    # I

    .prologue
    .line 486
    const/4 v4, 0x0

    .line 490
    .local v4, "result":Z
    invoke-direct {p0}, Lcom/android/server/pm/RuntimeSkinManager;->getDefaultSkinPackage()Ljava/lang/String;

    move-result-object v1

    .line 491
    .local v1, "defaultSkinPackage":Ljava/lang/String;
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    monitor-enter v8

    .line 492
    :try_start_0
    iget-object v9, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    monitor-enter v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 493
    :try_start_1
    invoke-direct {p0, p1}, Lcom/android/server/pm/RuntimeSkinManager;->getUsersForUserId(I)[I

    move-result-object v0

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget v6, v0, v2

    .line 494
    .local v6, "uid":I
    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {p0, v6}, Lcom/android/server/pm/RuntimeSkinManager;->getUpgradedSkinPackageLP(I)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v7, v10

    const/4 v10, 0x1

    aput-object v1, v7, v10

    invoke-direct {p0, v6, v7}, Lcom/android/server/pm/RuntimeSkinManager;->initRuntimeSkinLI(I[Ljava/lang/String;)Z

    move-result v5

    .line 496
    .local v5, "ret":Z
    or-int/2addr v4, v5

    .line 493
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 498
    .end local v5    # "ret":Z
    .end local v6    # "uid":I
    :cond_0
    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 499
    :try_start_2
    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 503
    return v4

    .line 498
    .end local v0    # "arr$":[I
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :catchall_0
    move-exception v7

    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v7

    .line 499
    :catchall_1
    move-exception v7

    monitor-exit v8
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v7
.end method

.method public scanPackageLI(Landroid/content/pm/PackageParser$Package;Lcom/android/server/pm/PackageSetting;IZ)Z
    .locals 12
    .param p1, "pkg"    # Landroid/content/pm/PackageParser$Package;
    .param p2, "pkgSetting"    # Lcom/android/server/pm/PackageSetting;
    .param p3, "scanMode"    # I
    .param p4, "scanFileNewer"    # Z

    .prologue
    .line 520
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v8}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 521
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v8}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 523
    iget-object v8, p1, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    if-nez v8, :cond_0

    .line 525
    const/4 v8, 0x0

    check-cast v8, Ljava/util/HashMap;

    invoke-virtual {p2, v8}, Lcom/android/server/pm/PackageSetting;->setRuntimeSkinDigests(Ljava/util/HashMap;)V

    .line 526
    const/4 v8, 0x0

    invoke-virtual {p2, v8}, Lcom/android/server/pm/PackageSetting;->setRuntimeSkinVerificationState(Ljava/util/HashSet;)V

    .line 527
    const/4 v8, 0x1

    .line 603
    :goto_0
    return v8

    .line 537
    :cond_0
    and-int/lit16 v8, p3, 0x400

    const/16 v9, 0x400

    if-eq v8, v9, :cond_1

    iget-object v8, p1, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v8, v8, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit16 v8, v8, 0x80

    const/16 v9, 0x80

    if-eq v8, v9, :cond_1

    invoke-direct {p0, p1}, Lcom/android/server/pm/RuntimeSkinManager;->isSystemSignedLP(Landroid/content/pm/PackageParser$Package;)Z

    move-result v8

    if-eqz v8, :cond_3

    :cond_1
    const/4 v7, 0x1

    .line 541
    .local v7, "trusted":Z
    :goto_1
    new-instance v1, Ljava/io/File;

    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mApplicationSkinInstallDir:Ljava/io/File;

    iget-object v9, p1, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-direct {v1, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 542
    .local v1, "appSkinDir":Ljava/io/File;
    new-instance v0, Landroid/content/res/AssetManager;

    invoke-direct {v0}, Landroid/content/res/AssetManager;-><init>()V

    .line 544
    .local v0, "am":Landroid/content/res/AssetManager;
    if-eqz p4, :cond_2

    .line 545
    :try_start_0
    invoke-direct {p0, v1}, Lcom/android/server/pm/RuntimeSkinManager;->deleteAllFiles(Ljava/io/File;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 546
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 548
    :try_start_1
    sget-object v8, Llibcore/io/Libcore;->os:Llibcore/io/Os;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    sget v10, Llibcore/io/OsConstants;->S_IRWXU:I

    invoke-interface {v8, v9, v10}, Llibcore/io/Os;->mkdir(Ljava/lang/String;I)V

    .line 551
    sget-object v8, Llibcore/io/Libcore;->os:Llibcore/io/Os;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    sget v10, Llibcore/io/OsConstants;->S_IRWXU:I

    sget v11, Llibcore/io/OsConstants;->S_IRGRP:I

    or-int/2addr v10, v11

    sget v11, Llibcore/io/OsConstants;->S_IXGRP:I

    or-int/2addr v10, v11

    sget v11, Llibcore/io/OsConstants;->S_IROTH:I

    or-int/2addr v10, v11

    sget v11, Llibcore/io/OsConstants;->S_IXOTH:I

    or-int/2addr v10, v11

    invoke-interface {v8, v9, v10}, Llibcore/io/Os;->chmod(Ljava/lang/String;I)V
    :try_end_1
    .catch Llibcore/io/ErrnoException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 558
    :try_start_2
    iget-object v8, p1, Landroid/content/pm/PackageParser$Package;->mScanPath:Ljava/lang/String;

    invoke-virtual {v0, v8}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    .line 565
    :cond_2
    iget-object v2, p1, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    .local v2, "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    array-length v5, v2

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_2
    if-ge v4, v5, :cond_8

    aget-object v6, v2, v4

    .line 566
    .local v6, "rsi":Landroid/content/pm/RuntimeSkinInfo;
    iget-object v8, v6, Landroid/content/pm/RuntimeSkinInfo;->assetPath:Ljava/lang/String;

    if-eqz v8, :cond_7

    iget-object v8, v6, Landroid/content/pm/RuntimeSkinInfo;->targetPackageName:Ljava/lang/String;

    if-eqz v8, :cond_7

    .line 567
    iput-boolean v7, v6, Landroid/content/pm/RuntimeSkinInfo;->trusted:Z

    .line 568
    iget-object v8, v6, Landroid/content/pm/RuntimeSkinInfo;->assetPath:Ljava/lang/String;

    invoke-direct {p0, v1, v8}, Lcom/android/server/pm/RuntimeSkinManager;->getApplicationSkinScanPath(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v6, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    .line 570
    if-eqz p4, :cond_5

    .line 571
    iget-object v8, v6, Landroid/content/pm/RuntimeSkinInfo;->assetPath:Ljava/lang/String;

    iget-object v9, v6, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    invoke-direct {p0, v0, v8, v9}, Lcom/android/server/pm/RuntimeSkinManager;->copyApplicationSkin(Landroid/content/res/AssetManager;Ljava/lang/String;Ljava/lang/String;)Landroid/content/pm/RuntimeSkinDigest;

    move-result-object v8

    iput-object v8, v6, Landroid/content/pm/RuntimeSkinInfo;->digest:Landroid/content/pm/RuntimeSkinDigest;

    .line 572
    iget-object v8, v6, Landroid/content/pm/RuntimeSkinInfo;->digest:Landroid/content/pm/RuntimeSkinDigest;

    if-nez v8, :cond_6

    .line 573
    const-string v8, "RuntimeSkin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Could not copy asset "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v6, Landroid/content/pm/RuntimeSkinInfo;->assetPath:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v6, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 575
    iget-object v8, p1, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-direct {p0, v8}, Lcom/android/server/pm/RuntimeSkinManager;->deleteApplicationSkinFolder(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 576
    const/4 v8, 0x0

    .line 594
    invoke-virtual {v0}, Landroid/content/res/AssetManager;->close()V

    goto/16 :goto_0

    .line 537
    .end local v0    # "am":Landroid/content/res/AssetManager;
    .end local v1    # "appSkinDir":Ljava/io/File;
    .end local v2    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    .end local v6    # "rsi":Landroid/content/pm/RuntimeSkinInfo;
    .end local v7    # "trusted":Z
    :cond_3
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 553
    .restart local v0    # "am":Landroid/content/res/AssetManager;
    .restart local v1    # "appSkinDir":Ljava/io/File;
    .restart local v7    # "trusted":Z
    :catch_0
    move-exception v3

    .line 554
    .local v3, "e":Llibcore/io/ErrnoException;
    :try_start_3
    const-string v8, "RuntimeSkin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Could not create "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v3}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 555
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 556
    const/4 v8, 0x0

    .line 594
    invoke-virtual {v0}, Landroid/content/res/AssetManager;->close()V

    goto/16 :goto_0

    .line 560
    .end local v3    # "e":Llibcore/io/ErrnoException;
    :cond_4
    :try_start_4
    const-string v8, "RuntimeSkin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Could not delete the application skins in "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 561
    const/4 v8, 0x0

    .line 594
    invoke-virtual {v0}, Landroid/content/res/AssetManager;->close()V

    goto/16 :goto_0

    .line 579
    .restart local v2    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .restart local v4    # "i$":I
    .restart local v5    # "len$":I
    .restart local v6    # "rsi":Landroid/content/pm/RuntimeSkinInfo;
    :cond_5
    :try_start_5
    iget-object v8, v6, Landroid/content/pm/RuntimeSkinInfo;->assetPath:Ljava/lang/String;

    invoke-virtual {p2, v8}, Lcom/android/server/pm/PackageSetting;->getRuntimeSkinDigest(Ljava/lang/String;)Landroid/content/pm/RuntimeSkinDigest;

    move-result-object v8

    iput-object v8, v6, Landroid/content/pm/RuntimeSkinInfo;->digest:Landroid/content/pm/RuntimeSkinDigest;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 582
    :try_start_6
    sget-object v8, Llibcore/io/Libcore;->os:Llibcore/io/Os;

    iget-object v9, v6, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    invoke-interface {v8, v9}, Llibcore/io/Os;->stat(Ljava/lang/String;)Llibcore/io/StructStat;
    :try_end_6
    .catch Llibcore/io/ErrnoException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 590
    :cond_6
    :try_start_7
    invoke-direct {p0, p2, v6}, Lcom/android/server/pm/RuntimeSkinManager;->updateIdmapLI(Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)V

    .line 565
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2

    .line 583
    :catch_1
    move-exception v3

    .line 584
    .restart local v3    # "e":Llibcore/io/ErrnoException;
    const-string v8, "RuntimeSkin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Could not stat "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v6, Landroid/content/pm/RuntimeSkinInfo;->scanPath:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " belonging to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p1, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 586
    const/4 v8, 0x0

    .line 594
    invoke-virtual {v0}, Landroid/content/res/AssetManager;->close()V

    goto/16 :goto_0

    .end local v3    # "e":Llibcore/io/ErrnoException;
    .end local v6    # "rsi":Landroid/content/pm/RuntimeSkinInfo;
    :cond_8
    invoke-virtual {v0}, Landroid/content/res/AssetManager;->close()V

    .line 597
    if-eqz p4, :cond_9

    .line 599
    iget-object v8, p1, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    invoke-virtual {p2, v8}, Lcom/android/server/pm/PackageSetting;->setRuntimeSkinDigests([Landroid/content/pm/RuntimeSkinInfo;)V

    .line 601
    const/4 v8, 0x0

    invoke-virtual {p2, v8}, Lcom/android/server/pm/PackageSetting;->setRuntimeSkinVerificationState(Ljava/util/HashSet;)V

    .line 603
    :cond_9
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 594
    .end local v2    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :catchall_0
    move-exception v8

    invoke-virtual {v0}, Landroid/content/res/AssetManager;->close()V

    throw v8
.end method

.method public setRuntimeSkin(ILjava/lang/String;)Z
    .locals 9
    .param p1, "userId"    # I
    .param p2, "packageName"    # Ljava/lang/String;

    .prologue
    .line 621
    const/4 v4, 0x0

    .line 622
    .local v4, "result":Z
    iget-object v7, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    monitor-enter v7

    .line 623
    :try_start_0
    iget-object v8, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    monitor-enter v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 624
    :try_start_1
    invoke-direct {p0, p1}, Lcom/android/server/pm/RuntimeSkinManager;->getUsersForUserId(I)[I

    move-result-object v0

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_2

    aget v5, v0, v1

    .line 626
    .local v5, "uid":I
    if-nez p2, :cond_1

    .line 627
    invoke-direct {p0, p1}, Lcom/android/server/pm/RuntimeSkinManager;->clearRuntimeSkinLP(I)Z

    move-result v3

    .line 633
    .local v3, "res":Z
    :goto_1
    if-eqz v3, :cond_0

    .line 637
    iget-object v6, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v6, v5}, Lcom/android/server/pm/Settings;->writePackageRestrictionsLPr(I)V

    .line 639
    :cond_0
    or-int/2addr v4, v3

    .line 624
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 629
    .end local v3    # "res":Z
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/server/pm/RuntimeSkinManager;->setRuntimeSkinLI(ILjava/lang/String;)Z

    move-result v3

    .restart local v3    # "res":Z
    goto :goto_1

    .line 641
    .end local v3    # "res":Z
    .end local v5    # "uid":I
    :cond_2
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 642
    :try_start_2
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 645
    if-eqz v4, :cond_3

    .line 646
    invoke-direct {p0}, Lcom/android/server/pm/RuntimeSkinManager;->updateRuntimeSkinSequence()V

    .line 652
    :cond_3
    return v4

    .line 641
    .end local v0    # "arr$":[I
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    :catchall_0
    move-exception v6

    :try_start_3
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v6

    .line 642
    :catchall_1
    move-exception v6

    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v6
.end method

.method public setRuntimeSkinVerificationInfo(Ljava/lang/String;[Landroid/content/pm/RuntimeSkinVerificationInfo;)V
    .locals 15
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "verificationInfo"    # [Landroid/content/pm/RuntimeSkinVerificationInfo;

    .prologue
    .line 279
    iget-object v11, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    monitor-enter v11

    .line 280
    :try_start_0
    iget-object v12, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    monitor-enter v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 281
    :try_start_1
    iget-object v10, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v10, v10, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/pm/PackageSetting;

    .line 282
    .local v5, "skinPs":Lcom/android/server/pm/PackageSetting;
    if-eqz v5, :cond_6

    iget-object v10, v5, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    if-eqz v10, :cond_6

    iget-object v10, v5, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    iget-object v10, v10, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    if-eqz v10, :cond_6

    .line 283
    const/4 v9, 0x0

    .line 284
    .local v9, "verifiedRuntimeSkins":Ljava/util/HashSet;, "Ljava/util/HashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    if-eqz p2, :cond_3

    move-object/from16 v0, p2

    array-length v10, v0

    if-lez v10, :cond_3

    .line 285
    move-object/from16 v1, p2

    .local v1, "arr$":[Landroid/content/pm/RuntimeSkinVerificationInfo;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_3

    aget-object v8, v1, v2

    .line 286
    .local v8, "ver":Landroid/content/pm/RuntimeSkinVerificationInfo;
    if-nez v8, :cond_1

    .line 285
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 289
    :cond_1
    invoke-direct {p0, v5, v8}, Lcom/android/server/pm/RuntimeSkinManager;->isVerificationOkLP(Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinVerificationInfo;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 290
    if-nez v9, :cond_2

    .line 291
    new-instance v9, Ljava/util/HashSet;

    .end local v9    # "verifiedRuntimeSkins":Ljava/util/HashSet;, "Ljava/util/HashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 297
    .restart local v9    # "verifiedRuntimeSkins":Ljava/util/HashSet;, "Ljava/util/HashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    :cond_2
    new-instance v10, Landroid/util/Pair;

    iget-object v13, v8, Landroid/content/pm/RuntimeSkinVerificationInfo;->assetPath:Ljava/lang/String;

    iget v14, v8, Landroid/content/pm/RuntimeSkinVerificationInfo;->targetVersionCode:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-direct {v10, v13, v14}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v9, v10}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 326
    .end local v1    # "arr$":[Landroid/content/pm/RuntimeSkinVerificationInfo;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "skinPs":Lcom/android/server/pm/PackageSetting;
    .end local v8    # "ver":Landroid/content/pm/RuntimeSkinVerificationInfo;
    .end local v9    # "verifiedRuntimeSkins":Ljava/util/HashSet;, "Ljava/util/HashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    :catchall_0
    move-exception v10

    monitor-exit v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v10

    .line 327
    :catchall_1
    move-exception v10

    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v10

    .line 302
    .restart local v5    # "skinPs":Lcom/android/server/pm/PackageSetting;
    .restart local v9    # "verifiedRuntimeSkins":Ljava/util/HashSet;, "Ljava/util/HashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    :cond_3
    :try_start_3
    invoke-virtual {v5, v9}, Lcom/android/server/pm/PackageSetting;->setRuntimeSkinVerificationState(Ljava/util/HashSet;)V

    .line 303
    iget-object v10, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v10}, Lcom/android/server/pm/Settings;->writeLPr()V

    .line 306
    const/4 v6, 0x0

    .line 307
    .local v6, "updateSequence":Z
    sget-object v10, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v10}, Lcom/android/server/pm/UserManagerService;->getUserIds()[I

    move-result-object v1

    .local v1, "arr$":[I
    array-length v3, v1

    .restart local v3    # "len$":I
    const/4 v2, 0x0

    .restart local v2    # "i$":I
    :goto_2
    if-ge v2, v3, :cond_5

    aget v7, v1, v2

    .line 308
    .local v7, "userId":I
    invoke-direct {p0, v7}, Lcom/android/server/pm/RuntimeSkinManager;->getRuntimeSkinLP(I)Landroid/content/pm/PackageParser$Package;

    move-result-object v4

    .line 309
    .local v4, "skinPkg":Landroid/content/pm/PackageParser$Package;
    if-eqz v4, :cond_4

    iget-object v10, v4, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 314
    const/4 v6, 0x1

    .line 317
    move-object/from16 v0, p1

    invoke-direct {p0, v7, v0}, Lcom/android/server/pm/RuntimeSkinManager;->setRuntimeSkinLI(ILjava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 318
    iget-object v10, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v10, v7}, Lcom/android/server/pm/Settings;->writePackageRestrictionsLPr(I)V

    .line 307
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 322
    .end local v4    # "skinPkg":Landroid/content/pm/PackageParser$Package;
    .end local v7    # "userId":I
    :cond_5
    if-eqz v6, :cond_6

    .line 323
    invoke-direct {p0}, Lcom/android/server/pm/RuntimeSkinManager;->updateRuntimeSkinSequence()V

    .line 326
    .end local v1    # "arr$":[I
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v6    # "updateSequence":Z
    .end local v9    # "verifiedRuntimeSkins":Ljava/util/HashSet;, "Ljava/util/HashSet<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    :cond_6
    monitor-exit v12
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 327
    :try_start_4
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 328
    return-void
.end method

.method public updateRuntimeSkinPackageInfo(Landroid/content/pm/PackageInfo;Lcom/android/server/pm/PackageSetting;)Landroid/content/pm/PackageInfo;
    .locals 8
    .param p1, "pi"    # Landroid/content/pm/PackageInfo;
    .param p2, "ps"    # Lcom/android/server/pm/PackageSetting;

    .prologue
    const/4 v7, 0x1

    .line 404
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    iget-object v5, p2, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    iget-object v5, v5, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    if-eqz v5, :cond_0

    .line 405
    const/4 v5, 0x0

    iput-boolean v5, p1, Landroid/content/pm/PackageInfo;->isVerifiedSkin:Z

    .line 408
    iget-object v5, p2, Lcom/android/server/pm/PackageSetting;->pkg:Landroid/content/pm/PackageParser$Package;

    iget-object v1, v5, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    .local v1, "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v1, v2

    .line 409
    .local v4, "rsi":Landroid/content/pm/RuntimeSkinInfo;
    iget-boolean v5, v4, Landroid/content/pm/RuntimeSkinInfo;->trusted:Z

    if-eqz v5, :cond_1

    .line 410
    iput-boolean v7, p1, Landroid/content/pm/PackageInfo;->isVerifiedSkin:Z

    .line 425
    .end local v1    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "rsi":Landroid/content/pm/RuntimeSkinInfo;
    :cond_0
    :goto_1
    return-object p1

    .line 412
    .restart local v1    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v4    # "rsi":Landroid/content/pm/RuntimeSkinInfo;
    :cond_1
    iget-object v5, p2, Lcom/android/server/pm/PackageSettingBase;->verifiedRuntimeSkins:Ljava/util/HashSet;

    if-eqz v5, :cond_2

    .line 413
    iget-object v5, p0, Lcom/android/server/pm/RuntimeSkinManager;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v5, v5, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    iget-object v6, v4, Landroid/content/pm/RuntimeSkinInfo;->targetPackageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/pm/PackageSetting;

    .line 414
    .local v0, "appPs":Lcom/android/server/pm/PackageSetting;
    if-eqz v0, :cond_2

    invoke-direct {p0, v0, p2, v4}, Lcom/android/server/pm/RuntimeSkinManager;->isValidLP(Lcom/android/server/pm/PackageSetting;Lcom/android/server/pm/PackageSetting;Landroid/content/pm/RuntimeSkinInfo;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 419
    iput-boolean v7, p1, Landroid/content/pm/PackageInfo;->isVerifiedSkin:Z

    goto :goto_1

    .line 408
    .end local v0    # "appPs":Lcom/android/server/pm/PackageSetting;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public updateSettingsLI(Lcom/android/server/pm/PackageManagerService$PackageInstalledInfo;)Z
    .locals 14
    .param p1, "res"    # Lcom/android/server/pm/PackageManagerService$PackageInstalledInfo;

    .prologue
    .line 669
    iget-object v12, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v12}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 670
    iget-object v12, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v12}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 672
    const/4 v9, 0x0

    .line 673
    .local v9, "updateSettings":Z
    iget-object v12, p1, Lcom/android/server/pm/PackageManagerService$PackageInstalledInfo;->removedInfo:Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;

    if-eqz v12, :cond_0

    .line 674
    iget-object v12, p1, Lcom/android/server/pm/PackageManagerService$PackageInstalledInfo;->removedInfo:Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;

    invoke-virtual {p0, v12}, Lcom/android/server/pm/RuntimeSkinManager;->updateSettingsLI(Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;)Z

    move-result v9

    .line 678
    :cond_0
    iget-object v12, p1, Lcom/android/server/pm/PackageManagerService$PackageInstalledInfo;->newUsers:[I

    if-nez v12, :cond_2

    const/4 v12, -0x1

    invoke-direct {p0, v12}, Lcom/android/server/pm/RuntimeSkinManager;->getUsersForUserId(I)[I

    move-result-object v11

    .line 680
    .local v11, "users":[I
    :goto_0
    move-object v0, v11

    .local v0, "arr$":[I
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    move v3, v2

    .end local v0    # "arr$":[I
    .end local v2    # "i$":I
    .end local v4    # "len$":I
    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_4

    aget v10, v0, v3

    .line 681
    .local v10, "userId":I
    invoke-direct {p0, v10}, Lcom/android/server/pm/RuntimeSkinManager;->getRuntimeSkinLP(I)Landroid/content/pm/PackageParser$Package;

    move-result-object v8

    .line 682
    .local v8, "skinPkg":Landroid/content/pm/PackageParser$Package;
    if-eqz v8, :cond_3

    .line 683
    iget-object v1, v8, Landroid/content/pm/PackageParser$Package;->mRuntimeSkins:[Landroid/content/pm/RuntimeSkinInfo;

    .local v1, "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v2, 0x0

    .end local v3    # "i$":I
    .restart local v2    # "i$":I
    :goto_2
    if-ge v2, v5, :cond_3

    aget-object v7, v1, v2

    .line 684
    .local v7, "rsi":Landroid/content/pm/RuntimeSkinInfo;
    iget-object v12, p1, Lcom/android/server/pm/PackageManagerService$PackageInstalledInfo;->name:Ljava/lang/String;

    iget-object v13, v7, Landroid/content/pm/RuntimeSkinInfo;->targetPackageName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 685
    iget-object v12, v8, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-direct {p0, v10, v12, v7}, Lcom/android/server/pm/RuntimeSkinManager;->setRuntimeSkinLI(ILjava/lang/String;Landroid/content/pm/RuntimeSkinInfo;)Z

    move-result v6

    .line 686
    .local v6, "ret":Z
    or-int/2addr v9, v6

    .line 683
    .end local v6    # "ret":Z
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 678
    .end local v1    # "arr$":[Landroid/content/pm/RuntimeSkinInfo;
    .end local v2    # "i$":I
    .end local v5    # "len$":I
    .end local v7    # "rsi":Landroid/content/pm/RuntimeSkinInfo;
    .end local v8    # "skinPkg":Landroid/content/pm/PackageParser$Package;
    .end local v10    # "userId":I
    .end local v11    # "users":[I
    :cond_2
    iget-object v11, p1, Lcom/android/server/pm/PackageManagerService$PackageInstalledInfo;->newUsers:[I

    goto :goto_0

    .line 680
    .restart local v8    # "skinPkg":Landroid/content/pm/PackageParser$Package;
    .restart local v10    # "userId":I
    .restart local v11    # "users":[I
    :cond_3
    add-int/lit8 v2, v3, 0x1

    .restart local v2    # "i$":I
    move v3, v2

    .end local v2    # "i$":I
    .restart local v3    # "i$":I
    goto :goto_1

    .line 691
    .end local v8    # "skinPkg":Landroid/content/pm/PackageParser$Package;
    .end local v10    # "userId":I
    :cond_4
    if-eqz v9, :cond_5

    .line 692
    invoke-direct {p0}, Lcom/android/server/pm/RuntimeSkinManager;->updateRuntimeSkinSequence()V

    .line 695
    :cond_5
    return v9
.end method

.method public updateSettingsLI(Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;)Z
    .locals 9
    .param p1, "res"    # Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;

    .prologue
    .line 709
    iget-object v6, p0, Lcom/android/server/pm/RuntimeSkinManager;->mPackages:Ljava/util/HashMap;

    invoke-direct {p0, v6}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 710
    iget-object v6, p0, Lcom/android/server/pm/RuntimeSkinManager;->mInstallLock:Ljava/lang/Object;

    invoke-direct {p0, v6}, Lcom/android/server/pm/RuntimeSkinManager;->assertLock(Ljava/lang/Object;)V

    .line 712
    const/4 v4, 0x0

    .line 713
    .local v4, "updateSettings":Z
    iget-object v6, p1, Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;->skinForUsers:[I

    if-eqz v6, :cond_0

    .line 719
    iget-object v0, p1, Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;->skinForUsers:[I

    .local v0, "arr$":[I
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget v5, v0, v1

    .line 720
    .local v5, "userId":I
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    iget-object v8, p1, Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;->removedPackage:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-direct {p0, v5}, Lcom/android/server/pm/RuntimeSkinManager;->getUpgradedSkinPackageLP(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-direct {p0}, Lcom/android/server/pm/RuntimeSkinManager;->getDefaultSkinPackage()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-direct {p0, v5, v6}, Lcom/android/server/pm/RuntimeSkinManager;->initRuntimeSkinLI(I[Ljava/lang/String;)Z

    move-result v3

    .line 722
    .local v3, "ret":Z
    or-int/2addr v4, v3

    .line 719
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 726
    .end local v0    # "arr$":[I
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "ret":Z
    .end local v5    # "userId":I
    :cond_0
    iget-object v6, p1, Lcom/android/server/pm/PackageManagerService$PackageRemovedInfo;->skinForUsers:[I

    if-eqz v6, :cond_1

    .line 727
    invoke-direct {p0}, Lcom/android/server/pm/RuntimeSkinManager;->updateRuntimeSkinSequence()V

    .line 730
    :cond_1
    return v4
.end method
