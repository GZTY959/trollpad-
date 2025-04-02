#import "TPPrefsObserver.h"

#define PREFS_PATH @"/var/jb/var/mobile/Library/Preferences/com.yourname.ipadosanimation.plist"

@implementation TPPrefsObserver

- (instancetype)init {
    self = [super init];
    if (self) {
        NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:PREFS_PATH];
        _useiPadAppSwitchingAnimation = [prefs[@"useiPadAppSwitchingAnimation"] boolValue] ?: YES; // 默认开启
    }
    return self;
}

@end
​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​
