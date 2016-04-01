//
//  FirstViewController.m
//  01-自定义UIPresentationController
//
//  Created by 小蔡 on 16/3/31.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (nonatomic, weak) UILabel *label;
@end

@implementation FirstViewController

- (UILabel *)label{
    if (_label == nil) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor blueColor];
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        _label = label;

    }
    return _label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    
    //添加背景图片
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"3.jpg"];
    [self.view addSubview:imageV];
    
    imageV.translatesAutoresizingMaskIntoConstraints = NO;
    
    //自动布局
    //X 和 宽度
    NSArray *imageXW = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageV]-0-|" options:0 metrics:nil views:@{@"imageV":imageV}];
    [self.view addConstraints:imageXW];
    
    //Y 和 高度
    NSArray *imageYH = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageV]-0-|" options:0 metrics:nil views:@{@"imageV":imageV}];
    [self.view addConstraints:imageYH];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setName:(NSString *)name{
    
    _name = name;
    
    //自动布局
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    //设置水平位置(x 和 宽度)
    NSArray *labelXW = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[label]-100-|" options:0 metrics:nil views:@{@"label":self.label}];
    [self.view addConstraints:labelXW];
    
    //设置竖直位置(y 和 高度)
    NSArray *labelYH = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[label(100)]" options:0 metrics:nil views:@{@"label":self.label}];
    [self.view addConstraints:labelYH];
    
    
    self.label.text = name;
    
}


@end
