//
//  HRDefaultBackgroundView.m
//  HRIntroduction
//
//  Created by hayashi311 on 4/13/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import "HRDefaultBackgroundView.h"
#import "HRDefaultGradientView.h"

@interface HRDefaultBackgroundView ()
{
    UIImageView*           _backgroundImageView;
    HRDefaultGradientView* _gradientView;
}

@end

@implementation HRDefaultBackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _gradientView = [[HRDefaultGradientView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self statusDidChanged:0.0];
        [self addSubview:_gradientView];
    }
    return self;
}

- (UIImage*)backgroundImage
{
    return _backgroundImageView.image;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
        [self insertSubview:_backgroundImageView atIndex:0];
    }else{
        _backgroundImageView.image = backgroundImage;
    }
}

- (void)layoutSubviews
{
    if (self.superview){
        CGRect frame = self.frame;
        frame.origin = CGPointZero;
        frame.size = self.superview.frame.size;
        self.frame = frame;
    }
    _gradientView.frame = self.frame;
    [_gradientView setNeedsDisplay];
}

- (void)statusDidChanged:(float)progress
{
    _gradientView.alpha = MIN(progress, 1.0);
}

@end
