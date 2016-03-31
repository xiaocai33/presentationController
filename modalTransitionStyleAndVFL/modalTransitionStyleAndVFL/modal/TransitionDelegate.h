//
//  TransitionDelegate.h
//  01-自定义UIPresentationController
//
//  Created by 小蔡 on 16/3/31.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface TransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>
//实现单例模式
SingletonH(Transition)

@end
