//
//  HRIntroductionViewController.h
//  HRIntroduction
//
//  Created by hayashi311 on 3/27/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRProgressRecever.h"
#import "HRProgressAdjust.h"

@interface HRIntroductionViewController : UIViewController

@property (nonatomic, strong)   NSArray* panels;
@property (nonatomic, strong)   UIView*  backgroudView;
@property (nonatomic, strong)   UIView*  frontView;

- (void)addRecever:(NSObject<HRProgressRecever>*)recever;
- (void)addRecever:(NSObject<HRProgressRecever>*)recever adjuster:(HRProgressAdjustBlock)adjuster;


@end
