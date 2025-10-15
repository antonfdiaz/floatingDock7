#import <Foundation/Foundation.h>
#import "FD7RootListController.h"
#import <spawn.h>

@implementation floatingDock7PrefsRootListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
    }
    return _specifiers;
}

- (void)respring {
    pid_t pid;
    const char* args[] = {"killall","SpringBoard",NULL};
    posix_spawn(&pid,"/usr/bin/killall",NULL,NULL,(char* const*)args,NULL);
}

@end