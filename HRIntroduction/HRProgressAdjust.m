//
//  HRProgressAdjust.m
//  HRIntroduction
//
//  Created by hayashi311 on 4/14/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import "HRProgressAdjust.h"

HRProgressAdjustBlock HRProgressAdjust(float center, float range)
{
    HRProgressAdjustBlock adjustBlock = ^float(float progress){
        progress = progress - center;
        progress = MIN(progress, range);
        progress = MAX(progress, -range);
        if (range != 0.0) {
            progress = progress/range;
        }
        return progress;
    };
    return adjustBlock;
}

HRProgressAdjustBlock HRProgressAdjustAbs(float center, float range)
{
    HRProgressAdjustBlock adjustBlock = ^float(float progress){
        progress = ABS(progress - center);
        progress = MIN(progress, range);
        if (range != 0.0) {
            progress = progress/range;
        }
        return progress;
    };
    return adjustBlock;
}

