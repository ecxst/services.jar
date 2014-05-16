.class Lcom/android/server/StaminaArrayList;
.super Ljava/util/ArrayList;
.source "StaminaArrayList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/StaminaArrayList$1;,
        Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;,
        Lcom/android/server/StaminaArrayList$StaminaAlarmsState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/ArrayList",
        "<TE;>;"
    }
.end annotation


# static fields
.field static final serialVersionUID:J = 0x70bb544d96cf9L


# instance fields
.field private mAlarmsState:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

.field private mElapsedReleaseAlarmsFrom:J

.field private mIncreasingTimeOrder:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<TE;>;"
        }
    .end annotation
.end field

.field private mRTCReleaseAlarmsFrom:J

.field private mStaminaHelper:Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/server/StaminaArrayList$StaminaAlarmHelper",
            "<TE;>;"
        }
    .end annotation
.end field

.field private mSuppressedAlarms:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Comparator;Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<TE;>;",
            "Lcom/android/server/StaminaArrayList$StaminaAlarmHelper",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<TE;>;"
    .local p2, "helper":Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;, "Lcom/android/server/StaminaArrayList$StaminaAlarmHelper<TE;>;"
    const-wide/16 v1, 0x0

    .line 84
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/StaminaArrayList;->mSuppressedAlarms:Ljava/util/ArrayList;

    .line 36
    sget-object v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->RESUME_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    iput-object v0, p0, Lcom/android/server/StaminaArrayList;->mAlarmsState:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    .line 46
    iput-wide v1, p0, Lcom/android/server/StaminaArrayList;->mElapsedReleaseAlarmsFrom:J

    .line 53
    iput-wide v1, p0, Lcom/android/server/StaminaArrayList;->mRTCReleaseAlarmsFrom:J

    .line 85
    iput-object p1, p0, Lcom/android/server/StaminaArrayList;->mIncreasingTimeOrder:Ljava/util/Comparator;

    .line 86
    iput-object p2, p0, Lcom/android/server/StaminaArrayList;->mStaminaHelper:Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;

    .line 87
    return-void
.end method

