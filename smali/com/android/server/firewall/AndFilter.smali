.class Lcom/android/server/firewall/AndFilter;
.super Lcom/android/server/firewall/FilterList;
.source "AndFilter.java"


# static fields
.field public static final FACTORY:Lcom/android/server/firewall/FilterFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 39
    new-instance v0, Lcom/android/server/firewall/AndFilter$1;

    const-string v1, "and"

    invoke-direct {v0, v1}, Lcom/android/server/firewall/AndFilter$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/firewall/AndFilter;->FACTORY:Lcom/android/server/firewall/FilterFactory;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/android/server/firewall/FilterList;-><init>()V

    return-void
.end method


# virtual methods
.method public matches(Lcom/android/server/firewall/IntentFirewall;Landroid/content/Intent;Landroid/content/pm/ApplicationInfo;IILjava/lang/String;Landroid/content/pm/ApplicationInfo;)Z
    .locals 9
    .param p1, "ifw"    # Lcom/android/server/firewall/IntentFirewall;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "callerApp"    # Landroid/content/pm/ApplicationInfo;
    .param p4, "callerUid"    # I
    .param p5, "callerPid"    # I
    .param p6, "resolvedType"    # Ljava/lang/String;
    .param p7, "resolvedApp"    # Landroid/content/pm/ApplicationInfo;

    .prologue
    .line 30
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    iget-object v0, p0, Lcom/android/server/firewall/FilterList;->children:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v8, v0, :cond_1

    .line 31
    iget-object v0, p0, Lcom/android/server/firewall/FilterList;->children:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/firewall/Filter;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    move-object/from16 v7, p7

    invoke-interface/range {v0 .. v7}, Lcom/android/server/firewall/Filter;->matches(Lcom/android/server/firewall/IntentFirewall;Landroid/content/Intent;Landroid/content/pm/ApplicationInfo;IILjava/lang/String;Landroid/content/pm/ApplicationInfo;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 33
    const/4 v0, 0x0

    .line 36
    :goto_1
    return v0

    .line 30
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 36
    :cond_1
    const/4 v0, 0x1

    goto :goto_1
.end method
