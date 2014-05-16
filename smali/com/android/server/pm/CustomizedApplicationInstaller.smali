.class public Lcom/android/server/pm/CustomizedApplicationInstaller;
.super Ljava/lang/Object;
.source "CustomizedApplicationInstaller.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;,
        Lcom/android/server/pm/CustomizedApplicationInstaller$PackageSettings;,
        Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;
    }
.end annotation


# static fields
.field private static final APPLICATION_INSTALL_DIR:Ljava/io/File;

.field private static final APPLICATION_INSTALL_DIR_NAME:Ljava/lang/String;

.field private static final APPLICATION_SETTINGS_FILE:Ljava/lang/String;

.field public static final CDF_CONFIGURED_APPLICATIONS:Ljava/lang/String;

.field public static final DEBUG:Z = false

.field private static final INSTALL_PACKAGE_SUFFIX:Ljava/lang/String; = "-"

.field private static final PRODUCT_CONFIGURED_APPLICATIONS:Ljava/lang/String;

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mNewApplications:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSettings:Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/etc/customization/applications/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/CustomizedApplicationInstaller;->CDF_CONFIGURED_APPLICATIONS:Ljava/lang/String;

    .line 76
    const-class v0, Lcom/android/server/pm/CustomizedApplicationInstaller;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/etc/product/applications"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/CustomizedApplicationInstaller;->PRODUCT_CONFIGURED_APPLICATIONS:Ljava/lang/String;

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/system/application-packages.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/CustomizedApplicationInstaller;->APPLICATION_SETTINGS_FILE:Ljava/lang/String;

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/app/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/pm/CustomizedApplicationInstaller;->APPLICATION_INSTALL_DIR_NAME:Ljava/lang/String;

    .line 91
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/android/server/pm/CustomizedApplicationInstaller;->APPLICATION_INSTALL_DIR_NAME:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/pm/CustomizedApplicationInstaller;->APPLICATION_INSTALL_DIR:Ljava/io/File;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 103
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 101
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mNewApplications:Ljava/util/List;

    .line 104
    iput-object p1, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mContext:Landroid/content/Context;

    .line 105
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lcom/android/server/pm/CustomizedApplicationInstaller;->APPLICATION_SETTINGS_FILE:Ljava/lang/String;

    return-object v0
.end method

.method private addFile(Ljava/util/ArrayList;Ljava/io/File;)V
    .locals 1
    .param p2, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .prologue
    .line 359
    .local p1, "applicationList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->canRead()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 360
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 365
    :cond_0
    return-void
.end method

