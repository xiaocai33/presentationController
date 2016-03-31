//
//  ViewController.m
//  modalTransitionStyleAndVFL
//
//  Created by 小蔡 on 16/3/31.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加按钮,实现自动布局
    self.view.backgroundColor = [UIColor grayColor];
    
    //添加按钮
    //自下而上
    UIButton *coverVerticalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [coverVerticalBtn addTarget:self action:@selector(coverVerticalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [coverVerticalBtn setTitle:@"自下而上" forState:UIControlStateNormal];
    [coverVerticalBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:coverVerticalBtn];
    
    //中心翻转效果
    UIButton *flipHorizontalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [flipHorizontalBtn addTarget:self action:@selector(flipHorizontalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [flipHorizontalBtn setTitle:@"中心翻转" forState:UIControlStateNormal];
    [flipHorizontalBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:flipHorizontalBtn];
    
    //淡出效果
    UIButton *crossDissolveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [crossDissolveBtn addTarget:self action:@selector(crossDissolveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [crossDissolveBtn setTitle:@"淡出效果" forState:UIControlStateNormal];
    [crossDissolveBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:crossDissolveBtn];
    
    //上下翻页效果
    UIButton *partialCurlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [partialCurlBtn addTarget:self action:@selector(partialCurlBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [partialCurlBtn setTitle:@"上下翻页" forState:UIControlStateNormal];
    [partialCurlBtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:partialCurlBtn];
    
    //禁止autoresizing功能
    coverVerticalBtn.translatesAutoresizingMaskIntoConstraints = NO;
    flipHorizontalBtn.translatesAutoresizingMaskIntoConstraints = NO;
    crossDissolveBtn.translatesAutoresizingMaskIntoConstraints = NO;
    partialCurlBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    
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
    NSArray *btnHRs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[coverVerticalBtn(40)]-20-[flipHorizontalBtn(==coverVerticalBtn)]-20-[crossDissolveBtn(==coverVerticalBtn)]-20-[partialCurlBtn(==coverVerticalBtn)]" options:NSLayoutFormatAlignAllRight metrics:nil views:@{@"coverVerticalBtn":coverVerticalBtn, @"flipHorizontalBtn":flipHorizontalBtn, @"crossDissolveBtn":crossDissolveBtn, @"partialCurlBtn":partialCurlBtn}];
    
    [self.view addConstraints:btnHRs];
    
    // 并且设置按钮左对齐NSLayoutFormatAlignAllLeft
    NSArray *btnHLs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[coverVerticalBtn(40)]-20-[flipHorizontalBtn(==coverVerticalBtn)]-20-[crossDissolveBtn(==coverVerticalBtn)]-20-[partialCurlBtn(==coverVerticalBtn)]" options:NSLayoutFormatAlignAllLeft metrics:nil views:@{@"coverVerticalBtn":coverVerticalBtn, @"flipHorizontalBtn":flipHorizontalBtn, @"crossDissolveBtn":crossDissolveBtn, @"partialCurlBtn":partialCurlBtn}];
    
    [self.view addConstraints:btnHLs];

}

//实现按钮点击事件
/*
 UIModalTransitionStyleCoverVertical 默认效果:自下而上
 UIModalTransitionStyleFlipHorizontal 翻转效果
 UIModalTransitionStyleCrossDissolve 淡出效果
 UIModalTransitionStylePartialCurl 上下翻页效果
 */

- (void)coverVerticalBtnClick:(UIButton *)btn{
    FirstViewController *firstVc = [[FirstViewController alloc] init];
    
    firstVc.name = btn.titleLabel.text;
    
    [self presentViewController:firstVc animated:YES completion:nil];
    
}

- (void)flipHorizontalBtnClick:(UIButton *)btn{
    FirstViewController *firstVc = [[FirstViewController alloc] init];
    
    firstVc.name = btn.titleLabel.text;
    
    firstVc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:firstVc animated:YES completion:nil];
    
}

- (void)crossDissolveBtnClick:(UIButton *)btn{
    FirstViewController *firstVc = [[FirstViewController alloc] init];
    
    firstVc.name = btn.titleLabel.text;
    
    firstVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:firstVc animated:YES completion:nil];
    
}

- (void)partialCurlBtnClick:(UIButton *)btn{
    FirstViewController *firstVc = [[FirstViewController alloc] init];
    
    firstVc.name = btn.titleLabel.text;
    
    firstVc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self presentViewController:firstVc animated:YES completion:nil];
    
}




@end
