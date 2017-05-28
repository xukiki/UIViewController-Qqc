//
//  UIViewController+Qqc.h
//  QqcFramework
//
//  Created by mahailin on 15/8/7.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIViewController类别
 */
@interface UIViewController (Qqc)

/**
 *  根view，用于获取keywindow的rootviewcontroller的view
 */
@property (nonatomic, retain, readonly) UIView *rootView;

/**
 *  载入同类名的nib文件并返回该viewcontroller的实例
 *
 *  @return 指定viewcontroller的实例
 */
+ (instancetype)viewControllerWithClassNamedNib;

//构造函数
+ (instancetype)viewControllerOfClassNamedNib;

//构造函数
+ (instancetype)viewControllerOfClassNameNibWithBundleName:(NSString *)strBundleName;

/**
 *  根据键盘移动view的位置
 *
 *  @param view         要移动的view
 *  @param notification 键盘通知
 *  @param up           向上移为yes，向下为no
 */
- (void)moveView:(UIView *)view forKeyboardNotification:(NSNotification*)notification up:(BOOL)up;

@end
