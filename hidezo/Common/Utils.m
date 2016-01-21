//
//  Utils.m
//  hidezo
//
//  Created by Tung Dao on 9/7/15.
//  Copyright (c) 2015 Tung Dao. All rights reserved.
//

#import "Utils.h"
#import "UIImageView+AFNetworking.h"

#define SPINNER_SIZE 30

@implementation Utils

+ (UIActivityIndicatorView *)showSpinnerInView:(UIView *)view
{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGSize size = view.frame.size;
    [spinner setFrame:CGRectMake((size.width - SPINNER_SIZE)/2, (size.height - SPINNER_SIZE) / 2, SPINNER_SIZE, SPINNER_SIZE)];
    [view addSubview:spinner];
    return spinner;
}

+ (void)loadImageWithUrl:(NSString *)url andImageView:(UIImageView *)imageView activityIndicator:(UIActivityIndicatorView *)spinner
{
    [spinner startAnimating];
    __weak typeof(imageView) weakImageView = imageView;
    [weakImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] placeholderImage:[UIImage imageNamed:@"no_img"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if (image) {
            weakImageView.image = image;
        }
        [spinner stopAnimating];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [spinner stopAnimating];
    }];
}

+ (BOOL)isEmpty:(NSString *)string
{
    if (string && ![string isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

+ (void)setStateButton:(UIButton *)button andSelected:(BOOL)selected
{
    if (selected) {
        [button setBackgroundImage:[UIImage imageNamed:@"change_tab"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    } else {
        [button setBackgroundImage:[UIImage imageNamed:@"change_tab2"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
}

+ (void)animationHidenPopupView:(UIView *)view
{
    [UIView animateWithDuration:0.2 animations: ^(void) {
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.3f, 1.3f);
        view.alpha = 0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations: ^(void) {
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.5, 0.5);
            view.alpha = 0.2;
        } completion:^(BOOL finished) {
            view.alpha = 0.0;
            [view removeFromSuperview];
        }];
        
    }];
}

+ (UIView *)viewFromNibNamed:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    UIView *xibBasedView = nil;
    NSObject* nibItem = nil;
    
    while ((nibItem = [nibEnumerator nextObject]) != nil) {
        if ([nibItem isKindOfClass:[UIView class]]) {
            xibBasedView = (UIView *)nibItem;
            break;
        }
    }
    return xibBasedView;
}

+ (void)animationShowViewFromTop:(UIView *)view
{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.3f;
    animation.removedOnCompletion = NO;
    animation.type = kCATransitionPush;
    view.hidden = NO;
    animation.subtype = kCATransitionFromBottom;
    [view.layer addAnimation:animation forKey:@"animation"];
}

+ (void)animationHideViewFromTop:(UIView *)view
{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.3f;
    animation.removedOnCompletion = NO;
    animation.type = kCATransitionPush;
    view.hidden = YES;
    animation.subtype = kCATransitionFromTop;
    [view.layer addAnimation:animation forKey:@"animation"];
}

+ (BOOL)isIphone35Inch
{
    if ([[UIScreen mainScreen] bounds].size.height == 480) {
        return YES;
    }
    return NO;
}

@end
