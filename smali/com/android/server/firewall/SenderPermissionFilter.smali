.class Lcom/android/server/firewall/SenderPermissionFilter;
.super Ljava/lang/Object;
.source "SenderPermissionFilter.java"

# interfaces
.implements Lcom/android/server/firewall/Filter;


# static fields
.field private static final ATTR_NAME:Ljava/lang/String; = "name"

.field public static final FACTORY:Lcom/android/server/firewall/FilterFactory;


# instance fields
.field private final mPermission:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 45
    new-instance v0, Lcom/android/server/firewall/SenderPermissionFilter$1;

    const-string v1, "sender-permission"

    invoke-direct {v0, v1}, Lcom/android/server/firewall/SenderPermissionFilter$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/firewall/SenderPermissionFilter;->FACTORY:Lcom/android/server/firewall/FilterFactory;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "permission"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/android/server/firewall/SenderPermissionFilter;->mPermission:Ljava/lang/String;

    .line 33
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/android/server/firewall/SenderPermissionFilter$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lcom/android/server/firewall/SenderPermissionFilter$1;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/android/server/firewall/SenderPermissionFilter;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public matches(Lcom/android/server/firewall/IntentFirewall;Landroid/content/Intent;Landroid/content/pm/ApplicationInfo;IILjava/lang/String;Landroid/content/pm/ApplicationInfo;)Z
    .locals 6
    .param p1, "ifw"    # Lcom/android/server/firewall/IntentFirewall;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "callerApp"    # Landroid/content/pm/ApplicationInfo;
    .param p4, "callerUid"    # I
    .param p5, "callerPid"    # I
    .param p6, "resolvedType"    # Ljava/lang/String;
    .param p7, "resolvedApp"    # Landroid/content/pm/ApplicationInfo;

    .prologue
    .line 41
    iget-object v1, p0, Lcom/android/server/firewall/SenderPermissionFilter;->mPermission:Ljava/lang/String;

    iget v4, p7, Landroid/content/pm/ApplicationInfo;->uid:I

    const/4 v5, 0x1

    move-object v0, p1

    move v2, p5

    move v3, p4

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/firewall/IntentFirewall;->checkComponentPermission(Ljava/lang/String;IIIZ)Z

    move-result v0

    return v0
.end method
