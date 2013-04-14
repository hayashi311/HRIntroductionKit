//
//  HRTransformBaseView.h
//  HRIntroduction
//
//  Created by hayashi311 on 4/13/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRProgressRecever.h"

@interface HRTransformBaseView : UIView<HRProgressRecever>

@property (nonatomic) CGAffineTransform transformForHidden;

@end
