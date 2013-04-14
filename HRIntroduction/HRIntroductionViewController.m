//
//  HRIntroductionViewController.m
//  HRIntroduction
//
//  Created by hayashi311 on 3/27/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import "HRIntroductionViewController.h"

@interface HRIntroductionViewController ()<UIScrollViewDelegate>{
    NSMutableArray* _panels;
    
    // TODO: NSMutableDictionaryを使うのはいまいち。
    NSMutableDictionary* _recevers;
    UIScrollView*   _contentView;
    UIView*         _backgroundView;
    UIView*         _frontView;
}

@property (readonly) float progress;

@end

@implementation HRIntroductionViewController
@synthesize backgroudView = _backgroundView;
@synthesize frontView     = _frontView;

- (id)init
{
    return [self initWithNibName:nil bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _recevers = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor redColor];
    
    _contentView = [[UIScrollView alloc] init];
    _contentView.backgroundColor = [UIColor clearColor];
    _contentView.pagingEnabled = YES;
    _contentView.showsVerticalScrollIndicator   = NO;
    _contentView.showsHorizontalScrollIndicator = NO;
    _contentView.delegate = self;
    
    if (_frontView) {
        [self.view insertSubview:_contentView belowSubview:_frontView];
    }else{
        [self.view addSubview:_contentView];
    }

}

- (void)viewDidLayoutSubviews
{
    CGSize size = self.view.frame.size;
    _contentView.frame =  CGRectMake(0, 0, size.width, size.height);
    
    if (_panels){
        int index = 0;
        for (UIView* panel in _panels) {
            panel.frame = CGRectMake(size.width*index, 0, size.width, size.height);
            // TODO: なぜこの処理が必要なのか? あれ?
            if (!panel.superview) {
                [_contentView addSubview:panel];
            }
            ++index;
        }
        _contentView.contentSize = CGSizeMake(size.width*index, size.height);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setPanels:(NSArray *)panels
{
    NSLog(@"set panel");
    if (!_panels){
        for (UIView* panel in _panels) {
            [panel removeFromSuperview];
        }
    }
    
    _panels = [NSMutableArray arrayWithArray:panels];
    for (UIView* panel in _panels) {
        [_contentView addSubview:panel];
    }
}

- (float)progress
{
    return _contentView.contentOffset.x / _contentView.frame.size.width;
}

- (void)setBackgroudView:(UIView *)backgroudView
{
    if (_backgroundView){
        [_backgroundView removeFromSuperview];
    }
    _backgroundView = backgroudView;
    [self.view insertSubview:_backgroundView atIndex:0];
}

- (void)setFrontView:(UIView *)frontView
{
    if (_frontView){
        [_frontView removeFromSuperview];
    }
    
    // TODO: 順番を保ったままViewを用意する方法が糞。どうするの...
    _frontView = frontView;
    if (_contentView) {
        [self.view insertSubview:_frontView aboveSubview:_contentView];
    }else{
        [self.view addSubview:_frontView];
    }

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float globalProgress = self.progress;
    
    for (HRProgressAdjustBlock adjuster in _recevers) {
        float localProgress = adjuster(globalProgress);
        UIView<HRProgressRecever>* recever = [_recevers objectForKey:adjuster];
        if (recever){
            [recever statusDidChanged:localProgress];
        }
    }
}

- (void)addRecever:(NSObject<HRProgressRecever>*)recever
{
    [self addRecever:recever adjuster:^float(float progress) {
        return progress;
    }];
}

- (void)addRecever:(NSObject<HRProgressRecever>*)recever adjuster:(HRProgressAdjustBlock)adjuster
{
    [_recevers setObject:recever forKey:adjuster];
}

// TODO: blocksをkeyにしたため消せなくなったw
/*
- (void)removeRecever:(UIView<HRProgressRecever>*)recever
{
 

}*/



@end
