//
//  circleProgressView.m
//  drawLine
//
//  Created by zhefu wang on 3/13/14.
//  Copyright (c) 2014 zhefu wang. All rights reserved.
//

#import "CircleProgressView.h"

@implementation CircleProgressView

@synthesize angle = _angle;

- (void)setAngle:(NSInteger)angle
{
    if (angle > 360)
        _angle = 360.0f;
    else if (angle < 0)
        _angle = 0;
    else
        _angle = angle;
    
    self.circleLayer.angle = _angle;
    [self setNeedsDisplay];
    
    if (360 - angle < FLT_EPSILON)
    {
        // Now animate the changes to the length property
        CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"ratio"];
        anim.duration = 0.1; // Change should table about 5 mins.
        anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        anim.fromValue = [NSNumber numberWithFloat:0.2f];
        anim.toValue = [NSNumber numberWithFloat:0.15f];
        anim.beginTime = 0;
        
        CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"ratio"];
        anim2.duration = 0.3; // Change should table about 5 mins.
        anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        anim2.fromValue = [NSNumber numberWithFloat:0.2f];
        anim2.toValue = [NSNumber numberWithFloat:1.0f];
        anim2.beginTime = 0.1;
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.duration = 0.4;
        group.fillMode = kCAFillModeRemoved;
        group.removedOnCompletion = YES;
        group.animations = @[anim,anim2];
        
        [self.circleLayer addAnimation:group forKey:@"animateRatio"];
        self.circleLayer.ratio = 1.0f;
    }
}

- (void)awakeFromNib
{
    self.circleLayer = [CircleProgressLayer new];
    self.circleLayer.frame = self.bounds;
    self.circleLayer.angle = 0;
    self.circleLayer.ratio = 0.2;
    [self.layer addSublayer:self.circleLayer];
    [self.circleLayer setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.circleLayer = [CircleProgressLayer new];
        self.circleLayer.frame = self.bounds;
        self.circleLayer.angle = 0;
        self.circleLayer.ratio = 0.2;
        [self.layer addSublayer:self.circleLayer];
        [self.circleLayer setNeedsDisplay];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
