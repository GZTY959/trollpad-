#import <UIKit/UIKit.h>
#import <objc/runtime.h>

// 偏好设置（模拟 TPPrefsObserver）
static BOOL useiPadAppSwitchingAnimation = YES; // 默认启用 iPadOS 动画

// 钩子 UIDevice，模拟 iPad 设备类型以启用 iPadOS 动画
static uint16_t forcePadIdiom = 0;

%hook UIDevice
- (UIUserInterfaceIdiom)userInterfaceIdiom {
    if (forcePadIdiom > 0 && useiPadAppSwitchingAnimation) {
        return UIUserInterfaceIdiomPad;
    }
    return %orig;
}
%end

// 钩子 SBFluidSwitcherViewController，启用 iPadOS 应用切换动画
%hook SBFluidSwitcherViewController
- (BOOL)isDevicePad {
    return useiPadAppSwitchingAnimation ? YES : %orig;
}

// 确保不修改网格布局，保留 iPhone 的卡片式布局
- (NSUInteger)numberOfRowsInGridSwitcher {
    return 1; // 强制单行，模拟 iPhone 卡片式布局
}
%end

// 自定义动画参数（可选，需逆向确认）
%hook SBAppSwitcherSettings
- (void)setDefaultValues {
    %orig;
    // 调整间距以避免 iPad 风格的网格布局
    self.spacingBetweenLeadingEdgeAndIcon = 10;
    self.spacingBetweenTrailingEdgeAndLabels = 10;
}

// 避免强制 iPad 切换器样式
- (NSInteger)effectiveSwitcherStyle {
    return 1; // 1 表示 iPhone 风格，2 表示 iPad 风格
}
%end

// 钩子动画过渡，添加 iPadOS 风格的缩放和淡入效果
%hook SBFluidSwitcherViewController
- (void)performTransitionWithContext:(id)context animated:(BOOL)animated completion:(id)completion {
    if (useiPadAppSwitchingAnimation && animated) {
        [UIView animateWithDuration:0.4
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
                             self.view.alpha = 0.8;
                         }
                         completion:^(BOOL finished) {
                             self.view.transform = CGAffineTransformIdentity;
                             self.view.alpha = 1.0;
                             if (completion) {
                                 ((void (^)(void))completion)();
                             }
                         }];
    }
    %orig;
}
%end

%ctor {
    // 初始化偏好设置（可扩展为读取 plist 文件）
    useiPadAppSwitchingAnimation = YES;
}
​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