.method private changeState(Lcom/android/server/StaminaArrayList$StaminaAlarmsState;)Z
    .locals 3
    .param p1, "state"    # Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    .prologue
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    const-wide/16 v1, 0x0

    .line 107
    iget-object v0, p0, Lcom/android/server/StaminaArrayList;->mAlarmsState:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    if-eq p1, v0, :cond_0

    .line 108
    iput-object p1, p0, Lcom/android/server/StaminaArrayList;->mAlarmsState:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    .line 109
    iput-wide v1, p0, Lcom/android/server/StaminaArrayList;->mRTCReleaseAlarmsFrom:J

    .line 110
    iput-wide v1, p0, Lcom/android/server/StaminaArrayList;->mElapsedReleaseAlarmsFrom:J

    .line 111
    invoke-virtual {p0}, Lcom/android/server/StaminaArrayList;->update()Z

    move-result v0

    .line 113
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isAlarmSuppressed(Ljava/lang/Object;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    .local p1, "alarm":Ljava/lang/Object;, "TE;"
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 236
    sget-object v0, Lcom/android/server/StaminaArrayList$1;->$SwitchMap$com$android$server$StaminaArrayList$StaminaAlarmsState:[I

    iget-object v1, p0, Lcom/android/server/StaminaArrayList;->mAlarmsState:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    invoke-virtual {v1}, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 244
    :cond_0
    :goto_0
    return v7

    .line 238
    :pswitch_0
    iget-object v0, p0, Lcom/android/server/StaminaArrayList;->mStaminaHelper:Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;

    invoke-interface {v0, p1}, Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;->isWhitelisted(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    move v0, v6

    :goto_1
    move v7, v0

    goto :goto_0

    :cond_1
    move v0, v7

    goto :goto_1

    .line 240
    :pswitch_1
    iget-object v0, p0, Lcom/android/server/StaminaArrayList;->mStaminaHelper:Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;

    invoke-interface {v0, p1}, Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;->isWhitelisted(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/android/server/StaminaArrayList;->mStaminaHelper:Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;

    iget-wide v2, p0, Lcom/android/server/StaminaArrayList;->mRTCReleaseAlarmsFrom:J

    iget-wide v4, p0, Lcom/android/server/StaminaArrayList;->mElapsedReleaseAlarmsFrom:J

    move-object v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/android/server/StaminaArrayList$StaminaAlarmHelper;->isExpiringAfter(Ljava/lang/Object;JJ)Z

    move-result v0

    if-nez v0, :cond_2

    :goto_2
    move v7, v6

    goto :goto_0

    :cond_2
    move v6, v7

    goto :goto_2

    .line 236
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)V"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    .local p2, "alarm":Ljava/lang/Object;, "TE;"
    invoke-direct {p0, p2}, Lcom/android/server/StaminaArrayList;->isAlarmSuppressed(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lcom/android/server/StaminaArrayList;->mSuppressedAlarms:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 226
    :goto_0
    return-void

    .line 224
    :cond_0
    invoke-super {p0, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    .local p1, "alarm":Ljava/lang/Object;, "TE;"
    invoke-direct {p0, p1}, Lcom/android/server/StaminaArrayList;->isAlarmSuppressed(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/StaminaArrayList;->mSuppressedAlarms:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<+TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 274
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    .local p2, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TE;>;)Z"
        }
    .end annotation

    .prologue
    .line 269
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<+TE;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAllAlarms()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 174
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 175
    .local v3, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TE;>;"
    iget-object v4, p0, Lcom/android/server/StaminaArrayList;->mSuppressedAlarms:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 176
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 177
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 178
    .local v0, "alarm":Ljava/lang/Object;, "TE;"
    iget-object v4, p0, Lcom/android/server/StaminaArrayList;->mIncreasingTimeOrder:Ljava/util/Comparator;

    invoke-static {v3, v0, v4}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v1

    .line 179
    .local v1, "index":I
    if-gez v1, :cond_0

    .line 180
    rsub-int/lit8 v4, v1, 0x0

    add-int/lit8 v1, v4, -0x1

    .line 182
    :cond_0
    invoke-virtual {v3, v1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 184
    .end local v0    # "alarm":Ljava/lang/Object;, "TE;"
    .end local v1    # "index":I
    :cond_1
    return-object v3
.end method

.method public getSuppressedAlarms()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 195
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    iget-object v0, p0, Lcom/android/server/StaminaArrayList;->mSuppressedAlarms:Ljava/util/ArrayList;

    return-object v0
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .prologue
    .line 254
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 249
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    invoke-super {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/server/StaminaArrayList;->mSuppressedAlarms:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 259
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected removeRange(II)V
    .locals 2
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I

    .prologue
    .line 264
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Not implemented!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resumeAlarmsAfter(JJ)Z
    .locals 2
    .param p1, "rtc"    # J
    .param p3, "elapsed"    # J

    .prologue
    .line 161
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    iget-object v0, p0, Lcom/android/server/StaminaArrayList;->mAlarmsState:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    sget-object v1, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->SUPPRESS_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    .line 165
    :goto_0
    return v0

    .line 162
    :cond_0
    sget-object v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->SUPPRESS_ALARMS_BEFORE_SPECIFIC_TIME:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    iput-object v0, p0, Lcom/android/server/StaminaArrayList;->mAlarmsState:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    .line 163
    iput-wide p1, p0, Lcom/android/server/StaminaArrayList;->mRTCReleaseAlarmsFrom:J

    .line 164
    iput-wide p3, p0, Lcom/android/server/StaminaArrayList;->mElapsedReleaseAlarmsFrom:J

    .line 165
    invoke-virtual {p0}, Lcom/android/server/StaminaArrayList;->update()Z

    move-result v0

    goto :goto_0
.end method

.method public suppressAlarms(Z)Z
    .locals 1
    .param p1, "suppress"    # Z

    .prologue
    .line 96
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    if-eqz p1, :cond_0

    sget-object v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->SUPPRESS_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    :goto_0
    invoke-direct {p0, v0}, Lcom/android/server/StaminaArrayList;->changeState(Lcom/android/server/StaminaArrayList$StaminaAlarmsState;)Z

    move-result v0

    return v0

    :cond_0
    sget-object v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->RESUME_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    goto :goto_0
.end method

.method public update()Z
    .locals 5

    .prologue
    .line 124
    .local p0, "this":Lcom/android/server/StaminaArrayList;, "Lcom/android/server/StaminaArrayList<TE;>;"
    invoke-virtual {p0}, Lcom/android/server/StaminaArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 125
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    const/4 v3, 0x0

    .line 127
    .local v3, "result":Z
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 128
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 129
    .local v0, "alarm":Ljava/lang/Object;, "TE;"
    invoke-direct {p0, v0}, Lcom/android/server/StaminaArrayList;->isAlarmSuppressed(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 130
    iget-object v4, p0, Lcom/android/server/StaminaArrayList;->mSuppressedAlarms:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 132
    const/4 v3, 0x1

    goto :goto_0

    .line 136
    .end local v0    # "alarm":Ljava/lang/Object;, "TE;"
    :cond_1
    iget-object v4, p0, Lcom/android/server/StaminaArrayList;->mSuppressedAlarms:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 137
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 138
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 139
    .restart local v0    # "alarm":Ljava/lang/Object;, "TE;"
    invoke-direct {p0, v0}, Lcom/android/server/StaminaArrayList;->isAlarmSuppressed(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 140
    const/4 v3, 0x1

    .line 141
    iget-object v4, p0, Lcom/android/server/StaminaArrayList;->mIncreasingTimeOrder:Ljava/util/Comparator;

    invoke-static {p0, v0, v4}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v1

    .line 142
    .local v1, "index":I
    if-gez v1, :cond_3

    .line 143
    rsub-int/lit8 v4, v1, 0x0

    add-int/lit8 v1, v4, -0x1

    .line 145
    :cond_3
    invoke-super {p0, v1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 146
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 149
    .end local v0    # "alarm":Ljava/lang/Object;, "TE;"
    .end local v1    # "index":I
    :cond_4
    return v3
.end method
