.class public final Lcom/android/server/TwilightService;
.super Ljava/lang/Object;
.source "TwilightService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/TwilightService$LocationHandler;,
        Lcom/android/server/TwilightService$TwilightListenerRecord;,
        Lcom/android/server/TwilightService$TwilightListener;,
        Lcom/android/server/TwilightService$TwilightState;
    }
.end annotation


# static fields
.field private static final ACTION_UPDATE_TWILIGHT_STATE:Ljava/lang/String; = "com.android.server.action.UPDATE_TWILIGHT_STATE"

.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "TwilightService"


# instance fields
.field private final mAlarmManager:Landroid/app/AlarmManager;

.field private final mContext:Landroid/content/Context;

.field private final mEmptyLocationListener:Landroid/location/LocationListener;

.field private final mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/TwilightService$TwilightListenerRecord;",
            ">;"
        }
    .end annotation
.end field

.field private final mLocationHandler:Lcom/android/server/TwilightService$LocationHandler;

.field private final mLocationListener:Landroid/location/LocationListener;

.field private final mLocationManager:Landroid/location/LocationManager;

.field private final mLock:Ljava/lang/Object;

.field private mSystemReady:Z

.field private mTwilightState:Lcom/android/server/TwilightService$TwilightState;

.field private final mUpdateLocationReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 72
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/TwilightService;->mLock:Ljava/lang/Object;

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/TwilightService;->mListeners:Ljava/util/ArrayList;

    .line 527
    new-instance v0, Lcom/android/server/TwilightService$1;

    invoke-direct {v0, p0}, Lcom/android/server/TwilightService$1;-><init>(Lcom/android/server/TwilightService;)V

    iput-object v0, p0, Lcom/android/server/TwilightService;->mUpdateLocationReceiver:Landroid/content/BroadcastReceiver;

    .line 544
    new-instance v0, Lcom/android/server/TwilightService$2;

    invoke-direct {v0, p0}, Lcom/android/server/TwilightService$2;-><init>(Lcom/android/server/TwilightService;)V

    iput-object v0, p0, Lcom/android/server/TwilightService;->mEmptyLocationListener:Landroid/location/LocationListener;

    .line 558
    new-instance v0, Lcom/android/server/TwilightService$3;

    invoke-direct {v0, p0}, Lcom/android/server/TwilightService$3;-><init>(Lcom/android/server/TwilightService;)V

    iput-object v0, p0, Lcom/android/server/TwilightService;->mLocationListener:Landroid/location/LocationListener;

    .line 73
    iput-object p1, p0, Lcom/android/server/TwilightService;->mContext:Landroid/content/Context;

    .line 75
    iget-object v0, p0, Lcom/android/server/TwilightService;->mContext:Landroid/content/Context;

    const-string v1, "alarm"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    iput-object v0, p0, Lcom/android/server/TwilightService;->mAlarmManager:Landroid/app/AlarmManager;

    .line 76
    iget-object v0, p0, Lcom/android/server/TwilightService;->mContext:Landroid/content/Context;

    const-string v1, "location"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Lcom/android/server/TwilightService;->mLocationManager:Landroid/location/LocationManager;

    .line 77
    new-instance v0, Lcom/android/server/TwilightService$LocationHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/server/TwilightService$LocationHandler;-><init>(Lcom/android/server/TwilightService;Lcom/android/server/TwilightService$1;)V

    iput-object v0, p0, Lcom/android/server/TwilightService;->mLocationHandler:Lcom/android/server/TwilightService$LocationHandler;

    .line 78
    return-void
.end method

.method static synthetic access$100(Landroid/location/Location;Landroid/location/Location;)Z
    .locals 1
    .param p0, "x0"    # Landroid/location/Location;
    .param p1, "x1"    # Landroid/location/Location;

    .prologue
    .line 50
    invoke-static {p0, p1}, Lcom/android/server/TwilightService;->hasMoved(Landroid/location/Location;Landroid/location/Location;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/android/server/TwilightService;)Landroid/location/LocationListener;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/TwilightService;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/TwilightService;->mEmptyLocationListener:Landroid/location/LocationListener;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/server/TwilightService;)Landroid/location/LocationManager;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/TwilightService;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/TwilightService;->mLocationManager:Landroid/location/LocationManager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/server/TwilightService;)Landroid/location/LocationListener;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/TwilightService;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/TwilightService;->mLocationListener:Landroid/location/LocationListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/server/TwilightService;Lcom/android/server/TwilightService$TwilightState;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/server/TwilightService;
    .param p1, "x1"    # Lcom/android/server/TwilightService$TwilightState;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/android/server/TwilightService;->setTwilightState(Lcom/android/server/TwilightService$TwilightState;)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/server/TwilightService;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/TwilightService;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/TwilightService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/server/TwilightService;)Landroid/app/AlarmManager;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/TwilightService;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/TwilightService;->mAlarmManager:Landroid/app/AlarmManager;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/server/TwilightService;)Lcom/android/server/TwilightService$LocationHandler;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/TwilightService;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/android/server/TwilightService;->mLocationHandler:Lcom/android/server/TwilightService$LocationHandler;

    return-object v0
