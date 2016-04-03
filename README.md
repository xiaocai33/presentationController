UIPresentationController自定义转场动画实现

modal转场动画:

1.实现系统自带model控制器的动画效果(按钮布局为使用VFL语言实现自动布局)

  UIModalTransitionStyleCoverVertical: 默认效果:自下而上
 
  UIModalTransitionStyleFlipHorizontal: 翻转效果
 
  UIModalTransitionStyleCrossDissolve: 淡出效果
 
  UIModalTransitionStylePartialCurl: 上下翻页效果

 2.实现自定义翻页动画效果
 
  可以在AnimatedTransitioning.m类中,修改- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext方法中的动画效果即可完成相应的动画
![image](https://github.com/xiaocai/presentationController/raw/master/image/presentation.gif)
