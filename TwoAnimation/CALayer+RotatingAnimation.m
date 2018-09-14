//
//  CALayer+RotatingAnimation.m
//  TestImage
//
//  Created by GuangquanYu on 5/1/18.
//  Copyright © 2018年 ZHM.YU. All rights reserved.
//

#import "CALayer+RotatingAnimation.h"

@implementation CALayer (RotatingAnimation)
//启动摇动动画
- (void)rotatingWithDuration:(NSTimeInterval)durtation repeatCount:(NSUInteger)count fromValue:(NSNumber *)fromValue toValue:(NSNumber *)toValue animationKey:(NSString *)animationKey animationWithKeyPath:(NSString *)animationWithKeyPath autoreverses:(BOOL)autoreverses
{
    //添加摇动动画
    CABasicAnimation * shakeAnimation = [CABasicAnimation animationWithKeyPath:animationWithKeyPath];//@"transform.rotation.z"
    //创建一个动画，修改旋转
    
    //设置时间
    shakeAnimation.duration = durtation;
    
    //设置摇摆幅度 NSNumber
    shakeAnimation.fromValue = fromValue;
    shakeAnimation.toValue = toValue;
    
    //设置自动倒带
    shakeAnimation.autoreverses = autoreverses;
    
    //设置完成后自动移除动画
    shakeAnimation.removedOnCompletion = YES;
    
    //设置摇摆次数
    if (count != 0)
        shakeAnimation.repeatCount = count;
    else
        shakeAnimation.repeatCount = FLT_MAX;
    
    
    //添加给视图 layer用于设置动画，修改视图圆角等。
    [self addAnimation:shakeAnimation forKey:animationKey];
    //添加后自然启动
}

//停止摇动
- (void)stopRotatingWithAnimationKey:(NSString *)animationKey
{
    //删除动画，动画停止
    [self removeAnimationForKey:animationKey];
}
@end
