.class Lcom/android/server/firewall/CategoryFilter;
.super Ljava/lang/Object;
.source "CategoryFilter.java"

# interfaces
.implements Lcom/android/server/firewall/Filter;


# static fields
.field private static final ATTR_NAME:Ljava/lang/String; = "name"

.field public static final FACTORY:Lcom/android/server/firewall/FilterFactory;


# instance fields
.field private final mCategoryName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 46
    new-instance v0, Lcom/android/server/firewall/CategoryFilter$1;

    const-string v1, "category"

    invoke-direct {v0, v1}, Lcom/android/server/firewall/CategoryFilter$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/server/firewall/CategoryFilter;->FACTORY:Lcom/android/server/firewall/FilterFactory;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "categoryName"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/android/server/firewall/CategoryFilter;->mCategoryName:Ljava/lang/String;

    .line 34
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/android/server/firewall/CategoryFilter$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lcom/android/server/firewall/CategoryFilter$1;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/android/server/firewall/CategoryFilter;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public matches(Lcom/android/server/firewall/IntentFirewall;Landroid/content/Intent;Landroid/content/pm/ApplicationInfo;IILjava/lang/String;Landroid/content/pm/ApplicationInfo;)Z
    .locals 2
    .param p1, "ifw"    # Lcom/android/server/firewall/IntentFirewall;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "callerApp"    # Landroid/content/pm/ApplicationInfo;
    .param p4, "callerUid"    # I
    .param p5, "callerPid"    # I
    .param p6, "resolvedType"    # Ljava/lang/String;
    .param p7, "resolvedApp"    # Landroid/content/pm/ApplicationInfo;

    .prologue
    .line 39
    invoke-virtual {p2}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v0

    .line 40
    .local v0, "categories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 41
    const/4 v1, 0x0

    .line 43
    :goto_0
    return v1

    :cond_0
    iget-object v1, p0, Lcom/android/server/firewall/CategoryFilter;->mCategoryName:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method
