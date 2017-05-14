//
//  UIViewController+Qqc.m
//  QqcFramework
//
//  Created by mahailin on 15/8/7.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "UIViewController+Qqc.h"

@implementation UIViewController (Qqc)

/**
 *  根view，用于获取keywindow的rootviewcontroller的view
 *
 *  @return 返回根view
 */
- (UIView *)rootView
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    if (keyWindow.rootViewController)
    {
        return keyWindow.rootViewController.view;
    }
    
    for (UIWindow *window in [UIApplication sharedApplication].windows)
    {
        if (window.rootViewController)
        {
            return window.rootViewController.view;
        }
    }
    
    return nil;
}

/**
 *  载入同类名的nib文件并返回该viewcontroller的实例
 *
 *  @return 指定viewcontroller的实例
 */
+ (instancetype)viewControllerWithClassNamedNib
{
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

/**
 *  根据键盘移动view的位置
 *
 *  @param view         要移动的view
 *  @param notification 键盘通知
 *  @param up           向上移为yes，向下为no
 */
- (void)moveView:(UIView *)view forKeyboardNotification:(NSNotification*)notification up:(BOOL)up
{
    NSDictionary* userInfo = [notification userInfo];
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardEndFrame;
    
    //取出键盘的相关数据
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    
    //进行界面移动
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    CGRect newFrame = view.frame;
    CGRect keyboardFrame = [self.view convertRect:keyboardEndFrame toView:nil];
    newFrame.origin.y -= keyboardFrame.size.height * (up? 1 : -1);
    view.frame = newFrame;
    [UIView commitAnimations];
}

@end