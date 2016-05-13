//
//  ZLYBasicAnimationController.m
//  CALayer
//
//  Created by ZLY on 16/5/13.
//  Copyright © 2016年 ZLY. All rights reserved.
//

#import "ZLYBasicAnimationController.h"

@interface ZLYBasicAnimationController ()

@end

@implementation ZLYBasicAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self basicAnimation];
//    [self baseSpringAnimation];
//    [self baseScaleAnimation];
    [self baseRotationAnimation];
    // Do any additional setup after loading the view.
}
-(void)basicAnimation
{
    UIView * animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    animationView.layer.borderWidth = 10;
    animationView.layer.borderColor = [UIColor orangeColor].CGColor;
    animationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:animationView];
    
    
    //添加动画
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    //动画的开始位置
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    //动画的结束位置
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width - 50,
                                                              self.view.bounds.size.height - 100)];
    //线性动画
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    animation.removedOnCompletion = NO;
    //设置动画持续时间
    animation.duration = 2.5;
    
    // 播放速率，默认为1，表示常速
    // 设置为2则以2倍的速度播放，同样设置为N则以N倍速度播放
    // 如果值小于1，自然就是慢放
    animation.speed = 0.5;
    
    // 开始播放动画的时间，默认为0.0，通常是在组合动画中使用
    animation.beginTime = 0.0;
    
    // 播放动画的次数，默认为0，表示只播放一次
    // 设置为3表示播放3次
    // 设置为HUGE_VALF表示无限动画次数
    animation.repeatCount = HUGE_VALF;
    
    // 默认为NO，设置为YES后，在动画达到toValue点时，就会以动画由toValue返回到fromValue点。
    // 如果不设置或设置为NO，在动画到达toValue时，就会突然马上返回到fromValue点
    animation.autoreverses = YES;
    
    // 当autoreverses设置为NO时，最终会留在toValue处
    animation.fillMode = kCAFillModeForwards;
    // 将动画添加到层中
    [animationView.layer addAnimation:animation forKey:@"position"];
    
}
// 闪烁动画
- (void)baseSpringAnimation {
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    springView.center = self.view.center;
    [self.view addSubview:springView];
    springView.layer.borderColor = [UIColor greenColor].CGColor;
    springView.layer.borderWidth = 2;
    springView.backgroundColor = [UIColor redColor];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 2;
    animation.fromValue = @(1);
    animation.toValue = @(0);
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    
    [springView.layer addAnimation:animation forKey:@"opacity"];
}
// 缩放动画
- (void)baseScaleAnimation {
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 120, 50, 50)];
    [self.view addSubview:springView];
    springView.layer.borderColor = [UIColor greenColor].CGColor;
    springView.layer.borderWidth = 2;
    springView.backgroundColor = [UIColor redColor];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 2;
    animation.fromValue = @(1);
    animation.toValue = @(0);
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    
    [springView.layer addAnimation:animation forKey:@"transform.scale"];
}
// 旋转动画
- (void)baseRotationAnimation {
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 240, 50, 50)];
    [self.view addSubview:springView];
    springView.layer.borderColor = [UIColor greenColor].CGColor;
    springView.layer.borderWidth = 2;
    springView.backgroundColor = [UIColor redColor];
    //用例3 scale+rotate+position
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D rotateTransform = CATransform3DMakeRotation(1.57, 0, 0, -1);
    CATransform3D scaleTransform = CATransform3DMakeScale(5, 5, 5);
    CATransform3D positionTransform = CATransform3DMakeTranslation(0, 0, 0); //位置移动
    CATransform3D combinedTransform = CATransform3DConcat(rotateTransform, scaleTransform); //Concat就是combine的意思
    combinedTransform = CATransform3DConcat(combinedTransform, positionTransform); //再combine一次把三个动作连起来
    
    [anim setFromValue:[NSValue valueWithCATransform3D:CATransform3DIdentity]]; //放在3D坐标系中最正的位置
    [anim setToValue:[NSValue valueWithCATransform3D:combinedTransform]];
    [anim setDuration:5.0f];
    
    [springView.layer addAnimation:anim forKey:nil];
    
    [springView.layer setTransform:combinedTransform];
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    animation.duration = 2;
//    
//    // Z轴旋转180度
//    CATransform3D transform3d = CATransform3DMakeRotation(M_PI, 0, 0, 180);
//    animation.toValue = [NSValue valueWithCATransform3D:transform3d];
//    
//    animation.cumulative = YES;
//    animation.removedOnCompletion = NO;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.repeatCount = HUGE_VALF;
//    animation.autoreverses = YES;
//    animation.fillMode = kCAFillModeForwards;
//    
//    [springView.layer addAnimation:animation forKey:@"transform"];
}
// 平移动画
- (void)baseTranslationAnimation {
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 380, 50, 50)];
    [self.view addSubview:springView];
    springView.layer.borderColor = [UIColor greenColor].CGColor;
    springView.layer.borderWidth = 2;
    springView.backgroundColor = [UIColor redColor];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    animation.duration = 2;
    
    // Z轴旋转180度
    CGFloat width = self.view.frame.size.width;
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(width - 50, 0)];
    
    animation.cumulative = YES;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    
    [springView.layer addAnimation:animation forKey:@"transform.translation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
