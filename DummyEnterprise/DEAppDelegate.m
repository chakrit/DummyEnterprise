//
//  DEAppDelegate.m
//  DummyEnterprise
//
//  Created by Chakrit Wichian on 8/3/13.
//  Copyright (c) 2013 Ent. All rights reserved.
//

#import "DEAppDelegate.h"
#import "DEImageShadowViewController.h"

@implementation DEAppDelegate {
    UIWindow *_window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];

    DEImageShadowViewController *controller = nil;
    controller = [[DEImageShadowViewController alloc] init];

    _window = [[UIWindow alloc] initWithFrame:screenBounds];
    [_window setBackgroundColor:[UIColor whiteColor]];
    [_window setRootViewController:controller];
    [_window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application { }
- (void)applicationDidEnterBackground:(UIApplication *)application { }
- (void)applicationWillEnterForeground:(UIApplication *)application { }
- (void)applicationDidBecomeActive:(UIApplication *)application { }
- (void)applicationWillTerminate:(UIApplication *)application { }

@end