.method private copyApk(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)Z
    .locals 11
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "oldPath"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 183
    const/4 v3, 0x0

    .line 188
    .local v3, "dstFile":Ljava/io/File;
    :try_start_0
    sget-object v7, Lcom/android/server/pm/CustomizedApplicationInstaller;->APPLICATION_INSTALL_DIR:Ljava/io/File;

    invoke-direct {p0, v7}, Lcom/android/server/pm/CustomizedApplicationInstaller;->createTempPackageFile(Ljava/io/File;)Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v3

    .line 195
    const/4 v5, 0x0

    .line 197
    .local v5, "out":Landroid/os/ParcelFileDescriptor;
    const/high16 v7, 0x30000000

    :try_start_1
    invoke-static {v3, v7}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v5

    .line 199
    new-instance v2, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;

    invoke-direct {v2, v5}, Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    .line 201
    .local v2, "autoOut":Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;
    invoke-static {p2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v7

    invoke-direct {p0, v7, v2}, Lcom/android/server/pm/CustomizedApplicationInstaller;->copyFile(Landroid/net/Uri;Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 210
    if-eqz v5, :cond_0

    .line 211
    :try_start_2
    invoke-virtual {v5}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_7
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 219
    :cond_0
    :goto_0
    :try_start_3
    invoke-virtual {v3}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x1a4

    const/4 v9, -0x1

    const/4 v10, -0x1

    invoke-static {v7, v8, v9, v10}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 228
    :try_start_4
    const-string v7, ".apk"

    invoke-static {p3, p1, v7}, Lcom/android/server/pm/CustomizedApplicationInstaller;->getNextCodePath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 232
    .local v1, "apkName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    sget-object v7, Lcom/android/server/pm/CustomizedApplicationInstaller;->APPLICATION_INSTALL_DIR:Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ".apk"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 233
    .local v0, "apkFile":Ljava/io/File;
    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result v7

    if-eqz v7, :cond_7

    .line 235
    const/4 v3, 0x0

    .line 243
    if-eqz v3, :cond_1

    .line 244
    throw v3

    .line 248
    :cond_1
    const/4 v6, 0x1

    .end local v0    # "apkFile":Ljava/io/File;
    .end local v1    # "apkName":Ljava/lang/String;
    .end local v2    # "autoOut":Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;
    .end local v5    # "out":Landroid/os/ParcelFileDescriptor;
    :cond_2
    :goto_1
    return v6

    .line 189
    :catch_0
    move-exception v4

    .line 190
    .local v4, "e":Ljava/io/IOException;
    :try_start_5
    sget-object v7, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to create temp file. "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 243
    if-eqz v3, :cond_2

    .line 244
    .end local v4    # "e":Ljava/io/IOException;
    :goto_2
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 202
    .restart local v5    # "out":Landroid/os/ParcelFileDescriptor;
    :catch_1
    move-exception v4

    .line 203
    .local v4, "e":Ljava/io/FileNotFoundException;
    :try_start_6
    sget-object v7, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to copy file: source file not found. "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 210
    if-eqz v5, :cond_3

    .line 211
    :try_start_7
    invoke-virtual {v5}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 243
    :cond_3
    :goto_3
    if-eqz v3, :cond_2

    goto :goto_2

    .line 205
    .end local v4    # "e":Ljava/io/FileNotFoundException;
    :catch_2
    move-exception v4

    .line 206
    .local v4, "e":Ljava/io/IOException;
    :try_start_8
    sget-object v7, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to copy file: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 210
    if-eqz v5, :cond_4

    .line 211
    :try_start_9
    invoke-virtual {v5}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 243
    :cond_4
    :goto_4
    if-eqz v3, :cond_2

    goto :goto_2

    .line 209
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    .line 210
    if-eqz v5, :cond_5

    .line 211
    :try_start_a
    invoke-virtual {v5}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 209
    :cond_5
    :goto_5
    :try_start_b
    throw v6
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 243
    .end local v5    # "out":Landroid/os/ParcelFileDescriptor;
    :catchall_1
    move-exception v6

    if-eqz v3, :cond_6

    .line 244
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 243
    :cond_6
    throw v6

    .line 222
    .restart local v2    # "autoOut":Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;
    .restart local v5    # "out":Landroid/os/ParcelFileDescriptor;
    :catch_3
    move-exception v4

    .line 223
    .restart local v4    # "e":Ljava/io/IOException;
    :try_start_c
    sget-object v7, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to set permissions for apk."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    if-eqz v3, :cond_2

    goto :goto_2

    .line 237
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v0    # "apkFile":Ljava/io/File;
    .restart local v1    # "apkName":Ljava/lang/String;
    :cond_7
    sget-object v7, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to rename apk. "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    .line 243
    if-eqz v3, :cond_2

    goto/16 :goto_2

    .line 213
    .end local v0    # "apkFile":Ljava/io/File;
    .end local v1    # "apkName":Ljava/lang/String;
    .end local v2    # "autoOut":Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;
    :catch_4
    move-exception v7

    goto :goto_5

    .local v4, "e":Ljava/io/FileNotFoundException;
    :catch_5
    move-exception v7

    goto :goto_3

    .local v4, "e":Ljava/io/IOException;
    :catch_6
    move-exception v7

    goto :goto_4

    .end local v4    # "e":Ljava/io/IOException;
    .restart local v2    # "autoOut":Landroid/os/ParcelFileDescriptor$AutoCloseOutputStream;
    :catch_7
    move-exception v7

    goto/16 :goto_0
.end method

.method private copyFile(Landroid/net/Uri;Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "pPackageURI"    # Landroid/net/Uri;
    .param p2, "outStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 501
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 502
    .local v0, "scheme":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string v2, "file"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 503
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 508
    .local v1, "srcPackageFile":Ljava/io/File;
    invoke-static {v1, p2}, Lcom/android/server/pm/CustomizedApplicationInstaller;->copyToFile(Ljava/io/File;Ljava/io/OutputStream;)V

    .line 510
    .end local v1    # "srcPackageFile":Ljava/io/File;
    :cond_1
    return-void
.end method

.method private static copyToFile(Ljava/io/File;Ljava/io/OutputStream;)V
    .locals 3
    .param p0, "srcFile"    # Ljava/io/File;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 522
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 524
    .local v0, "inputStream":Ljava/io/InputStream;
    :try_start_0
    invoke-static {v0, p1}, Lcom/android/server/pm/CustomizedApplicationInstaller;->copyToFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 527
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 531
    :goto_0
    return-void

    .line 526
    :catchall_0
    move-exception v1

    .line 527
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 526
    :goto_1
    throw v1

    .line 528
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private static copyToFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 513
    const/16 v2, 0x4000

    new-array v0, v2, [B

    .line 515
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "bytesRead":I
    if-ltz v1, :cond_0

    .line 516
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 518
    :cond_0
    return-void
.end method

.method private createTempPackageFile(Ljava/io/File;)Ljava/io/File;
    .locals 6
    .param p1, "installDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    const/4 v1, 0x0

    .line 274
    .local v1, "tmpPackageFile":Ljava/io/File;
    :try_start_0
    const-string v2, "vmdl"

    const-string v3, ".tmp"

    invoke-static {v2, v3, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 280
    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x180

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-static {v2, v3, v4, v5}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 286
    return-object v1

    .line 275
    :catch_0
    move-exception v0

    .line 276
    .local v0, "e":Ljava/io/IOException;
    sget-object v2, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    const-string v3, "Couldn\'t create temp file for downloaded package file."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    throw v0

    .line 282
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 283
    .restart local v0    # "e":Ljava/io/IOException;
    sget-object v2, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    const-string v3, "Trouble getting the canoncical path for a temp file."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    throw v0
.end method

.method private debugListFiles(Ljava/lang/String;Ljava/io/File;)V
    .locals 8
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "dir"    # Ljava/io/File;

    .prologue
    .line 252
    invoke-virtual {p2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 253
    .local v1, "files":[Ljava/lang/String;
    if-nez v1, :cond_1

    .line 254
    sget-object v5, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " not found"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    :cond_0
    return-void

    .line 258
    :cond_1
    sget-object v5, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    move-object v0, v1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 260
    .local v4, "s":Ljava/lang/String;
    sget-object v5, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private getBlacklist()Ljava/util/Set;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 339
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 341
    .local v4, "pkglist":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x1070035

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .local v1, "arr$":[Ljava/lang/String;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, v1, v2

    .line 346
    .local v0, "app":Ljava/lang/String;
    invoke-interface {v4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 341
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 349
    .end local v0    # "app":Ljava/lang/String;
    :cond_0
    return-object v4
.end method

.method private getCurrentSwVersion()Ljava/lang/String;
    .locals 5

    .prologue
    .line 450
    const-string v4, "ro.semc.version.sw_revision"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 451
    .local v3, "swVersion":Ljava/lang/String;
    const-string v4, "ro.semc.version.cust"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 452
    .local v1, "cdf":Ljava/lang/String;
    const-string v4, "ro.semc.version.cust_revision"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 453
    .local v2, "cdfVersion":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 454
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    const-string v4, ":"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 456
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 457
    const-string v4, ":"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 458
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 463
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private getCustomizedApplicationsToInstall()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 297
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 298
    .local v0, "applicationList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    iget-object v4, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x1070036

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 304
    .local v1, "custAppList":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_0

    .line 305
    new-instance v2, Ljava/io/File;

    sget-object v4, Lcom/android/server/pm/CustomizedApplicationInstaller;->CDF_CONFIGURED_APPLICATIONS:Ljava/lang/String;

    aget-object v5, v1, v3

    invoke-direct {v2, v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    .local v2, "file":Ljava/io/File;
    invoke-direct {p0, v0, v2}, Lcom/android/server/pm/CustomizedApplicationInstaller;->addFile(Ljava/util/ArrayList;Ljava/io/File;)V

    .line 304
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 308
    .end local v2    # "file":Ljava/io/File;
    :cond_0
    return-object v0
.end method

.method private static getNextCodePath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "oldCodePath"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "suffix"    # Ljava/lang/String;

    .prologue
    .line 469
    const-string v1, ""

    .line 470
    .local v1, "idxStr":Ljava/lang/String;
    const/4 v0, 0x1

    .line 473
    .local v0, "idx":I
    if-eqz p0, :cond_2

    .line 474
    move-object v3, p0

    .line 476
    .local v3, "subStr":Ljava/lang/String;
    invoke-virtual {v3, p2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 477
    const/4 v4, 0x0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 481
    :cond_0
    invoke-virtual {v3, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    .line 482
    .local v2, "sidx":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_2

    .line 483
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v4, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 484
    if-eqz v3, :cond_2

    .line 485
    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 486
    const-string v4, "-"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 489
    :cond_1
    :try_start_0
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 495
    .end local v2    # "sidx":I
    .end local v3    # "subStr":Ljava/lang/String;
    :cond_2
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 496
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 490
    .restart local v2    # "sidx":I
    .restart local v3    # "subStr":Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private getPackageInfo(Landroid/net/Uri;)Landroid/content/pm/PackageParser$Package;
    .locals 5
    .param p1, "packageUri"    # Landroid/net/Uri;

    .prologue
    .line 424
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 425
    .local v0, "archiveFilePath":Ljava/lang/String;
    new-instance v2, Landroid/content/pm/PackageParser;

    invoke-direct {v2, v0}, Landroid/content/pm/PackageParser;-><init>(Ljava/lang/String;)V

    .line 426
    .local v2, "packageParser":Landroid/content/pm/PackageParser;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 427
    .local v3, "sourceFile":Ljava/io/File;
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 428
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v1}, Landroid/util/DisplayMetrics;->setToDefaults()V

    .line 429
    const/4 v4, 0x0

    invoke-virtual {v2, v3, v0, v1, v4}, Landroid/content/pm/PackageParser;->parsePackage(Ljava/io/File;Ljava/lang/String;Landroid/util/DisplayMetrics;I)Landroid/content/pm/PackageParser$Package;

    move-result-object v4

    return-object v4
.end method

.method private getProductApplicationsToInstall()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 318
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 320
    .local v0, "applicationList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    new-instance v3, Ljava/io/File;

    sget-object v7, Lcom/android/server/pm/CustomizedApplicationInstaller;->PRODUCT_CONFIGURED_APPLICATIONS:Ljava/lang/String;

    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 322
    .local v3, "directory":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 323
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 324
    .local v1, "appsFiles":[Ljava/io/File;
    if-eqz v1, :cond_0

    .line 325
    move-object v2, v1

    .local v2, "arr$":[Ljava/io/File;
    array-length v6, v2

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_0

    aget-object v4, v2, v5

    .line 326
    .local v4, "file":Ljava/io/File;
    invoke-direct {p0, v0, v4}, Lcom/android/server/pm/CustomizedApplicationInstaller;->addFile(Ljava/util/ArrayList;Ljava/io/File;)V

    .line 325
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 330
    .end local v1    # "appsFiles":[Ljava/io/File;
    .end local v2    # "arr$":[Ljava/io/File;
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_0
    return-object v0
.end method

.method private isSoftwareNew()Z
    .locals 5

    .prologue
    .line 437
    iget-object v2, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mSettings:Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;

    invoke-virtual {v2}, Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;->getSoftwareVersion()Ljava/lang/String;

    move-result-object v1

    .line 438
    .local v1, "savedVersion":Ljava/lang/String;
    invoke-direct {p0}, Lcom/android/server/pm/CustomizedApplicationInstaller;->getCurrentSwVersion()Ljava/lang/String;

    move-result-object v0

    .line 439
    .local v0, "currentVersion":Ljava/lang/String;
    sget-object v2, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CurrentVersion="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " SavedVersion= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private shouldInstall(Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;Ljava/lang/String;Z)Z
    .locals 2
    .param p1, "existingPackage"    # Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "updateExistingOnly"    # Z

    .prologue
    .line 400
    const/4 v0, 0x1

    .line 402
    .local v0, "install":Z
    if-eqz p3, :cond_0

    .line 405
    if-nez p1, :cond_0

    .line 406
    iget-object v1, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mSettings:Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;

    invoke-virtual {v1, p2}, Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;->isPreinstalled(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v0, 0x1

    .line 414
    :cond_0
    :goto_0
    return v0

    .line 406
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public install()V
    .locals 14

    .prologue
    .line 112
    new-instance v11, Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;

    iget-object v12, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mContext:Landroid/content/Context;

    invoke-direct {v11, v12}, Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;-><init>(Landroid/content/Context;)V

    iput-object v11, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mSettings:Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;

    .line 114
    invoke-direct {p0}, Lcom/android/server/pm/CustomizedApplicationInstaller;->isSoftwareNew()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .local v0, "applicationList":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-direct {p0}, Lcom/android/server/pm/CustomizedApplicationInstaller;->getCustomizedApplicationsToInstall()Ljava/util/List;

    move-result-object v11

    invoke-interface {v0, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 120
    invoke-direct {p0}, Lcom/android/server/pm/CustomizedApplicationInstaller;->getProductApplicationsToInstall()Ljava/util/List;

    move-result-object v11

    invoke-interface {v0, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 122
    invoke-direct {p0}, Lcom/android/server/pm/CustomizedApplicationInstaller;->getBlacklist()Ljava/util/Set;

    move-result-object v7

    .line 124
    .local v7, "packagesBlacklist":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 125
    .local v6, "packageSettings":Lcom/android/server/pm/CustomizedApplicationInstaller$PackageSettings;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v11

    if-lez v11, :cond_0

    .line 126
    new-instance v6, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageSettings;

    .end local v6    # "packageSettings":Lcom/android/server/pm/CustomizedApplicationInstaller$PackageSettings;
    invoke-direct {v6}, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageSettings;-><init>()V

    .line 129
    .restart local v6    # "packageSettings":Lcom/android/server/pm/CustomizedApplicationInstaller$PackageSettings;
    :cond_0
    iget-object v11, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x111005b

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v10

    .line 132
    .local v10, "updateExistingOnly":Z
    const/4 v9, 0x1

    .line 134
    .local v9, "result":Z
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 135
    .local v2, "file":Ljava/io/File;
    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/android/server/pm/CustomizedApplicationInstaller;->getPackageInfo(Landroid/net/Uri;)Landroid/content/pm/PackageParser$Package;

    move-result-object v8

    .line 136
    .local v8, "pkgInfo":Landroid/content/pm/PackageParser$Package;
    if-eqz v8, :cond_1

    .line 141
    iget-object v11, v8, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v11}, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageSettings;->getPackageInfo(Ljava/lang/String;)Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;

    move-result-object v1

    .line 144
    .local v1, "existingPackage":Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;
    iget-object v11, v8, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-interface {v7, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_3

    iget-object v11, v8, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-direct {p0, v1, v11, v10}, Lcom/android/server/pm/CustomizedApplicationInstaller;->shouldInstall(Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;Ljava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_3

    iget v11, v8, Landroid/content/pm/PackageParser$Package;->mVersionCode:I

    invoke-virtual {p0, v1, v11}, Lcom/android/server/pm/CustomizedApplicationInstaller;->isNewerVersion(Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;I)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 149
    if-nez v1, :cond_4

    const/4 v5, 0x0

    .line 150
    .local v5, "oldPath":Ljava/lang/String;
    :goto_1
    iget-object v11, v8, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-direct {p0, v11, v2, v5}, Lcom/android/server/pm/CustomizedApplicationInstaller;->copyApk(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)Z

    move-result v4

    .line 151
    .local v4, "installed":Z
    if-eqz v4, :cond_2

    if-nez v1, :cond_2

    .line 153
    iget-object v11, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mNewApplications:Ljava/util/List;

    iget-object v12, v8, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    :cond_2
    and-int/2addr v9, v4

    .line 157
    .end local v4    # "installed":Z
    .end local v5    # "oldPath":Ljava/lang/String;
    :cond_3
    iget-object v11, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mSettings:Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;

    iget-object v12, v8, Landroid/content/pm/PackageParser$Package;->packageName:Ljava/lang/String;

    invoke-virtual {v11, v12}, Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;->addPackage(Ljava/lang/String;)V

    goto :goto_0

    .line 149
    :cond_4
    iget-object v5, v1, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;->mPath:Ljava/lang/String;

    goto :goto_1

    .line 161
    .end local v1    # "existingPackage":Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;
    .end local v2    # "file":Ljava/io/File;
    .end local v8    # "pkgInfo":Landroid/content/pm/PackageParser$Package;
    :cond_5
    if-eqz v9, :cond_6

    .line 162
    iget-object v11, p0, Lcom/android/server/pm/CustomizedApplicationInstaller;->mSettings:Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;

    invoke-direct {p0}, Lcom/android/server/pm/CustomizedApplicationInstaller;->getCurrentSwVersion()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/android/server/pm/CustomizedApplicationInstaller$ApplicationSettings;->save(Ljava/lang/String;)V

    .line 164
    :cond_6
    sget-object v11, Lcom/android/server/pm/CustomizedApplicationInstaller;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "installApplications() -- end result="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    .end local v0    # "applicationList":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v6    # "packageSettings":Lcom/android/server/pm/CustomizedApplicationInstaller$PackageSettings;
    .end local v7    # "packagesBlacklist":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v9    # "result":Z
    .end local v10    # "updateExistingOnly":Z
    :cond_7
    return-void
.end method

.method protected isNewerVersion(Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;I)Z
    .locals 1
    .param p1, "existingPackage"    # Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;
    .param p2, "versionCode"    # I

    .prologue
    .line 382
    if-eqz p1, :cond_0

    iget v0, p1, Lcom/android/server/pm/CustomizedApplicationInstaller$PackageInfoLite;->mVersionCode:I

    if-le p2, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
