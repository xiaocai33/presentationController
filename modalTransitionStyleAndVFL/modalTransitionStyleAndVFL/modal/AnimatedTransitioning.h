//
//  AnimatedTransitioning.h
//  01-自定义UIPresentationController
//
//  Created by 小蔡 on 16/3/31.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AnimatedTransitioning : NSObject <UIViewControllerAnimatedTransitioning>
//用于记录控制器是创建还是销毁
@property (nonatomic, assign) BOOL presented;
@end
