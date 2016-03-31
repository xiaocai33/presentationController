//
//  TransitionDelegate.m
//  01-自定义UIPresentationController
//
//  Created by 小蔡 on 16/3/31.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "TransitionDelegate.h"
#import "PresentationController.h"
#import "AnimatedTransitioning.h"

@interface TransitionDelegate()

@end

@implementation TransitionDelegate
//实现单例模式
SingletonM(Transition);

#pragma mark - UIViewControllerTransitioningDelegate
//设置继承自UIPresentationController 的自定义类的属性
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[PresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

//控制器创建执行的动画（返回一个实现UIViewControllerAnimatedTransitioning协议的类）
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    //创建实现UIViewControllerAnimatedTransitioning协议的类（命名为AnimatedTransitioning）
    AnimatedTransitioning *anim = [[AnimatedTransitioning alloc] init];
    
    //将其状态改为出现
    anim.presented = YES;
    return anim;
}

//控制器销毁执行的动画（返回一个实现UIViewControllerAnimatedTransitioning协议的类）
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    ////创建实现UIViewControllerAnimatedTransitioning协议的类（命名为AnimatedTransitioning）
    AnimatedTransitioning *anim = [[AnimatedTransitioning alloc] init];
    
    //将其状态改为出现
    anim.presented = NO;
    return anim;
}
@end
