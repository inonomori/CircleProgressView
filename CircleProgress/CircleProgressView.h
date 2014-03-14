//
//  circleProgressView.h
//  drawLine
//
//  Created by zhefu wang on 3/13/14.
//  Copyright (c) 2014 zhefu wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleProgressLayer.h"

@interface CircleProgressView : UIView

@property (nonatomic) NSInteger angle;
@property (nonatomic, strong) CircleProgressLayer *circleLayer;

@end
