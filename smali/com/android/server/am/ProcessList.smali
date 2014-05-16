.class Lcom/android/server/am/ProcessList;
.super Ljava/lang/Object;
.source "ProcessList.java"


# static fields
.field static final BACKUP_APP_ADJ:I = 0x4

.field static final CONTENT_APP_IDLE_OFFSET:J = 0x3a98L

.field static final EMPTY_APP_IDLE_OFFSET:J = 0x1d4c0L

.field static final FOREGROUND_APP_ADJ:I = 0x0

.field static final HEAVY_WEIGHT_APP_ADJ:I = 0x3

.field static final HIDDEN_APP_MAX_ADJ:I = 0xf

.field static HIDDEN_APP_MIN_ADJ:I = 0x0

.field static final HOME_APP_ADJ:I = 0x6

.field static final MAX_EMPTY_TIME:J = 0x1b7740L

.field static final MAX_HIDDEN_APPS:I

.field static final MIN_CRASH_INTERVAL:I = 0xea60

.field static final MIN_HIDDEN_APPS:I = 0x2

.field static final PAGE_SIZE:I = 0x1000

.field static final PERCEPTIBLE_APP_ADJ:I = 0x2

.field static final PERSISTENT_PROC_ADJ:I = -0xc

.field static final PREVIOUS_APP_ADJ:I = 0x7

.field static final SERVICE_ADJ:I = 0x5

.field static final SERVICE_B_ADJ:I = 0x8

.field static final SYSTEM_ADJ:I = -0x10

.field static final TRIM_CRITICAL_THRESHOLD:I = 0x3

.field static final TRIM_EMPTY_APPS:I = 0x3

.field static final TRIM_HIDDEN_APPS:I = 0x3

.field static final TRIM_LOW_THRESHOLD:I = 0x5

.field static final VISIBLE_APP_ADJ:I = 0x1


# instance fields
.field private mHaveDisplaySize:Z

.field private final mHighEndPx:J

.field private final mHighEndRam:J

.field private final mLowEndPx:J

.field private final mLowEndRam:J

