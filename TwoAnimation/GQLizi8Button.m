//
//  GQLizi8Button.m
//  系统的动画
//
//  Created by GuangquanYu on 31/5/18.
//  Copyright © 2018年 ygq. All rights reserved.
//

#import "GQLizi8Button.h"

@interface GQLizi8Button ()

@property (strong, nonatomic) CAEmitterLayer *explosionLayer;
@property (strong, nonatomic) CAEmitterLayer *explosion2Layer;

@end

@implementation GQLizi8Button

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self animation];
}


- (void)setup {
    
    // ------------- cell 1
    CAEmitterCell *explosionCell = [CAEmitterCell emitterCell];
    explosionCell.name           = @"explosion";
    explosionCell.contents       = (id)[UIImage imageNamed:@"DazRing.png"].CGImage;
    explosionCell.birthRate      = 0;
    explosionCell.color            = [[UIColor colorWithRed:240/255.f green:0 blue:120/255.f alpha:1] CGColor];
    // 存在时间
    explosionCell.lifetime       = 1.4;
    explosionCell.lifetimeRange  = 0.3;
    
    // 速度变化
    explosionCell.velocity       = 80.00;
    explosionCell.velocityRange  = 10.00;
    explosionCell.xAcceleration = -5;
    //粒子y方向的加速度分量
    explosionCell.yAcceleration = -10;
//    // 粒子在xy平面的发射角度
//    explosionCell.emissionLongitude = M_PI_4;;
//    // 粒子发射角度的容差
    explosionCell.emissionRange = M_PI_4;
    
    // 透明度变化
    explosionCell.alphaRange     = 0.10;
    explosionCell.alphaSpeed     = -0.3; // 速度降低
    // 缩放变化
    explosionCell.scale          = 0.35;
    explosionCell.scaleSpeed    = -0.2;
    explosionCell.scaleRange     = 0.06;
    
    
    
    // ------------- 发射器
    _explosionLayer               = [CAEmitterLayer layer];
    _explosionLayer.masksToBounds = NO;
    _explosionLayer.name          = @"emitterLayer";
    _explosionLayer.emitterCells  = @[explosionCell];
    
    // 发射形状
    _explosionLayer.emitterShape  = kCAEmitterLayerRectangle;
    _explosionLayer.emitterMode   = kCAEmitterLayerOutline;
    _explosionLayer.renderMode    = kCAEmitterLayerOldestFirst;
    // 发射位置
    _explosionLayer.position      = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    _explosionLayer.zPosition     = -1;
    _explosionLayer.emitterSize   = CGSizeMake(self.frame.size.width, self.frame.size.height);

    [self.layer addSublayer:_explosionLayer];
    
    
    // ------------- cell 2
    CAEmitterCell *explosion2Cell = [CAEmitterCell emitterCell];
    explosion2Cell.name           = @"explosion2";
    explosion2Cell.contents       = (id)[UIImage imageNamed:@"star.png"].CGImage;
    explosion2Cell.color            = [[UIColor colorWithRed:240/255.f green:0 blue:120/255.f alpha:1] CGColor];
    explosion2Cell.birthRate      = 0;
    // 存在时间
    explosion2Cell.lifetime       = 1.1;
    explosion2Cell.lifetimeRange  = 0.2;
    
    // 速度变化
    explosion2Cell.velocity       = 60.00;
    explosion2Cell.velocityRange  = 8.00;
    explosion2Cell.xAcceleration = -9;
    //粒子y方向的加速度分量
    explosion2Cell.yAcceleration = -25;
    // 粒子发射角度的容差
    explosion2Cell.emissionRange = M_PI_4*1.5;
    
    // 透明度变化
    explosion2Cell.alphaRange     = 0.10;
    explosion2Cell.alphaSpeed     = -0.1; // 速度降低
    // 缩放变化
    explosion2Cell.scale          = 0.40;
    explosion2Cell.scaleSpeed    =  0.2;
    explosion2Cell.scaleRange     = 0.06;
    
    // ------------- 发射器2
    _explosion2Layer               = [CAEmitterLayer layer];
    _explosion2Layer.masksToBounds = NO;
    _explosion2Layer.name          = @"emitterLayer2";
    _explosion2Layer.emitterCells  = @[ explosion2Cell];
    
    // 发射形状
    _explosion2Layer.emitterShape  = kCAEmitterLayerCuboid;
    _explosion2Layer.emitterMode   = kCAEmitterLayerOutline;
    _explosion2Layer.renderMode    = kCAEmitterLayerOldestFirst;
    // 发射位置
    _explosion2Layer.position      = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
    _explosion2Layer.zPosition     = -1;
    _explosion2Layer.emitterSize   = CGSizeMake(self.frame.size.width, self.frame.size.height);
    
    [self.layer addSublayer:_explosion2Layer];
}

/**
 *  开始动画
 */
- (void)animation {
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    if (self.selected) {
//        animation.values = @[@1.5 ,@0.8, @1.0,@1.2,@1.0];
//        animation.duration = 0.5;
        [self startAnimate];
    }
//        else
//    {
//        animation.values = @[@0.8, @1.0];
//        animation.duration = 0.4;
//    }
//    animation.calculationMode = kCAAnimationCubic;
//    [self.layer addAnimation:animation forKey:@"transform.scale"];
}

/**
 *  开始喷射
 */
- (void)startAnimate {
    [self explode];
}

/**
 *  大量喷射
 */
- (void)explode {
    
    //explosionLayer开始时间
    self.explosionLayer.beginTime = CACurrentMediaTime();
    self.explosion2Layer.beginTime = CACurrentMediaTime();
    //explosionLayer每秒喷射的2500个
    [self.explosionLayer setValue:@130 forKeyPath:@"emitterCells.explosion.birthRate"];
    [self.explosion2Layer setValue:@90 forKeyPath:@"emitterCells.explosion2.birthRate"];
    //停止喷射
    [self performSelector:@selector(stop) withObject:nil afterDelay:0.1];
    [self performSelector:@selector(stop2) withObject:nil afterDelay:0.1];
}

/**
 *  停止喷射
 */
- (void)stop {

    //explosionLayer每秒喷射的0个
    [self.explosionLayer setValue:@0 forKeyPath:@"emitterCells.explosion.birthRate"];

}
- (void)stop2 {

    [self.explosion2Layer setValue:@0 forKeyPath:@"emitterCells.explosion2.birthRate"];
}

@end
