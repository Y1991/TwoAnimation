//
//  FlyingAngelView.m
//  TestImage
//
//  Created by GuangquanYu on 5/1/18.
//  Copyright © 2018年 ZHM.YU. All rights reserved.
//

#import "FlyingAngelView.h"
#import "CALayer+anchorPoint.h"
#import "CALayer+RotatingAnimation.h"
@implementation FlyingAngelView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *resourcePath = [bundle resourcePath];
        
        NSString *tianshi_filePath = [resourcePath stringByAppendingPathComponent:@"tianshi2.png"];
        NSString *chibang_filePath = [resourcePath stringByAppendingPathComponent:@"chibang.png"];

        UIImage *tianshi_image = [UIImage imageWithContentsOfFile:tianshi_filePath];
        UIImage *chibang_image = [UIImage imageWithContentsOfFile:chibang_filePath];
        
        CGFloat tianshi_width = 120;
        
        // 天使
        //---------------------------------------{
        CALayer * centerLayer = [self createLayer:tianshi_image width:tianshi_width offout:CGPointMake(0, 0) imageContentsRect:CGRectMake(0, 0, 1.0, 1.0)];
        //---------------------------------------}
        
        
        
        // 左边的翅膀
        //---------------------------------------{
        CALayer * leftLayer = [self createLayer:chibang_image width:150 offout:CGPointMake(-80, -50) imageContentsRect:CGRectMake(0, 0, 1.0/2.0, 1.0)];
        [leftLayer setAnchorPointTo:CGPointMake(1, 0.75)];
        [leftLayer rotatingWithDuration:0.8 repeatCount:0 fromValue:[NSNumber numberWithFloat:-M_2_PI] toValue:[NSNumber numberWithFloat:M_1_PI/2.0] animationKey:@"Let me shake left" animationWithKeyPath:@"transform.rotation.z" autoreverses:YES];
        [self.layer insertSublayer:leftLayer below:centerLayer];
        //---------------------------------------}
        
        
        // 右边的翅膀
        //---------------------------------------{
        CALayer * rightLayer = [self createLayer:chibang_image width:150 offout:CGPointMake(80, -50) imageContentsRect:CGRectMake(1.0/2.0, 0, 1.0/2.0, 1.0)];
        [rightLayer setAnchorPointTo:CGPointMake(0, 0.75)];
        [rightLayer rotatingWithDuration:0.8 repeatCount:0 fromValue:[NSNumber numberWithFloat:M_2_PI] toValue:[NSNumber numberWithFloat:-M_1_PI/2.0] animationKey:@"Let me shake right" animationWithKeyPath:@"transform.rotation.z" autoreverses:YES];
        [self.layer insertSublayer:rightLayer below:centerLayer];
        //---------------------------------------}
    }
    
    return self;
    
}
- (CALayer *)createLayer:(UIImage *)image width:(CGFloat)width offout:(CGPoint)point imageContentsRect:(CGRect)imageContentsRect{
    CGSize image_size = image.size;
    UIImage * scaleImage = [self.class scaleImage:image toScale:width/image_size.width];
    CALayer *layer = [[CALayer alloc] init];
    CGFloat height = image_size.height/image_size.width*width;
//    layer.frame = CGRectMake((self.frame.size.width-width)/2.0+point.x , (self.frame.size.height-height)/2.0+point.y , width, height);
    layer.bounds = CGRectMake(0, 0, width, height);  //起点必须是（0，0）
    layer.position = CGPointMake((self.frame.size.width-width)/2.0+point.x     +width/2.0,
                                 (self.frame.size.height-height)/2.0+point.y   +height/2.0);
    layer.contents = (__bridge id _Nullable)(scaleImage.CGImage);
    layer.contentsRect = imageContentsRect;
    [self.layer addSublayer:layer];
    return layer;
}

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
