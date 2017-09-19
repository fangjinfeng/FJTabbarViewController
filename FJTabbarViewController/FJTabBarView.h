//
//  LETabBarView.h
//  LemonLive
//
//  Created by chenzy on 16/11/18.
//  Copyright © 2016年 Qingning Science & Technology Development Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FJTabBarView;

@protocol FJTabBarViewDelegate <NSObject>

@optional
- (void)tabBarView:(FJTabBarView *)tabBarView
    didClickButton:(NSInteger)index;

@end

@interface FJTabBarView : UIView

/**
 *  TabBar's item array
 */
@property (nonatomic, strong) NSArray *itemArray;

/**
 *  TabBar item badge value
 */
@property (nonatomic, copy) NSString *badgeValue;

/**
 *  TabBar item title color
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

/**
 *  TabBar item title font
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  TabBar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/**
 *  TabBar item image ratio
 */
@property (nonatomic, assign) CGFloat itemImageRatio;


/**
 *  TabBar item's badge background color
 */
@property (nonatomic, strong) UIColor *badgeBackgroundColor;

/**
 *  TabBar selected item title color
 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/**
 *  TabBar item's badge nomal color 
 */
@property (nonatomic, strong) UIColor *badgeTitleNomalColor;

/**
 *  TabBar LineView backgroud color 
 */
@property (nonatomic, strong) UIColor *lineViewBackgroundColor;

/**
 *  TabBar delegate
 */
@property (nonatomic, weak) id<FJTabBarViewDelegate> delegate;

- (void)setSelectedIndex:(NSInteger)index;

@end
