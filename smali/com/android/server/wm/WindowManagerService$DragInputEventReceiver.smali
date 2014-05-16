.class final Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;
.super Landroid/view/InputEventReceiver;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/wm/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "DragInputEventReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/wm/WindowManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/wm/WindowManagerService;Landroid/view/InputChannel;Landroid/os/Looper;)V
    .locals 0
    .param p2, "inputChannel"    # Landroid/view/InputChannel;
    .param p3, "looper"    # Landroid/os/Looper;

    .prologue
    .line 672
    iput-object p1, p0, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->this$0:Lcom/android/server/wm/WindowManagerService;

    .line 673
    invoke-direct {p0, p2, p3}, Landroid/view/InputEventReceiver;-><init>(Landroid/view/InputChannel;Landroid/os/Looper;)V

    .line 674
    return-void
.end method


# virtual methods
.method public onInputEvent(Landroid/view/InputEvent;)V
    .locals 9
    .param p1, "event"    # Landroid/view/InputEvent;

    .prologue
    .line 678
    const/4 v3, 0x0

    .line 680
    .local v3, "handled":Z
    :try_start_0
    instance-of v7, p1, Landroid/view/MotionEvent;

    if-eqz v7, :cond_1

    invoke-virtual {p1}, Landroid/view/InputEvent;->getSource()I

    move-result v7

    and-int/lit8 v7, v7, 0x2

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v7, v7, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    if-eqz v7, :cond_1

    .line 683
    move-object v0, p1

    check-cast v0, Landroid/view/MotionEvent;

    move-object v4, v0

    .line 684
    .local v4, "motionEvent":Landroid/view/MotionEvent;
    const/4 v2, 0x0

    .line 685
    .local v2, "endDrag":Z
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    .line 686
    .local v5, "newX":F
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    .line 688
    .local v6, "newY":F
    invoke-virtual {v4}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 716
    :goto_0
    :pswitch_0
    if-eqz v2, :cond_0

    .line 719
    iget-object v7, p0, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v8, v7, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 720
    :try_start_1
    iget-object v7, p0, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v7, v7, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    invoke-virtual {v7}, Lcom/android/server/wm/DragState;->endDragLw()V

    .line 721
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 724
    :cond_0
    const/4 v3, 0x1

    .line 729
    .end local v2    # "endDrag":Z
    .end local v4    # "motionEvent":Landroid/view/MotionEvent;
    .end local v5    # "newX":F
    .end local v6    # "newY":F
    :cond_1
    invoke-virtual {p0, p1, v3}, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    .line 731
    :goto_1
    return-void

    .line 696
    .restart local v2    # "endDrag":Z
    .restart local v4    # "motionEvent":Landroid/view/MotionEvent;
    .restart local v5    # "newX":F
    .restart local v6    # "newY":F
    :pswitch_1
    :try_start_2
    iget-object v7, p0, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v8, v7, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v8
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 698
    :try_start_3
    iget-object v7, p0, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v7, v7, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    invoke-virtual {v7, v5, v6}, Lcom/android/server/wm/DragState;->notifyMoveLw(FF)V

    .line 699
    monitor-exit v8

    goto :goto_0

    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v7
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 726
    .end local v2    # "endDrag":Z
    .end local v4    # "motionEvent":Landroid/view/MotionEvent;
    .end local v5    # "newX":F
    .end local v6    # "newY":F
    :catch_0
    move-exception v1

    .line 727
    .local v1, "e":Ljava/lang/Exception;
    :try_start_5
    const-string v7, "WindowManager"

    const-string v8, "Exception caught by drag handleMotion"

    invoke-static {v7, v8, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 729
    invoke-virtual {p0, p1, v3}, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    goto :goto_1

    .line 705
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "endDrag":Z
    .restart local v4    # "motionEvent":Landroid/view/MotionEvent;
    .restart local v5    # "newX":F
    .restart local v6    # "newY":F
    :pswitch_2
    :try_start_6
    iget-object v7, p0, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v8, v7, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v8
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 706
    :try_start_7
    iget-object v7, p0, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->this$0:Lcom/android/server/wm/WindowManagerService;

    iget-object v7, v7, Lcom/android/server/wm/WindowManagerService;->mDragState:Lcom/android/server/wm/DragState;

    invoke-virtual {v7, v5, v6}, Lcom/android/server/wm/DragState;->notifyDropLw(FF)Z

    move-result v2

    .line 707
    monitor-exit v8

    goto :goto_0

    :catchall_1
    move-exception v7

    monitor-exit v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v7
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 729
    .end local v2    # "endDrag":Z
    .end local v4    # "motionEvent":Landroid/view/MotionEvent;
    .end local v5    # "newX":F
    .end local v6    # "newY":F
    :catchall_2
    move-exception v7

    invoke-virtual {p0, p1, v3}, Lcom/android/server/wm/WindowManagerService$DragInputEventReceiver;->finishInputEvent(Landroid/view/InputEvent;Z)V

    throw v7

    .line 712
    .restart local v2    # "endDrag":Z
    .restart local v4    # "motionEvent":Landroid/view/MotionEvent;
    .restart local v5    # "newX":F
    .restart local v6    # "newY":F
    :pswitch_3
    const/4 v2, 0x1

    goto :goto_0

    .line 721
    :catchall_3
    move-exception v7

    :try_start_9
    monitor-exit v8
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    :try_start_a
    throw v7
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 688
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method
