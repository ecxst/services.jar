.class final Lcom/android/server/pm/PackageManagerService$AppDirObserver;
.super Landroid/os/FileObserver;
.source "PackageManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/pm/PackageManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AppDirObserver"
.end annotation


# instance fields
.field private final mExtraScanFlags:I

.field private final mIsRom:Z

.field private final mRootDir:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/server/pm/PackageManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;IZ)V
    .locals 6
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "mask"    # I
    .param p4, "isrom"    # Z

    .prologue
    .line 6158
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/server/pm/PackageManagerService$AppDirObserver;-><init>(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;IZI)V

    .line 6159
    return-void
.end method

.method public constructor <init>(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;IZI)V
    .locals 0
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "mask"    # I
    .param p4, "isrom"    # Z
    .param p5, "extraScanFlags"    # I

    .prologue
    .line 6161
    iput-object p1, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    .line 6162
    invoke-direct {p0, p2, p3}, Landroid/os/FileObserver;-><init>(Ljava/lang/String;I)V

    .line 6163
    iput-object p2, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mRootDir:Ljava/lang/String;

    .line 6164
    iput-boolean p4, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mIsRom:Z

    .line 6165
    iput p5, p0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mExtraScanFlags:I

    .line 6166
    return-void
.end method


# virtual methods
.method public onEvent(ILjava/lang/String;)V
    .locals 23
    .param p1, "event"    # I
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 6169
    const/16 v22, 0x0

    .line 6170
    .local v22, "removedPackage":Ljava/lang/String;
    const/16 v21, -0x1

    .line 6171
    .local v21, "removedAppId":I
    const/4 v9, 0x0

    .line 6172
    .local v9, "removedUsers":[I
    const/4 v11, 0x0

    .line 6173
    .local v11, "addedPackage":Ljava/lang/String;
    const/16 v16, -0x1

    .line 6174
    .local v16, "addedAppId":I
    const/4 v15, 0x0

    .line 6177
    .local v15, "addedUsers":[I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v10, v2, Lcom/android/server/pm/PackageManagerService;->mInstallLock:Ljava/lang/Object;

    monitor-enter v10

    .line 6178
    const/16 v18, 0x0

    .line 6179
    .local v18, "fullPathStr":Ljava/lang/String;
    const/4 v3, 0x0

    .line 6180
    .local v3, "fullPath":Ljava/io/File;
    if-eqz p2, :cond_0

    .line 6181
    :try_start_0
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mRootDir:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-direct {v0, v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6182
    .end local v3    # "fullPath":Ljava/io/File;
    .local v17, "fullPath":Ljava/io/File;
    :try_start_1
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->getPath()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    move-result-object v18

    move-object/from16 v3, v17

    .line 6188
    .end local v17    # "fullPath":Ljava/io/File;
    .restart local v3    # "fullPath":Ljava/io/File;
    :cond_0
    :try_start_2
    # invokes: Lcom/android/server/pm/PackageManagerService;->isPackageFilename(Ljava/lang/String;)Z
    invoke-static/range {p2 .. p2}, Lcom/android/server/pm/PackageManagerService;->access$1400(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 6191
    monitor-exit v10

    .line 6269
    :cond_1
    :goto_0
    return-void

    .line 6196
    :cond_2
    # invokes: Lcom/android/server/pm/PackageManagerService;->ignoreCodePath(Ljava/lang/String;)Z
    invoke-static/range {v18 .. v18}, Lcom/android/server/pm/PackageManagerService;->access$1500(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 6197
    monitor-exit v10

    goto :goto_0

    .line 6254
    :catchall_0
    move-exception v2

    :goto_1
    monitor-exit v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 6199
    :cond_3
    const/16 v19, 0x0

    .line 6200
    .local v19, "p":Landroid/content/pm/PackageParser$Package;
    const/16 v20, 0x0

    .line 6202
    .local v20, "ps":Lcom/android/server/pm/PackageSetting;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v4, v2, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 6203
    :try_start_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v2, v2, Lcom/android/server/pm/PackageManagerService;->mAppDirs:Ljava/util/HashMap;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Landroid/content/pm/PackageParser$Package;

    move-object/from16 v19, v0

    .line 6204
    if-eqz v19, :cond_4

    .line 6205
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v2, v2, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    iget-object v2, v2, Lcom/android/server/pm/Settings;->mPackages:Ljava/util/HashMap;

    move-object/from16 v0, v19

    iget-object v5, v0, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/android/server/pm/PackageSetting;

    move-object/from16 v20, v0

    .line 6206
    if-eqz v20, :cond_8

    .line 6207
    sget-object v2, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v2}, Lcom/android/server/pm/UserManagerService;->getUserIds()[I

    move-result-object v2

    const/4 v5, 0x1

    move-object/from16 v0, v20

    invoke-virtual {v0, v2, v5}, Lcom/android/server/pm/PackageSetting;->queryInstalledUsers([IZ)[I

    move-result-object v9

    .line 6212
    :cond_4
    :goto_2
    sget-object v2, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v2}, Lcom/android/server/pm/UserManagerService;->getUserIds()[I

    move-result-object v15

    .line 6213
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 6214
    move/from16 v0, p1

    and-int/lit16 v2, v0, 0x248

    if-eqz v2, :cond_5

    .line 6215
    if-eqz v20, :cond_5

    .line 6217
    :try_start_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    const/4 v4, 0x1

    move-object/from16 v0, v20

    invoke-virtual {v2, v0, v4}, Lcom/android/server/pm/PackageManagerService;->removePackageLI(Lcom/android/server/pm/PackageSetting;Z)V

    .line 6218
    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/android/server/pm/PackageSettingBase;->name:Ljava/lang/String;

    move-object/from16 v22, v0

    .line 6219
    move-object/from16 v0, v20

    iget v0, v0, Lcom/android/server/pm/PackageSetting;->appId:I

    move/from16 v21, v0

    .line 6223
    :cond_5
    move/from16 v0, p1

    and-int/lit16 v2, v0, 0x88

    if-eqz v2, :cond_6

    .line 6224
    if-nez v19, :cond_6

    .line 6226
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mIsRom:Z

    if-eqz v4, :cond_9

    const/16 v4, 0x41

    :goto_3
    or-int/lit8 v4, v4, 0x2

    or-int/lit8 v4, v4, 0x4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->mExtraScanFlags:I

    or-int/lit8 v5, v5, 0x61

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sget-object v8, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    # invokes: Lcom/android/server/pm/PackageManagerService;->scanPackageLI(Ljava/io/File;IIJLandroid/os/UserHandle;)Landroid/content/pm/PackageParser$Package;
    invoke-static/range {v2 .. v8}, Lcom/android/server/pm/PackageManagerService;->access$1600(Lcom/android/server/pm/PackageManagerService;Ljava/io/File;IIJLandroid/os/UserHandle;)Landroid/content/pm/PackageParser$Package;

    move-result-object v19

    .line 6233
    if-eqz v19, :cond_6

    .line 6240
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v4, v2, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 6241
    :try_start_6
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    move-object/from16 v0, v19

    iget-object v7, v0, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    move-object/from16 v0, v19

    iget-object v2, v0, Landroid/content/pm/PackageParser$Package;->permissions:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_a

    const/4 v2, 0x1

    :goto_4
    move-object/from16 v0, v19

    # invokes: Lcom/android/server/pm/PackageManagerService;->updatePermissionsLPw(Ljava/lang/String;Landroid/content/pm/PackageParser$Package;I)V
    invoke-static {v5, v7, v0, v2}, Lcom/android/server/pm/PackageManagerService;->access$1700(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;Landroid/content/pm/PackageParser$Package;I)V

    .line 6243
    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 6244
    :try_start_7
    move-object/from16 v0, v19

    iget-object v2, v0, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v11, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 6245
    move-object/from16 v0, v19

    iget-object v2, v0, Landroid/content/pm/PackageParser$Package;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v2}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v16

    .line 6251
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v4, v2, Lcom/android/server/pm/PackageManagerService;->mPackages:Ljava/util/HashMap;

    monitor-enter v4
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 6252
    :try_start_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/server/pm/PackageManagerService$AppDirObserver;->this$0:Lcom/android/server/pm/PackageManagerService;

    iget-object v2, v2, Lcom/android/server/pm/PackageManagerService;->mSettings:Lcom/android/server/pm/Settings;

    invoke-virtual {v2}, Lcom/android/server/pm/Settings;->writeLPr()V

    .line 6253
    monitor-exit v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 6254
    :try_start_9
    monitor-exit v10
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 6256
    if-eqz v22, :cond_7

    .line 6257
    new-instance v6, Landroid/os/Bundle;

    const/4 v2, 0x1

    invoke-direct {v6, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 6258
    .local v6, "extras":Landroid/os/Bundle;
    const-string v2, "android.intent.extra.UID"

    move/from16 v0, v21

    invoke-virtual {v6, v2, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 6259
    const-string v2, "android.intent.extra.DATA_REMOVED"

    const/4 v4, 0x0

    invoke-virtual {v6, v2, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 6260
    const-string v4, "android.intent.action.PACKAGE_REMOVED"

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v5, v22

    invoke-static/range {v4 .. v9}, Lcom/android/server/pm/PackageManagerService;->sendPackageBroadcast(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/IIntentReceiver;[I)V

    .line 6263
    .end local v6    # "extras":Landroid/os/Bundle;
    :cond_7
    if-eqz v11, :cond_1

    .line 6264
    new-instance v6, Landroid/os/Bundle;

    const/4 v2, 0x1

    invoke-direct {v6, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 6265
    .restart local v6    # "extras":Landroid/os/Bundle;
    const-string v2, "android.intent.extra.UID"

    move/from16 v0, v16

    invoke-virtual {v6, v2, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 6266
    const-string v10, "android.intent.action.PACKAGE_ADDED"

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object v12, v6

    invoke-static/range {v10 .. v15}, Lcom/android/server/pm/PackageManagerService;->sendPackageBroadcast(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/IIntentReceiver;[I)V

    goto/16 :goto_0

    .line 6209
    .end local v6    # "extras":Landroid/os/Bundle;
    :cond_8
    :try_start_a
    sget-object v2, Lcom/android/server/pm/PackageManagerService;->sUserManager:Lcom/android/server/pm/UserManagerService;

    invoke-virtual {v2}, Lcom/android/server/pm/UserManagerService;->getUserIds()[I

    move-result-object v9

    goto/16 :goto_2

    .line 6213
    :catchall_1
    move-exception v2

    monitor-exit v4
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :try_start_b
    throw v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 6226
    :cond_9
    const/4 v4, 0x0

    goto/16 :goto_3

    .line 6241
    :cond_a
    const/4 v2, 0x0

    goto :goto_4

    .line 6243
    :catchall_2
    move-exception v2

    :try_start_c
    monitor-exit v4
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    :try_start_d
    throw v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 6253
    :catchall_3
    move-exception v2

    :try_start_e
    monitor-exit v4
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    :try_start_f
    throw v2
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    .line 6254
    .end local v3    # "fullPath":Ljava/io/File;
    .end local v19    # "p":Landroid/content/pm/PackageParser$Package;
    .end local v20    # "ps":Lcom/android/server/pm/PackageSetting;
    .restart local v17    # "fullPath":Ljava/io/File;
    :catchall_4
    move-exception v2

    move-object/from16 v3, v17

    .end local v17    # "fullPath":Ljava/io/File;
    .restart local v3    # "fullPath":Ljava/io/File;
    goto/16 :goto_1
.end method
