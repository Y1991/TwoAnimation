//
//  CALayer+anchorPoint.m
//  动画CATransform3D
//
//  Created by Guangquan Yu on 2017/8/23.
//  Copyright © 2017年 Guangquan Yu. All rights reserved.
//

#import "CALayer+anchorPoint.h"

@implementation CALayer (anchorPoint)
- (void)setAnchorPointTo:(CGPoint)point{//下面两个方法的顺序不能改变
    
// 将frame 替换为 bounds  【未测】
//    self.frame = CGRectOffset(self.frame, (point.x - self.anchorPoint.x) * self.frame.size.width, (point.y - self.anchorPoint.y) * self.frame.size.height);
//    self.bounds = CGRectOffset(self.bounds, (point.x - self.anchorPoint.x) * self.bounds.size.width, (point.y - self.anchorPoint.y) * self.bounds.size.height);
    
    self.position = CGPointMake(self.position.x + (point.x - self.anchorPoint.x) * self.bounds.size.width, self.position.y + (point.y - self.anchorPoint.y) * self.bounds.size.height);
    self.anchorPoint = point;

    
}

@end
