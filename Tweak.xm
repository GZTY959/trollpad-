#import <Foundation/Foundation.h>
#import "TPPrefsObserver.h"

static TPPrefsObserver* pref;

%hook SBFluidSwitcherViewController
- (BOOL)isDevicePad {
    return pref.useiPadAppSwitchingAnimation; // 根据偏好设置决定是否使用 iPadOS 动画
}
%end

%ctor {
    pref = [TPPrefsObserver new]; // 初始化偏好观察者
}
​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
