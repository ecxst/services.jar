.class Lcom/android/server/ConnectivityService$4;
.super Lcom/android/server/ConnectivityService$CheckMp$CallBack;
.source "ConnectivityService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/ConnectivityService;->checkMobileProvisioning(ZILandroid/os/ResultReceiver;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/ConnectivityService;

.field final synthetic val$resultReceiver:Landroid/os/ResultReceiver;


# direct methods
.method constructor <init>(Lcom/android/server/ConnectivityService;Landroid/os/ResultReceiver;)V
    .locals 0

    .prologue
    .line 3635
    iput-object p1, p0, Lcom/android/server/ConnectivityService$4;->this$0:Lcom/android/server/ConnectivityService;

    iput-object p2, p0, Lcom/android/server/ConnectivityService$4;->val$resultReceiver:Landroid/os/ResultReceiver;

    invoke-direct {p0}, Lcom/android/server/ConnectivityService$CheckMp$CallBack;-><init>()V

    return-void
.end method


# virtual methods
.method onComplete(Ljava/lang/Integer;)V
    .locals 6
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    const/4 v5, 0x1

    .line 3638
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CheckMp.onComplete: result="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    # invokes: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$200(Ljava/lang/String;)V

    .line 3639
    iget-object v2, p0, Lcom/android/server/ConnectivityService$4;->val$resultReceiver:Landroid/os/ResultReceiver;

    if-eqz v2, :cond_0

    .line 3640
    const-string v2, "CheckMp.onComplete: send result"

    # invokes: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$200(Ljava/lang/String;)V

    .line 3641
    iget-object v2, p0, Lcom/android/server/ConnectivityService$4;->val$resultReceiver:Landroid/os/ResultReceiver;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    .line 3643
    :cond_0
    iget-object v2, p0, Lcom/android/server/ConnectivityService$4;->this$0:Lcom/android/server/ConnectivityService;

    # getter for: Lcom/android/server/ConnectivityService;->mNetTrackers:[Landroid/net/NetworkStateTracker;
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$800(Lcom/android/server/ConnectivityService;)[Landroid/net/NetworkStateTracker;

    move-result-object v2

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-interface {v2}, Landroid/net/NetworkStateTracker;->getNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 3645
    .local v0, "ni":Landroid/net/NetworkInfo;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 3677
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CheckMp.onComplete: ignore unexpected result="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    # invokes: Lcom/android/server/ConnectivityService;->loge(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$4100(Ljava/lang/String;)V

    .line 3681
    :goto_0
    return-void

    .line 3648
    :pswitch_0
    const-string v2, "CheckMp.onComplete: ignore, connected or no connection"

    # invokes: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$200(Ljava/lang/String;)V

    goto :goto_0

    .line 3652
    :pswitch_1
    const-string v2, "CheckMp.onComplete: warm sim"

    # invokes: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$200(Ljava/lang/String;)V

    .line 3653
    iget-object v2, p0, Lcom/android/server/ConnectivityService$4;->this$0:Lcom/android/server/ConnectivityService;

    invoke-virtual {v2}, Lcom/android/server/ConnectivityService;->getMobileProvisioningUrl()Ljava/lang/String;

    move-result-object v1

    .line 3654
    .local v1, "url":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3655
    iget-object v2, p0, Lcom/android/server/ConnectivityService$4;->this$0:Lcom/android/server/ConnectivityService;

    # invokes: Lcom/android/server/ConnectivityService;->getMobileRedirectedProvisioningUrl()Ljava/lang/String;
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$3900(Lcom/android/server/ConnectivityService;)Ljava/lang/String;

    move-result-object v1

    .line 3657
    :cond_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 3658
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CheckMp.onComplete: warm sim (redirected), url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    # invokes: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$200(Ljava/lang/String;)V

    .line 3659
    iget-object v2, p0, Lcom/android/server/ConnectivityService$4;->this$0:Lcom/android/server/ConnectivityService;

    # invokes: Lcom/android/server/ConnectivityService;->setNotificationVisible(ZLandroid/net/NetworkInfo;Ljava/lang/String;)V
    invoke-static {v2, v5, v0, v1}, Lcom/android/server/ConnectivityService;->access$4000(Lcom/android/server/ConnectivityService;ZLandroid/net/NetworkInfo;Ljava/lang/String;)V

    goto :goto_0

    .line 3661
    :cond_2
    const-string v2, "CheckMp.onComplete: warm sim (redirected), no url"

    # invokes: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$200(Ljava/lang/String;)V

    goto :goto_0

    .line 3667
    .end local v1    # "url":Ljava/lang/String;
    :pswitch_2
    iget-object v2, p0, Lcom/android/server/ConnectivityService$4;->this$0:Lcom/android/server/ConnectivityService;

    invoke-virtual {v2}, Lcom/android/server/ConnectivityService;->getMobileProvisioningUrl()Ljava/lang/String;

    move-result-object v1

    .line 3668
    .restart local v1    # "url":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 3669
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CheckMp.onComplete: warm sim (no dns/tcp), url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    # invokes: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$200(Ljava/lang/String;)V

    .line 3670
    iget-object v2, p0, Lcom/android/server/ConnectivityService$4;->this$0:Lcom/android/server/ConnectivityService;

    # invokes: Lcom/android/server/ConnectivityService;->setNotificationVisible(ZLandroid/net/NetworkInfo;Ljava/lang/String;)V
    invoke-static {v2, v5, v0, v1}, Lcom/android/server/ConnectivityService;->access$4000(Lcom/android/server/ConnectivityService;ZLandroid/net/NetworkInfo;Ljava/lang/String;)V

    goto :goto_0

    .line 3672
    :cond_3
    const-string v2, "CheckMp.onComplete: warm sim (no dns/tcp), no url"

    # invokes: Lcom/android/server/ConnectivityService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Lcom/android/server/ConnectivityService;->access$200(Ljava/lang/String;)V

    goto :goto_0

    .line 3645
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method
