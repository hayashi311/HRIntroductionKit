//
//  HRDefaultBackgroundView.h
//  HRIntroduction
//
//  Created by hayashi311 on 4/13/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRProgressRecever.h"

@interface HRDefaultBackgroundView : UIView<HRProgressRecever>

@property (nonatomic, strong) UIImage* backgroundImage;

@end
