//
//  TabBarButton.h
//  LemonLive
//
//  Created by chenzy on 16/11/18.
//  Copyright © 2016年 Qingning Science & Technology Development Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJTabBarButton : UIButton


/**
 *  TabBar item badge value
 */
@property (nonatomic, copy) NSString *badgeValue;

/**
 *  TabBar item
 */
@property (nonatomic, strong) UITabBarItem *item;

/**
 *  TabBar item image ratio
 */
@property (nonatomic, assign) CGFloat itemImageRatio;

/**
 *  TabBar item title font
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  TabBar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/**
 *  TabBar's item count
 */
@property (nonatomic, assign) NSInteger tabBarItemCount;


/**
 *  TabBar item title color
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

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

@end
