//
//  Utils.h
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMNSString+HTML.h"

@interface Utils : NSObject

+ (UIActivityIndicatorView *)showSpinnerInView:(UIView *)view;
+ (void)loadImageWithUrl:(NSString *)url andImageView:(UIImageView *)imageView activityIndicator:(UIActivityIndicatorView *)spinner;
+ (BOOL)isEmpty:(NSString *)string;
+ (void)setStateButton:(UIButton *)button andSelected:(BOOL)selected;
+ (void)animationHidenPopupView:(UIView *)view;
+ (UIView *)viewFromNibNamed:(NSString *)nibName;
+ (void)animationShowViewFromTop:(UIView *)view;
+ (void)animationHideViewFromTop:(UIView *)view;
+ (BOOL)isIphone35Inch;


@end