.field private final mOomAdj:[I

.field private final mOomMinFree:[J

.field private final mOomMinFreeHigh:[J

.field private final mOomMinFreeLow:[J

.field private final mTotalMemMb:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 47
    const/16 v0, 0x9

    sput v0, Lcom/android/server/am/ProcessList;->HIDDEN_APP_MIN_ADJ:I

    .line 109
    const-string v0, "ro.sys.fw.bg_apps_limit"

    const/16 v1, 0x32

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/server/am/ProcessList;->MAX_HIDDEN_APPS:I

    return-void
.end method

.method constructor <init>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v4, 0x6

    const/4 v5, 0x0

    .line 169
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 139
    new-array v1, v4, [I

    aput v5, v1, v5

    aput v2, v1, v2

    aput v3, v1, v3

    const/4 v2, 0x3

    aput v6, v1, v2

    sget v2, Lcom/android/server/am/ProcessList;->HIDDEN_APP_MIN_ADJ:I

    aput v2, v1, v6

    const/4 v2, 0x5

    const/16 v3, 0xf

    aput v3, v1, v2

    iput-object v1, p0, Lcom/android/server/am/ProcessList;->mOomAdj:[I

    .line 145
    new-array v1, v4, [J

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/android/server/am/ProcessList;->mOomMinFreeLow:[J

    .line 151
    new-array v1, v4, [J

    fill-array-data v1, :array_1

    iput-object v1, p0, Lcom/android/server/am/ProcessList;->mOomMinFreeHigh:[J

    .line 157
    const-wide/16 v1, 0x400

    iput-wide v1, p0, Lcom/android/server/am/ProcessList;->mLowEndRam:J

    .line 158
    const-wide/16 v1, 0x800

    iput-wide v1, p0, Lcom/android/server/am/ProcessList;->mHighEndRam:J

    .line 159
    const-wide/32 v1, 0x96000

    iput-wide v1, p0, Lcom/android/server/am/ProcessList;->mLowEndPx:J

    .line 160
    const-wide/32 v1, 0x1fa400

    iput-wide v1, p0, Lcom/android/server/am/ProcessList;->mHighEndPx:J

    .line 163
    iget-object v1, p0, Lcom/android/server/am/ProcessList;->mOomAdj:[I

    array-length v1, v1

    new-array v1, v1, [J

    iput-object v1, p0, Lcom/android/server/am/ProcessList;->mOomMinFree:[J

    .line 170
    new-instance v0, Lcom/android/internal/util/MemInfoReader;

    invoke-direct {v0}, Lcom/android/internal/util/MemInfoReader;-><init>()V

    .line 171
    .local v0, "minfo":Lcom/android/internal/util/MemInfoReader;
    invoke-virtual {v0}, Lcom/android/internal/util/MemInfoReader;->readMemInfo()V

    .line 172
    invoke-virtual {v0}, Lcom/android/internal/util/MemInfoReader;->getTotalSize()J

    move-result-wide v1

    const-wide/32 v3, 0x100000

    div-long/2addr v1, v3

    iput-wide v1, p0, Lcom/android/server/am/ProcessList;->mTotalMemMb:J

    .line 173
    invoke-direct {p0, v5, v5, v5}, Lcom/android/server/am/ProcessList;->updateOomLevels(IIZ)V

    .line 174
    return-void

    .line 145
    nop

    :array_0
    .array-data 8
        0xea60
        0x107ac
        0x124f8
        0x14244
        0x15f90
        0x186a0
    .end array-data

    .line 151
    :array_1
    .array-data 8
        0xea60
        0x13880
        0x186a0
        0x1d4c0
        0x222e0
        0x30d40
    .end array-data
.end method

.method private updateOomLevels(IIZ)V
    .locals 14
    .param p1, "displayWidth"    # I
    .param p2, "displayHeight"    # I
    .param p3, "write"    # Z

    .prologue
    .line 190
    iget-wide v10, p0, Lcom/android/server/am/ProcessList;->mTotalMemMb:J

    const-wide/16 v12, 0x400

    sub-long/2addr v10, v12

    long-to-float v10, v10

    const/high16 v11, 0x44800000

    div-float v9, v10, v11

    .line 193
    .local v9, "scaleMem":F
    mul-int v10, p1, p2

    int-to-float v10, v10

    const/high16 v11, 0x49160000

    sub-float/2addr v10, v11

    const v11, 0x49b22000

    div-float v8, v10, v11

    .line 196
    .local v8, "scaleDisp":F
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 197
    .local v0, "adjString":Ljava/lang/StringBuilder;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 199
    .local v6, "memString":Ljava/lang/StringBuilder;
    cmpl-float v10, v9, v8

    if-lez v10, :cond_2

    move v7, v9

    .line 200
    .local v7, "scale":F
    :goto_0
    const/4 v10, 0x0

    cmpg-float v10, v7, v10

    if-gez v10, :cond_3

    const/4 v7, 0x0

    .line 202
    :cond_0
    :goto_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    iget-object v10, p0, Lcom/android/server/am/ProcessList;->mOomAdj:[I

    array-length v10, v10

    if-ge v3, v10, :cond_4

    .line 203
    iget-object v10, p0, Lcom/android/server/am/ProcessList;->mOomMinFreeLow:[J

    aget-wide v4, v10, v3

    .line 204
    .local v4, "low":J
    iget-object v10, p0, Lcom/android/server/am/ProcessList;->mOomMinFreeHigh:[J

    aget-wide v1, v10, v3

    .line 205
    .local v1, "high":J
    iget-object v10, p0, Lcom/android/server/am/ProcessList;->mOomMinFree:[J

    long-to-float v11, v4

    sub-long v12, v1, v4

    long-to-float v12, v12

    mul-float/2addr v12, v7

    add-float/2addr v11, v12

    float-to-long v11, v11

    aput-wide v11, v10, v3

    .line 207
    if-lez v3, :cond_1

    .line 208
    const/16 v10, 0x2c

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 209
    const/16 v10, 0x2c

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    :cond_1
    iget-object v10, p0, Lcom/android/server/am/ProcessList;->mOomAdj:[I

    aget v10, v10, v3

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    iget-object v10, p0, Lcom/android/server/am/ProcessList;->mOomMinFree:[J

    aget-wide v10, v10, v3

    const-wide/16 v12, 0x400

    mul-long/2addr v10, v12

    const-wide/16 v12, 0x1000

    div-long/2addr v10, v12

    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 202
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .end local v1    # "high":J
    .end local v3    # "i":I
    .end local v4    # "low":J
    .end local v7    # "scale":F
    :cond_2
    move v7, v8

    .line 199
    goto :goto_0

    .line 201
    .restart local v7    # "scale":F
    :cond_3
    const/high16 v10, 0x3f800000

    cmpl-float v10, v7, v10

    if-lez v10, :cond_0

    const/high16 v7, 0x3f800000

    goto :goto_1

    .line 216
    .restart local v3    # "i":I
    :cond_4
    if-eqz p3, :cond_5

    .line 217
    const-string v10, "/sys/module/lowmemorykiller/parameters/adj"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v10, v11}, Lcom/android/server/am/ProcessList;->writeFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    const-string v10, "/sys/module/lowmemorykiller/parameters/minfree"

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {p0, v10, v11}, Lcom/android/server/am/ProcessList;->writeFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    :cond_5
    return-void
.end method

.method private writeFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 234
    const/4 v1, 0x0

    .line 236
    .local v1, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 237
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .local v2, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 241
    if-eqz v2, :cond_2

    .line 243
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v1, v2

    .line 248
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    :cond_0
    :goto_0
    return-void

    .line 244
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v3

    move-object v1, v2

    .line 245
    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0

    .line 238
    :catch_1
    move-exception v0

    .line 239
    .local v0, "e":Ljava/io/IOException;
    :goto_1
    :try_start_3
    const-string v3, "ActivityManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to write "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 241
    if-eqz v1, :cond_0

    .line 243
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0

    .line 244
    :catch_2
    move-exception v3

    goto :goto_0

    .line 241
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_2
    if-eqz v1, :cond_1

    .line 243
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 245
    :cond_1
    :goto_3
    throw v3

    .line 244
    :catch_3
    move-exception v4

    goto :goto_3

    .line 241
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 238
    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v0

    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v1    # "fos":Ljava/io/FileOutputStream;
    .restart local v2    # "fos":Ljava/io/FileOutputStream;
    :cond_2
    move-object v1, v2

    .end local v2    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "fos":Ljava/io/FileOutputStream;
    goto :goto_0
.end method


# virtual methods
.method applyDisplaySize(Lcom/android/server/wm/WindowManagerService;)V
    .locals 4
    .param p1, "wm"    # Lcom/android/server/wm/WindowManagerService;

    .prologue
    const/4 v3, 0x1

    .line 177
    iget-boolean v1, p0, Lcom/android/server/am/ProcessList;->mHaveDisplaySize:Z

    if-nez v1, :cond_0

    .line 178
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 179
    .local v0, "p":Landroid/graphics/Point;
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Lcom/android/server/wm/WindowManagerService;->getInitialDisplaySize(ILandroid/graphics/Point;)V

    .line 180
    iget v1, v0, Landroid/graphics/Point;->x:I

    if-eqz v1, :cond_0

    iget v1, v0, Landroid/graphics/Point;->y:I

    if-eqz v1, :cond_0

    .line 181
    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-direct {p0, v1, v2, v3}, Lcom/android/server/am/ProcessList;->updateOomLevels(IIZ)V

    .line 182
    iput-boolean v3, p0, Lcom/android/server/am/ProcessList;->mHaveDisplaySize:Z

    .line 185
    .end local v0    # "p":Landroid/graphics/Point;
    :cond_0
    return-void
.end method

.method getMemLevel(I)J
    .locals 5
    .param p1, "adjustment"    # I

    .prologue
    const-wide/16 v3, 0x400

    .line 225
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/android/server/am/ProcessList;->mOomAdj:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 226
    iget-object v1, p0, Lcom/android/server/am/ProcessList;->mOomAdj:[I

    aget v1, v1, v0

    if-gt p1, v1, :cond_0

    .line 227
    iget-object v1, p0, Lcom/android/server/am/ProcessList;->mOomMinFree:[J

    aget-wide v1, v1, v0

    mul-long/2addr v1, v3

    .line 230
    :goto_1
    return-wide v1

    .line 225
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 230
    :cond_1
    iget-object v1, p0, Lcom/android/server/am/ProcessList;->mOomMinFree:[J

    iget-object v2, p0, Lcom/android/server/am/ProcessList;->mOomAdj:[I

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    aget-wide v1, v1, v2

    mul-long/2addr v1, v3

    goto :goto_1
.end method
