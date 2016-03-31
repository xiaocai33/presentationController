//
//  PresentationController.m
//  01-自定义UIPresentationController
//
//  Created by 小蔡 on 16/3/31.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "PresentationController.h"

@implementation PresentationController
//设置弹出控制器的位置
//- (CGRect)frameOfPresentedViewInContainerView{
//    //return CGRectMake(0, 50, self.containerView.frame.size.width, self.containerView.frame.size.height - 100);
//    return CGRectInset(self.containerView.bounds, 0, 100);
//}

//即将出现调用
- (void)presentationTransitionWillBegin{
    //一旦要自定义动画，必须自己手动添加控制器
    //设置尺寸
    self.presentedView.frame = self.containerView.bounds;
    // 添加到containerView 上
    [self.containerView addSubview:self.presentedView];
}

//出现调用
- (void)presentationTransitionDidEnd:(BOOL)completed{

}

//即将销毁调用
- (void)dismissalTransitionWillBegin{

}

//销毁调用
- (void)dismissalTransitionDidEnd:(BOOL)completed{
    //一旦要自定义动画，必须自己手动移除控制器
    [self.presentedView removeFromSuperview];
}

@end
