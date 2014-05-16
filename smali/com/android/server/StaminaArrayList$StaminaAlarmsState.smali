.class final enum Lcom/android/server/StaminaArrayList$StaminaAlarmsState;
.super Ljava/lang/Enum;
.source "StaminaArrayList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/StaminaArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "StaminaAlarmsState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/server/StaminaArrayList$StaminaAlarmsState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

.field public static final enum RESUME_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

.field public static final enum SUPPRESS_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

.field public static final enum SUPPRESS_ALARMS_BEFORE_SPECIFIC_TIME:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 61
    new-instance v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    const-string v1, "SUPPRESS_ALARMS"

    invoke-direct {v0, v1, v2}, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->SUPPRESS_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    .line 69
    new-instance v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    const-string v1, "SUPPRESS_ALARMS_BEFORE_SPECIFIC_TIME"

    invoke-direct {v0, v1, v3}, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->SUPPRESS_ALARMS_BEFORE_SPECIFIC_TIME:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    .line 74
    new-instance v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    const-string v1, "RESUME_ALARMS"

    invoke-direct {v0, v1, v4}, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->RESUME_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    .line 56
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    sget-object v1, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->SUPPRESS_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->SUPPRESS_ALARMS_BEFORE_SPECIFIC_TIME:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->RESUME_ALARMS:Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->$VALUES:[Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 56
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/server/StaminaArrayList$StaminaAlarmsState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 56
    const-class v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    return-object v0
.end method

.method public static values()[Lcom/android/server/StaminaArrayList$StaminaAlarmsState;
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->$VALUES:[Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    invoke-virtual {v0}, [Lcom/android/server/StaminaArrayList$StaminaAlarmsState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/server/StaminaArrayList$StaminaAlarmsState;

    return-object v0
.end method
