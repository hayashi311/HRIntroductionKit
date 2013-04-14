//
//  HRIntroductionPanel.h
//  HRIntroduction
//
//  Created by hayashi311 on 3/30/13.
//  Copyright (c) 2013 hayashi311. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HRProgressRecever <NSObject>

- (void)statusDidChanged:(float)progress;

@end
