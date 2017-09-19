//
//  TabBarButton.m
//  LemonLive
//
//  Created by chenzy on 16/11/18.
//  Copyright © 2016年 Qingning Science & Technology Development Co.,Ltd. All rights reserved.
//


#import "FJTabBarBadge.h"
#import "FJTabBarButton.h"
#import "FJTabbarDefine.h"


@interface FJTabBarButton()
/**
 *  TabBar item's badge
 */
@property (nonatomic, strong) FJTabBarBadge *tabBarBadge;
@end

@implementation FJTabBarButton

#pragma mark --- init method

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupControls];
        [self setupDefaultValue];
    }
    return self;
}

#pragma mark --- private method
// 设置 子控件
- (void)setupControls {
    [self addSubview:self.tabBarBadge];
}

// 设置 默认 值
- (void)setupDefaultValue {
    self.itemImageRatio = kFJTabbarItemImageRatio;
    self.tabBarBadge.badgeValue = @"99+";
    [self setTitleColor:kFJTabbarButtonNormalTitleColor
               forState:UIControlStateNormal];
    [self setTitleColor:kFJTabbarButtonSelectTitleColor
               forState:UIControlStateSelected];
    
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = kFJTabbarButtonFontSize;
}


//重写，取消高亮做的事情
- (void)setHighlighted:(BOOL)highlighted {
    
}



#pragma mark --- layout subview

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // imageView
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * self.itemImageRatio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    // title
    CGFloat titleX = 0;
    CGFloat titleY = imageH - 3;
    CGFloat titleW = self.bounds.size.width;
    CGFloat titleH = self.bounds.size.height - titleY;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}


#pragma mark --- setter method

- (void)setItem:(UITabBarItem *)item {
    
    _item = item;
  
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}

// tabbarBadge value
- (void)setBadgeValue:(NSString *)badgeValue {
    
    _badgeValue = badgeValue;
    self.tabBarBadge.badgeValue = badgeValue;
}

// image ration
- (void)setItemImageRatio:(CGFloat)itemImageRatio {
    
    _itemImageRatio = itemImageRatio;
}

// title font
- (void)setItemTitleFont:(UIFont *)itemTitleFont {
    
    _itemTitleFont = itemTitleFont;
    self.titleLabel.font = itemTitleFont;
    
}

// title color
- (void)setItemTitleColor:(UIColor *)itemTitleColor {
    
    _itemTitleColor = itemTitleColor;
    [self setTitleColor:itemTitleColor forState:UIControlStateNormal];
}

// selected title color
- (void)setSelectedItemTitleColor:(UIColor *)selectedItemTitleColor {
    
    _selectedItemTitleColor = selectedItemTitleColor;
    [self setTitleColor:selectedItemTitleColor forState:UIControlStateSelected];
}

// tip badge title font
- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont {
    
    _badgeTitleFont = badgeTitleFont;
    self.tabBarBadge.badgeTitleFont = badgeTitleFont;
}

// badge title font
- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor {
    
    _badgeBackgroundColor = badgeBackgroundColor;
    self.tabBarBadge.backgroundColor = badgeBackgroundColor;
}

// tabbarItem count
- (void)setTabBarItemCount:(NSInteger)tabBarItemCount {
    
    _tabBarItemCount = tabBarItemCount;
    self.tabBarBadge.tabBarItemCount = tabBarItemCount;
}

// tabbar badge title normal color
- (void)setBadgeTitleNomalColor:(UIColor *)badgeTitleNomalColor {
    _badgeTitleNomalColor = badgeTitleNomalColor;
    self.tabBarBadge.badgeTitleNomalColor = badgeTitleNomalColor;
}

#pragma mark --- getter method

// 未读 提示 badge
- (FJTabBarBadge *)tabBarBadge {
    
    if(!_tabBarBadge) {
        _tabBarBadge = [[FJTabBarBadge alloc] init];
    }
    return _tabBarBadge;
}
@end