.end method

.method private static hasMoved(Landroid/location/Location;Landroid/location/Location;)Z
    .locals 8
    .param p0, "from"    # Landroid/location/Location;
    .param p1, "to"    # Landroid/location/Location;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 141
    if-nez p1, :cond_1

    .line 162
    :cond_0
    :goto_0
    return v3

    .line 145
    :cond_1
    if-nez p0, :cond_2

    move v3, v2

    .line 146
    goto :goto_0

    .line 150
    :cond_2
    invoke-virtual {p1}, Landroid/location/Location;->getElapsedRealtimeNanos()J

    move-result-wide v4

    invoke-virtual {p0}, Landroid/location/Location;->getElapsedRealtimeNanos()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_0

    .line 155
    invoke-virtual {p0, p1}, Landroid/location/Location;->distanceTo(Landroid/location/Location;)F

    move-result v0

    .line 158
    .local v0, "distance":F
    invoke-virtual {p0}, Landroid/location/Location;->getAccuracy()F

    move-result v4

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v5

    add-float v1, v4, v5

    .line 162
    .local v1, "totalAccuracy":F
    cmpl-float v4, v0, v1

    if-ltz v4, :cond_3

    :goto_1
    move v3, v2

    goto :goto_0

    :cond_3
    move v2, v3

    goto :goto_1
.end method

.method private setTwilightState(Lcom/android/server/TwilightService$TwilightState;)V
    .locals 4
    .param p1, "state"    # Lcom/android/server/TwilightService$TwilightState;

    .prologue
    .line 124
    iget-object v3, p0, Lcom/android/server/TwilightService;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 125
    :try_start_0
    iget-object v2, p0, Lcom/android/server/TwilightService;->mTwilightState:Lcom/android/server/TwilightService$TwilightState;

    invoke-static {v2, p1}, Llibcore/util/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 130
    iput-object p1, p0, Lcom/android/server/TwilightService;->mTwilightState:Lcom/android/server/TwilightService$TwilightState;

    .line 131
    iget-object v2, p0, Lcom/android/server/TwilightService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 132
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 133
    iget-object v2, p0, Lcom/android/server/TwilightService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/TwilightService$TwilightListenerRecord;

    invoke-virtual {v2}, Lcom/android/server/TwilightService$TwilightListenerRecord;->post()V

    .line 132
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 136
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_0
    monitor-exit v3

    .line 137
    return-void

    .line 136
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method


# virtual methods
.method public getCurrentState()Lcom/android/server/TwilightService$TwilightState;
    .locals 2

    .prologue
    .line 102
    iget-object v1, p0, Lcom/android/server/TwilightService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 103
    :try_start_0
    iget-object v0, p0, Lcom/android/server/TwilightService;->mTwilightState:Lcom/android/server/TwilightService$TwilightState;

    monitor-exit v1

    return-object v0

    .line 104
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public registerListener(Lcom/android/server/TwilightService$TwilightListener;Landroid/os/Handler;)V
    .locals 3
    .param p1, "listener"    # Lcom/android/server/TwilightService$TwilightListener;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 114
    iget-object v1, p0, Lcom/android/server/TwilightService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 115
    :try_start_0
    iget-object v0, p0, Lcom/android/server/TwilightService;->mListeners:Ljava/util/ArrayList;

    new-instance v2, Lcom/android/server/TwilightService$TwilightListenerRecord;

    invoke-direct {v2, p1, p2}, Lcom/android/server/TwilightService$TwilightListenerRecord;-><init>(Lcom/android/server/TwilightService$TwilightListener;Landroid/os/Handler;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    iget-boolean v0, p0, Lcom/android/server/TwilightService;->mSystemReady:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/TwilightService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 118
    iget-object v0, p0, Lcom/android/server/TwilightService;->mLocationHandler:Lcom/android/server/TwilightService$LocationHandler;

    invoke-virtual {v0}, Lcom/android/server/TwilightService$LocationHandler;->enableLocationUpdates()V

    .line 120
    :cond_0
    monitor-exit v1

    .line 121
    return-void

    .line 120
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method systemReady()V
    .locals 4

    .prologue
    .line 81
    iget-object v2, p0, Lcom/android/server/TwilightService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 82
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/android/server/TwilightService;->mSystemReady:Z

    .line 84
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 85
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.TIME_SET"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 86
    const-string v1, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 87
    const-string v1, "com.android.server.action.UPDATE_TWILIGHT_STATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 88
    iget-object v1, p0, Lcom/android/server/TwilightService;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/server/TwilightService;->mUpdateLocationReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 90
    iget-object v1, p0, Lcom/android/server/TwilightService;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 91
    iget-object v1, p0, Lcom/android/server/TwilightService;->mLocationHandler:Lcom/android/server/TwilightService$LocationHandler;

    invoke-virtual {v1}, Lcom/android/server/TwilightService$LocationHandler;->enableLocationUpdates()V

    .line 93
    :cond_0
    monitor-exit v2

    .line 94
    return-void

    .line 93
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
