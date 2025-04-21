 ```objc
 @interface SBFluidSwitcherViewController : UIViewController
 - (BOOL)isDevicePad;
 - (NSUInteger)numberOfRowsInGridSwitcher;
 - (void)performTransitionWithContext:(id)context animated:(BOOL)animated completion:(id)completion;
 @end

 @interface SBAppSwitcherSettings : NSObject
 - (void)setDefaultValues;
 - (NSInteger)effectiveSwitcherStyle;
 - (void)setSpacingBetweenLeadingEdgeAndIcon:(CGFloat)value;
 - (void)setSpacingBetweenTrailingEdgeAndLabels:(CGFloat)value;
 @end
