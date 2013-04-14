//
//  HRProgressAdjust.h
//  HRIntroduction
//
//  Created by hayashi311 on 4/14/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef float(^HRProgressAdjustBlock)(float);

HRProgressAdjustBlock HRProgressAdjust(float center, float range);
HRProgressAdjustBlock HRProgressAdjustAbs(float center, float range);