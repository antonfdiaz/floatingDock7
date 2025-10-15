#import <UIKit/UIKit.h>

@interface SBDockView : UIView
@end

%hook SBDockView

- (void)layoutSubviews {
    %orig;

    self.layer.cornerRadius = 25.0;
    self.clipsToBounds = YES;

    self.layer.borderColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3].CGColor;
    self.layer.borderWidth = 1.0;

    CGRect frame = self.frame;
    frame.origin.x += 5;
    frame.size.width -= 10;
    frame.size.height -= 5;
    self.frame = frame;

    for (UIView *subview in self.subviews) {
        CGRect subviewFrame = subview.frame;
        subviewFrame.origin.y += 1;
        subview.frame = subviewFrame;
    }

    for (UIView *icon in self.subviews) {
        for (UIView *subview in icon.subviews) {
            if ([subview isKindOfClass:[UILabel class]]) {
                subview.hidden = YES;
            }
        }
    }
}

%end