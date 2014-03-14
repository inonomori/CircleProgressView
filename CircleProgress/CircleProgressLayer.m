//
//  lineLayer.m
//  drawLine
//
//  Created by zhefu wang on 3/13/14.
//  Copyright (c) 2014 zhefu wang. All rights reserved.
//

#import "CircleProgressLayer.h"

@implementation CircleProgressLayer

@synthesize angle = _angle;

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.contentsScale = [[UIScreen mainScreen] scale];
        self.angle = 0;
    }
    return self;
}

- (instancetype)initWithLayer:(id)layer
{
    if(self = [super initWithLayer:layer])
    {
        if([layer isKindOfClass:[CircleProgressLayer class]])
        {
            // This bit is required for when we CA is interpolating the values.
            CircleProgressLayer *other = (CircleProgressLayer*)layer;
            self.contentsScale = other.contentsScale;
            self.angle = other.angle;
        }
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"angle"]) {
        return YES;
    }
    else if ([key isEqualToString:@"ratio"])
        return YES;
    return [super needsDisplayForKey:key];
}

- (void)setAngle:(NSInteger)angle
{
    _angle = angle;
    [self setNeedsDisplay];
}

- (void)setRatio:(CGFloat)ratio
{
    _ratio = ratio;
    [self setNeedsDisplay];
}

- (void)drawInContext:(CGContextRef)ctx
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat length = sqrtf((width/2)*(width/2)+(height/2)*(height/2));
    length = length*self.ratio;
    CGRect circleFrame = CGRectMake(-(length-width/2), -(length-height/2), 2*length, 2*length);
    
    CGContextAddRect(ctx, CGRectMake(0, 0, width, height));
    CGContextAddEllipseInRect(ctx, CGRectMake(circleFrame.origin.x, circleFrame.origin.y, circleFrame.size.width, circleFrame.size.height));
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5].CGColor);
    CGContextEOFillPath(ctx);
    
    
    CGPoint midPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    
    CGContextMoveToPoint(ctx, midPoint.x,midPoint.y);
    CGContextAddLineToPoint(ctx, midPoint.x, midPoint.y-length);
    CGContextAddArc(ctx, midPoint.x, midPoint.y, length-3, 270*M_PI/180, (self.angle-90)*M_PI/180, 1);
    CGContextClosePath(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5].CGColor);
    CGContextFillPath(ctx);
}

@end