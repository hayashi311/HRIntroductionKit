//
//  HRSampleIntoroductionViewController.m
//  HRIntroduction
//
//  Created by hayashi311 on 4/14/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import "HRSampleIntoroductionViewController.h"
#import "HRIntroductionViewController.h"
#import "HRDefaultPanel.h"
#import "HRDefaultBackgroundView.h"
#import "HRTransformBaseView.h"
#import "HRProgressAdjust.h"

@interface HRSampleIntoroductionViewController ()<HRProgressRecever>{
    UIPageControl* _pageControl;
}

@end

@implementation HRSampleIntoroductionViewController

- (void)loadView
{
    [super loadView];
    
    HRDefaultBackgroundView* backgroudView;
    backgroudView = [[HRDefaultBackgroundView alloc] initWithFrame:CGRectZero];
    backgroudView.backgroundImage = [UIImage imageNamed:@"background"];
    
    self.backgroudView = backgroudView;
    [self addRecever:backgroudView];
    
    int centering = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    // title panel
    HRDefaultPanel* titlePanel = [[HRDefaultPanel alloc] init];
    UIImageView* titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title"]];
    titleImageView.autoresizingMask = centering;
    titleImageView.center = titlePanel.center;
    [titlePanel addSubview:titleImageView];
    
    // text panel
    HRDefaultPanel* textPanel = [[HRDefaultPanel alloc] init];
    [textPanel setBackgroundColor:[UIColor clearColor]];
    
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 50)];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"夏目漱石";
    titleLabel.font = [UIFont boldSystemFontOfSize:30];
    
    HRTransformBaseView* titleBaseView;
    titleBaseView = [[HRTransformBaseView alloc] initWithFrame:CGRectMake(20,20,
                                                                          titleLabel.frame.size.width,
                                                                          titleLabel.frame.size.height)];
    titleBaseView.transformForHidden = CGAffineTransformMakeTranslation(-100, 0);
    titleBaseView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [titleBaseView addSubview:titleLabel];
    
    [textPanel addSubview:titleBaseView];
    [self addRecever:titleBaseView adjuster:HRProgressAdjust(1.0, 0.5)];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 300)];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    int noLimit = 0;
    label.numberOfLines = noLimit;
    label.text = @"　吾輩は猫である。名前はまだ無い。\n　どこで生れたかとんと見当けんとうがつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪どうあくな種族であったそうだ。";
    
    HRTransformBaseView* transformBaseView;
    transformBaseView = [[HRTransformBaseView alloc] initWithFrame:label.frame];
    transformBaseView = [[HRTransformBaseView alloc] initWithFrame:CGRectMake(20,60,
                                                                              label.frame.size.width,
                                                                              label.frame.size.height)];
    transformBaseView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    transformBaseView.transformForHidden = CGAffineTransformMakeTranslation(-50, 0);
    
    [transformBaseView addSubview:label];
    [self addRecever:transformBaseView adjuster:HRProgressAdjust(1.0, 0.8)];
    
    [textPanel addSubview:transformBaseView];
    
    HRDefaultPanel* panel3 = [[HRDefaultPanel alloc] init];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 284, 66);
    
    // TODO: 表示されない。あれ?
    button.titleLabel.text = @"Button ;)";
    button.titleLabel.textColor = [UIColor darkTextColor];
    
    HRTransformBaseView* transformBaseView2;
    transformBaseView2 = [[HRTransformBaseView alloc] initWithFrame:button.frame];
    transformBaseView2.transformForHidden = CGAffineTransformMakeScale(1.0, 0.0);
    transformBaseView2.autoresizingMask = centering;
    
    [transformBaseView2 addSubview:button];
    transformBaseView2.autoresizingMask = centering;
    
    [panel3 addSubview:transformBaseView2];
    [self addRecever:transformBaseView2 adjuster:HRProgressAdjustAbs(2.0, 0.8)];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, -40, 280, 40)];
    _pageControl.numberOfPages = 3;
    _pageControl.currentPage   = 1;
    _pageControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [_pageControl setUserInteractionEnabled:NO];
    self.frontView = _pageControl;
    
    // TODO: メモリリークしないか検証(回りくどいし筋が悪い)
    __weak HRSampleIntoroductionViewController* weakSelf = self;
    [self addRecever:weakSelf];
    
    self.panels = @[titlePanel, textPanel, panel3];
}

- (void)statusDidChanged:(float)progress
{
    _pageControl.currentPage = (int)progress;
}

@end
