//
//  ZLYMoveCircleLayerController.m
//  CALayer
//
//  Created by ZLY on 16/5/13.
//  Copyright © 2016年 ZLY. All rights reserved.
//

#import "ZLYMoveCircleLayerController.h"

#define circleLayerWidth 45
@interface ZLYMoveCircleLayerController ()
@property (nonatomic, strong) CALayer *circleLayer;
@end

@implementation ZLYMoveCircleLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.circleLayer = [CALayer layer];
    self.circleLayer.bounds = CGRectMake(0, 0, circleLayerWidth, circleLayerWidth);//指定圆的大小
    self.circleLayer.position = self.view.center;//指定圆的中心点
    self.circleLayer.cornerRadius = circleLayerWidth/2;
    self.circleLayer.backgroundColor = [UIColor orangeColor].CGColor;//设置圆的背景颜色
    self.circleLayer.shadowColor = [UIColor grayColor].CGColor;//设置阴影
    self.circleLayer.shadowOffset = CGSizeMake(3, 3);
    self.circleLayer.opacity = 0.8;//设置圆的透明度
    
    [self.view.layer addSublayer:self.circleLayer];
    
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGFloat width = circleLayerWidth;
    if (self.circleLayer.bounds.size.width <= circleLayerWidth) {
        width = circleLayerWidth* 1.5;
    }
    //修改圆的大小
    self.circleLayer.bounds = CGRectMake(0, 0, width, width);
    //将中心位置移动到点击位置
    self.circleLayer.position = [[touches anyObject] locationInView:self.view];
    //修改为圆形
    self.circleLayer.cornerRadius = width/2;
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
