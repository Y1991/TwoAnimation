//
//  CALayer+anchorPoint.h
//  动画CATransform3D
//
//  Created by Guangquan Yu on 2017/8/23.
//  Copyright © 2017年 Guangquan Yu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (anchorPoint)
/**
 * 设置anchorPoint
 *
 * anchorPoint和position改变了, frame没有变化
 *
 * 在对图像进行变换时，都是按照positon点来进行缩放，偏移等操作的====>如旋转x时position的值为(207.000000 ,368.000000)时，就是以x = 207为轴线进行旋转
 *
 * point中的值范围为 0~1
 *
 */
- (void)setAnchorPointTo:(CGPoint)point;
@end
