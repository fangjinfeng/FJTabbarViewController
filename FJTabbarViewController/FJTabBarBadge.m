//
//  LCTabBarBadge.m
//  LCTabBarControllerDemo
//
//  Created by Leo on 15/12/2.
//  Copyright © 2015 Leo <leodaxia@gmail.com>
//
//  Copyright (c) 2015-2017 Leo
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "FJTabBarBadge.h"

// 默认 宽度
static CGFloat const kFJTabbarBadgeDefaultWidth = 12.0f;
// 默认 高度
static CGFloat const kFJTabbarBadgeDefaultHeight = 12.0f;

@implementation FJTabBarBadge

#pragma mark --- init method

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        self.layer.cornerRadius = (kFJTabbarBadgeDefaultWidth / 2.0);
        self.hidden = YES;
    }
    return self;
}

#pragma mark --- layout method

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.hidden = !(BOOL)self.badgeValue;
    if (self.badgeValue.length > 0) {
        [self setTitle:self.badgeValue forState:UIControlStateNormal];
        [self setTitleColor:self.badgeTitleNomalColor forState:UIControlStateNormal];
        CGRect frame = self.frame;
        CGFloat badgeW = kFJTabbarBadgeDefaultWidth;
        CGFloat badgeH = kFJTabbarBadgeDefaultHeight;
        CGSize titleSize = [self.badgeValue sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.badgeTitleFont, NSFontAttributeName, nil]];
        frame.size.width = MAX(badgeW, titleSize.width + 10);
        frame.size.height = badgeH;
        frame.origin.x = ([UIScreen mainScreen].bounds.size.width / self.tabBarItemCount)/2 + 13;
        frame.origin.y = 2.0f;
        self.frame = frame;
    }
}

#pragma mark --- setter method

// 设置 消息 字体
- (void)setBadgeTitleFont:(UIFont *)badgeTitleFont {
    
    _badgeTitleFont = badgeTitleFont;
    self.titleLabel.font = badgeTitleFont;
}


// 设置 消息 值
- (void)setBadgeValue:(NSString *)badgeValue {
    
    _badgeValue = [badgeValue copy];
}

@end
