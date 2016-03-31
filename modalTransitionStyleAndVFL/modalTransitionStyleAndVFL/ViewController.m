//
//  ViewController.m
//  modalTransitionStyleAndVFL
//
//  Created by 小蔡 on 16/3/31.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "TransitionDelegate.h"

typedef enum{
    /** 自下而上 */
    btnTypeCoverVertical = 0,
    /** 中心翻转效果 */
    btnTypeFlipHorizontal,
    /** 淡出效果 */
    btnTypeCrossDissolve,
    /** 上下翻页效果 */
    btnTypePartialCurl,
    /** 自定义翻页效果 */
    btnTypeCustom
} btnType;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加按钮,实现自动布局
    self.view.backgroundColor = [UIColor grayColor];
    
    //添加按钮
    //自下而上
    UIButton *coverVerticalBtn = [self addBtnWithTitle:@"自下而上" buttonType:btnTypeCoverVertical];
    [self.view addSubview:coverVerticalBtn];
    
    //中心翻转效果
    UIButton *flipHorizontalBtn = [self addBtnWithTitle:@"中心翻转"  buttonType:btnTypeFlipHorizontal];
    [self.view addSubview:flipHorizontalBtn];
    
    //淡出效果
    UIButton *crossDissolveBtn = [self addBtnWithTitle:@"淡出效果"  buttonType:btnTypeCrossDissolve];
    [self.view addSubview:crossDissolveBtn];
    
    //上下翻页效果
    UIButton *partialCurlBtn = [self addBtnWithTitle:@"上下翻页"  buttonType:btnTypePartialCurl];
    [self.view addSubview:partialCurlBtn];
    
    //自定义翻页效果
    UIButton *customBtn = [self addBtnWithTitle:@"自定义左右翻页"  buttonType:btnTypeCustom];
    [self.view addSubview:customBtn];

    
    //禁止autoresizing功能
    coverVerticalBtn.translatesAutoresizingMaskIntoConstraints = NO;
    flipHorizontalBtn.translatesAutoresizingMaskIntoConstraints = NO;
    crossDissolveBtn.translatesAutoresizingMaskIntoConstraints = NO;
    partialCurlBtn.translatesAutoresizingMaskIntoConstraints = NO;
    customBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    //自动布局
    // 设置蓝色coverVerticalBtn距离左边和右边有130的的间距  X 和 宽度
    NSString *btnW = @"H:|-130-[coverVerticalBtn]-130-|";
    NSArray *btnWs = [NSLayoutConstraint constraintsWithVisualFormat:btnW options:0 metrics:nil views:@{@"coverVerticalBtn":coverVerticalBtn}];
    [self.view addConstraints:btnWs];
    //设置竖直方向的位置
    // 设置按钮距离顶部有50的间距, 并且高度等于50   Y 和高度
    // 设置其他按钮距离第一个按钮底部有20的间距, 并且其他的高度等于第一个的高度 Y 和高度
    //(只有设定其他按钮与第一个按钮的左右对齐后才能确定器x和宽度)
    // 并且设置按钮右对齐NSLayoutFormatAlignAllRight
    NSArray *btnHRs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[coverVerticalBtn(40)]-20-[flipHorizontalBtn(==coverVerticalBtn)]-20-[crossDissolveBtn(==coverVerticalBtn)]-20-[partialCurlBtn(==coverVerticalBtn)]-20-[customBtn(==coverVerticalBtn)]" options:NSLayoutFormatAlignAllRight metrics:nil views:@{@"coverVerticalBtn":coverVerticalBtn, @"flipHorizontalBtn":flipHorizontalBtn, @"crossDissolveBtn":crossDissolveBtn, @"partialCurlBtn":partialCurlBtn, @"customBtn":customBtn}];
    
    [self.view addConstraints:btnHRs];
    
    // 并且设置按钮左对齐NSLayoutFormatAlignAllLeft
    NSArray *btnHLs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[coverVerticalBtn(40)]-20-[flipHorizontalBtn(==coverVerticalBtn)]-20-[crossDissolveBtn(==coverVerticalBtn)]-20-[partialCurlBtn(==coverVerticalBtn)]-20-[customBtn(==coverVerticalBtn)]" options:NSLayoutFormatAlignAllLeft metrics:nil views:@{@"coverVerticalBtn":coverVerticalBtn, @"flipHorizontalBtn":flipHorizontalBtn, @"crossDissolveBtn":crossDissolveBtn, @"partialCurlBtn":partialCurlBtn, @"customBtn":customBtn}];
    
    [self.view addConstraints:btnHLs];

}

//重构代码
- (UIButton *)addBtnWithTitle:(NSString *)title buttonType:(btnType)type{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    btn.tag = type;
    
    [btn setBackgroundColor:[UIColor blueColor]];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

//实现按钮点击事件
/*
 UIModalTransitionStyleCoverVertical 默认效果:自下而上
 UIModalTransitionStyleFlipHorizontal 翻转效果
 UIModalTransitionStyleCrossDissolve 淡出效果
 UIModalTransitionStylePartialCurl 上下翻页效果
 */

- (void)btnClick:(UIButton *)btn{
    FirstViewController *firstVc = [[FirstViewController alloc] init];
    
    firstVc.name = btn.titleLabel.text;
    
    switch (btn.tag) {
        case btnTypeCoverVertical:
            firstVc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            break;
        case btnTypeFlipHorizontal:
            firstVc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            break;
        case btnTypeCrossDissolve:
            firstVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            break;
        case btnTypePartialCurl:
            firstVc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
            break;
        case btnTypeCustom:{
            //设置展示样式(自定义)
            firstVc.modalPresentationStyle = UIModalPresentationCustom;
            //设置代理(设置UIPresentationController)（为实现UIViewControllerTransitioningDelegate协议的类）
            firstVc.transitioningDelegate = [TransitionDelegate sharedTransition];
            
            break;
        }
        
        default:
            break;
    }
    
    [self presentViewController:firstVc animated:YES completion:nil];
}


@end
