//
//  FJTabbarViewController.h
//  FJTabbarController
//
//  Created by fjf on 2017/5/9.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJTabbarViewController : UITabBarController

/**
 *  TabBar item title color tabbarItem 普通 字体颜色
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

/**
 *  TabBar item title font   tabbarItem 字体 大小
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  TabBar item's badge title font 消息提示 字体大小
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/**
 *  TabBar item image ratio  tabbarItem 图片比例
 */
@property (nonatomic, assign) CGFloat itemImageRatio;

/**
 *  TabBar item's badge background color 消息 提示 背景色
 */
@property (nonatomic, strong) UIColor *badgeBackgroundColor;

/**
 *  TabBar item's badge nomal color 消息 提示 通常 字体颜色
 */
@property (nonatomic, strong) UIColor *badgeTitleNomalColor;

/**
 *  TabBar selected item title color  tabbarItem 选中 颜色
 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/**
 *  TabBar LineView backgroud color 背景 颜色
 */
@property (nonatomic, strong) UIColor *lineViewBackgroundColor;

/**
 根据 传入参数 设置 自定义 tabbarController
 
 @param viewControllerArray viewController 字符串 数组
 @param imageNameArray 普通 图片 数组
 @param selectedImageNameArray 选中 图片 数组
 @param titleArray tabbarItem 标题
 @return tabbarController
 */
- (instancetype)initWithViewControllerArray:(NSArray<NSString *> *)viewControllerArray
                             imageNameArray:(NSArray<NSString *> *)imageNameArray
                     selectedImageNameArray:(NSArray<NSString *> *)selectedImageNameArray
                                 titleArray:(NSArray<NSString *> *)titleArray;

@end
