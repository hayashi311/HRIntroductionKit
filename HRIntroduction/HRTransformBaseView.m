//
//  HRTransformBaseView.m
//  HRIntroduction
//
//  Created by hayashi311 on 4/13/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import "HRTransformBaseView.h"

@interface HRTransformBaseView(){
    CGAffineTransform _transformForHidden;
    CGAffineTransform _transformForVisible;
}

@end

@implementation HRTransformBaseView
@synthesize transformForHidden = _transformForHidden;

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.transformForHidden       = CGAffineTransformIdentity;
    }
    return self;
}

- (void)addSubview:(UIView *)view
{
    [super addSubview:view];
}

- (void)statusDidChanged:(float)progress
{
    self.alpha = 1.0 - ABS(progress);
    CGAffineTransform th = self.transformForHidden;
    float a = progress;
    float b = 1.0-progress;
    CGAffineTransform tid = CGAffineTransformIdentity;
    
    // TODO: もっと簡単に書ける気がする
    self.transform = CGAffineTransformMake((th.a*a+tid.a*b) ,
                                           (th.b*a+tid.b*b),
                                           (th.c*a+tid.c*b),
                                           (th.d*a+tid.d*b),
                                           (th.tx*a+tid.tx*b),
                                           (th.ty*a+tid.ty*b));
}

- (void)setTransformForHidden:(CGAffineTransform)transformForHidden
{
    _transformForHidden = transformForHidden;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _transformForVisible = self.transform;
}

@end
