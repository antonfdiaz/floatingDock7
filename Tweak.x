#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

static BOOL enabled = YES; //default value
static BOOL noBorderColor = NO; //default value

@interface SBDockView : UIView
@end

static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.t0nchi7.floatingdock7prefs.plist"];
    if(prefs)
    {
        NSNumber *enabledValue = [prefs objectForKey:@"enabled"];
        if (enabledValue) {
            enabled = [enabledValue boolValue];
        }

        NSNumber *noBorderColorValue = [prefs objectForKey:@"noBorderColor"];
        if (noBorderColorValue) {
            noBorderColor = [noBorderColorValue boolValue];
        }
    }
}

%ctor
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),NULL,(CFNotificationCallback)loadPrefs, CFSTR("com.t0nchi7.floatingdock7prefs/settingschanged"),NULL,CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}

%hook SBDockView

- (void)layoutSubviews {
    %orig;

    if (!enabled) return;

    self.layer.cornerRadius = 25.0;
    self.clipsToBounds = YES;

    if (!noBorderColor) {
        self.layer.borderColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3].CGColor;
        self.layer.borderWidth = 1.0;
    }

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