.class Lcom/android/server/am/ActiveServices$ServiceMap;
.super Ljava/lang/Object;
.source "ActiveServices.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/am/ActiveServices;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ServiceMap"
.end annotation


# instance fields
.field private final mServicesByIntentPerUser:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/Intent$FilterComparison;",
            "Lcom/android/server/am/ServiceRecord;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mServicesByNamePerUser:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/ComponentName;",
            "Lcom/android/server/am/ServiceRecord;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 128
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/ActiveServices$ServiceMap;->mServicesByNamePerUser:Landroid/util/SparseArray;

    .line 132
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/server/am/ActiveServices$ServiceMap;->mServicesByIntentPerUser:Landroid/util/SparseArray;

    return-void
.end method

.method static synthetic access$100(Lcom/android/server/am/ActiveServices$ServiceMap;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/android/server/am/ActiveServices$ServiceMap;

    .prologue
    .line 128
    iget-object v0, p0, Lcom/android/server/am/ActiveServices$ServiceMap;->mServicesByNamePerUser:Landroid/util/SparseArray;

    return-object v0
.end method

.method private getServices(I)Ljava/util/HashMap;
    .locals 2
    .param p1, "callingUser"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/ComponentName;",
            "Lcom/android/server/am/ServiceRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 191
    iget-object v1, p0, Lcom/android/server/am/ActiveServices$ServiceMap;->mServicesByNamePerUser:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 192
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/content/ComponentName;Lcom/android/server/am/ServiceRecord;>;"
    if-nez v0, :cond_0

    .line 193
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/content/ComponentName;Lcom/android/server/am/ServiceRecord;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 194
    .restart local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/content/ComponentName;Lcom/android/server/am/ServiceRecord;>;"
    iget-object v1, p0, Lcom/android/server/am/ActiveServices$ServiceMap;->mServicesByNamePerUser:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 196
    :cond_0
    return-object v0
.end method

.method private getServicesByIntent(I)Ljava/util/HashMap;
    .locals 2
    .param p1, "callingUser"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/Intent$FilterComparison;",
            "Lcom/android/server/am/ServiceRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 201
    iget-object v1, p0, Lcom/android/server/am/ActiveServices$ServiceMap;->mServicesByIntentPerUser:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 203
    .local v0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/content/Intent$FilterComparison;Lcom/android/server/am/ServiceRecord;>;"
    if-nez v0, :cond_0

    .line 204
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/content/Intent$FilterComparison;Lcom/android/server/am/ServiceRecord;>;"
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 205
    .restart local v0    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Landroid/content/Intent$FilterComparison;Lcom/android/server/am/ServiceRecord;>;"
    iget-object v1, p0, Lcom/android/server/am/ActiveServices$ServiceMap;->mServicesByIntentPerUser:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 207
    :cond_0
    return-object v0
.end method


# virtual methods
.method getAllServices(I)Ljava/util/Collection;
    .locals 1
    .param p1, "callingUser"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Collection",
            "<",
            "Lcom/android/server/am/ServiceRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 187
    invoke-direct {p0, p1}, Lcom/android/server/am/ActiveServices$ServiceMap;->getServices(I)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method getServiceByIntent(Landroid/content/Intent$FilterComparison;)Lcom/android/server/am/ServiceRecord;
    .locals 1
    .param p1, "filter"    # Landroid/content/Intent$FilterComparison;

    .prologue
    .line 155
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/server/am/ActiveServices$ServiceMap;->getServiceByIntent(Landroid/content/Intent$FilterComparison;I)Lcom/android/server/am/ServiceRecord;

    move-result-object v0

    return-object v0
.end method

.method getServiceByIntent(Landroid/content/Intent$FilterComparison;I)Lcom/android/server/am/ServiceRecord;
    .locals 1
    .param p1, "filter"    # Landroid/content/Intent$FilterComparison;
    .param p2, "callingUser"    # I

    .prologue
    .line 151
    invoke-direct {p0, p2}, Lcom/android/server/am/ActiveServices$ServiceMap;->getServicesByIntent(I)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/ServiceRecord;

    return-object v0
.end method

.method getServiceByName(Landroid/content/ComponentName;)Lcom/android/server/am/ServiceRecord;
    .locals 1
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 144
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/server/am/ActiveServices$ServiceMap;->getServiceByName(Landroid/content/ComponentName;I)Lcom/android/server/am/ServiceRecord;

    move-result-object v0

    return-object v0
.end method

.method getServiceByName(Landroid/content/ComponentName;I)Lcom/android/server/am/ServiceRecord;
    .locals 1
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "callingUser"    # I

    .prologue
    .line 140
    invoke-direct {p0, p2}, Lcom/android/server/am/ActiveServices$ServiceMap;->getServices(I)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/ServiceRecord;

    return-object v0
.end method

.method putServiceByIntent(Landroid/content/Intent$FilterComparison;ILcom/android/server/am/ServiceRecord;)V
    .locals 1
    .param p1, "filter"    # Landroid/content/Intent$FilterComparison;
    .param p2, "callingUser"    # I
    .param p3, "value"    # Lcom/android/server/am/ServiceRecord;

    .prologue
    .line 166
    invoke-direct {p0, p2}, Lcom/android/server/am/ActiveServices$ServiceMap;->getServicesByIntent(I)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    return-void
.end method

.method putServiceByName(Landroid/content/ComponentName;ILcom/android/server/am/ServiceRecord;)V
    .locals 1
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "callingUser"    # I
    .param p3, "value"    # Lcom/android/server/am/ServiceRecord;

    .prologue
    .line 160
    invoke-direct {p0, p2}, Lcom/android/server/am/ActiveServices$ServiceMap;->getServices(I)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    return-void
.end method

.method removeServiceByIntent(Landroid/content/Intent$FilterComparison;I)V
    .locals 2
    .param p1, "filter"    # Landroid/content/Intent$FilterComparison;
    .param p2, "callingUser"    # I

    .prologue
    .line 179
    invoke-direct {p0, p2}, Lcom/android/server/am/ActiveServices$ServiceMap;->getServicesByIntent(I)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/ServiceRecord;

    .line 183
    .local v0, "removed":Lcom/android/server/am/ServiceRecord;
    return-void
.end method

.method removeServiceByName(Landroid/content/ComponentName;I)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "callingUser"    # I

    .prologue
    .line 171
    invoke-direct {p0, p2}, Lcom/android/server/am/ActiveServices$ServiceMap;->getServices(I)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/ServiceRecord;

    .line 175
    .local v0, "removed":Lcom/android/server/am/ServiceRecord;
    return-void
.end method
