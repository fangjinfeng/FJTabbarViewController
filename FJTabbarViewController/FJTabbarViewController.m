//
//  FJTabbarViewController.m
//  FJTabbarController
//
//  Created by fjf on 2017/5/9.
//  Copyright © 2017年 fjf. All rights reserved.
//

#import "FJTabBarView.h"
#import "FJTabbarDefine.h"
#import "FJTabbarViewController.h"

@interface FJTabbarViewController ()<FJTabBarViewDelegate>
// itmes array
@property (nonatomic, strong) NSMutableArray *itemArray;
// tabbar
@property (nonatomic, strong) FJTabBarView *tabBarView;
@end

@implementation FJTabbarViewController

#pragma mark --- init method

- (instancetype)initWithViewControllerArray:(NSArray<NSString *> *)viewControllerArray
                             imageNameArray:(NSArray<NSString *> *)imageNameArray
                     selectedImageNameArray:(NSArray<NSString *> *)selectedImageNameArray
                                 titleArray:(NSArray<NSString *> *)titleArray {
    
    if (self = [self init]) {
        for (int i = 0; i < viewControllerArray.count; i++) {
            [self setUpOneChildViewController:viewControllerArray[i]
                                    imageName:imageNameArray[i]
                            selectedImageName:selectedImageNameArray[i]
                                        title:titleArray[i]];
        }
        
        [self setUpTabBar];
    
    }
    return self;
}

#pragma mark --- life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDefualutValue];
}

- (void)viewDidLayoutSubviews {
    self.tabBarView.frame = self.tabBar.bounds;
    [self.tabBarView layoutSubviews];
}

#pragma mark --- private method
// 设置 相关 属性
- (void)setUpOneChildViewController:(NSString *)viewControllerStr
                          imageName:(NSString *)imageName
                  selectedImageName:(NSString *)selectedNameImage
                              title:(NSString *)title {
    UIViewController *vc = [[NSClassFromString(viewControllerStr) alloc] init];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedNameImage];
    [self.itemArray addObject:vc.tabBarItem];
    
    //添加导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}

// 设置 默认 值
- (void)setupDefualutValue {
    self.itemTitleFont = kFJTabbarButtonFontSize;
    self.badgeTitleFont = kFJTabbarBadgeFontSize;
    self.itemTitleColor = kFJTabbarButtonNormalTitleColor;
    self.selectedItemTitleColor = kFJTabbarButtonSelectTitleColor;
    self.badgeBackgroundColor = kFJTabbarBadgeBackgroundColor;
    self.itemImageRatio = kFJTabbarItemImageRatio;
}

// 设置 tabbr
- (void)setUpTabBar {
    //添加自定义tabBar
    self.tabBarView.itemArray = self.itemArray;
    [self.tabBar addSubview:self.tabBarView];
    // 移除 原先 子控件
    [self removeTabbarOriginalView];
}

// 移除 tabbar 原先 子控件
- (void)removeTabbarOriginalView {
    // 移除 UITabBarButton
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull tabBarButton, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            tabBarButton.alpha = 0;
            tabBarButton.hidden = YES;
        }
    }];
    
    //去掉分割线
    self.tabBar.backgroundImage = [[UIImage alloc] init];
    self.tabBar.shadowImage = [[UIImage alloc] init];
}

#pragma mark --- custom delegate

- (void)tabBarView:(FJTabBarView *)tabBarView
    didClickButton:(NSInteger)index {
    
    self.selectedIndex = index;
}



#pragma mark --- setter method

- (void)setItemTitleFont:(UIFont *)itemTitleFont {

    _itemTitleFont = itemTitleFont;
    self.tabBarView.itemTitleFont = itemTitleFont;
}

- (void)setItemTitleColor:(UIColor *)itemTitleColor {
    
    _itemTitleColor = itemTitleColor;
    self.tabBarView.itemTitleColor = itemTitleColor;
}

- (void)setItemImageRatio:(CGFloat)itemImageRatio {
    
    _itemImageRatio = itemImageRatio;
    self.tabBarView.itemImageRatio = itemImageRatio;
}

- (void)setSelectedItemTitleColor:(UIColor *)selectedItemTitleColor {
    
    _selectedItemTitleColor = selectedItemTitleColor;
    self.tabBarView.selectedItemTitleColor = selectedItemTitleColor;
}

- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont {
    
    _badgeTitleFont = badgeTitleFont;
    self.tabBarView.badgeTitleFont = badgeTitleFont;
}

- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor {
    
    _badgeBackgroundColor = badgeBackgroundColor;
    self.tabBarView.badgeBackgroundColor = badgeBackgroundColor;
}


- (void)setBadgeTitleNomalColor:(UIColor *)badgeTitleNomalColor {
    _badgeTitleNomalColor = badgeTitleNomalColor;
    
    self.tabBarView.badgeTitleNomalColor = badgeTitleNomalColor;
}


- (void)setLineViewBackgroundColor:(UIColor *)lineViewBackgroundColor {
    _lineViewBackgroundColor = lineViewBackgroundColor;
    self.tabBarView.lineViewBackgroundColor = lineViewBackgroundColor;
}

#pragma mark --- getter method

// item 数组
- (NSMutableArray *)itemArray {
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

// 自定义 tabbarView
- (FJTabBarView *)tabBarView {
    if (_tabBarView == nil) {
        _tabBarView = [[FJTabBarView alloc] init];
        _tabBarView.frame = self.tabBar.bounds;
        _tabBarView.delegate = self;
    }
    return _tabBarView;
}

@end
