//
//  CALayer+RotatingAnimation.h
//  TestImage
//
//  Created by GuangquanYu on 5/1/18.
//  Copyright © 2018年 ZHM.YU. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (RotatingAnimation)
//启动摇动动画
- (void)rotatingWithDuration:(NSTimeInterval)durtation repeatCount:(NSUInteger)count fromValue:(NSNumber *)fromValue toValue:(NSNumber *)toValue animationKey:(NSString *)animationKey animationWithKeyPath:(NSString *)animationWithKeyPath autoreverses:(BOOL)autoreverses;

//停止摇动
- (void)stopRotatingWithAnimationKey:(NSString *)animationKey;
@end
