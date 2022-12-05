//
//  AppDelegate.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import "Singular.h"
#import "Utils.h"
#import "TabController.h"
#import "Constants.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"didFinishLaunchingWithOptions");
    
    // Starts a new session when the user opens the app if the session timeout has passed / opened using a Singular Link
    SingularConfig* config = [[SingularConfig alloc] initWithApiKey:APIKEY andSecret:SECRET];
    config.launchOptions = launchOptions;
    config.singularLinksHandler = ^(SingularLinkParams * params) {[self processDeeplink:params];};
    config.skAdNetworkEnabled = YES;
    config.waitForTrackingAuthorizationWithTimeoutInterval = 300;
    //config.supportedDomains = @[@"subdomain.mywebsite.com", @"subdomain.myotherwebsite.com"];
    [Singular start:config];
    
    return YES;
}

- (void)processDeeplink:(SingularLinkParams*)params{
    NSLog(@"processDeeplink");
    
    // Get Deeplink data from Singular Link
    NSString* deeplink = [params getDeepLink];
    NSString* passthrough = [params getPassthrough];
    NSString* isDeferredDeeplink = [params isDeferred] ? @"Yes": @"No";
    
    // Store in UserDefaults for Access Later
    [[NSUserDefaults standardUserDefaults] setObject:deeplink forKey:DEEPLINK];
    [[NSUserDefaults standardUserDefaults] setObject:passthrough forKey:PASSTHROUGH];
    [[NSUserDefaults standardUserDefaults] setObject:isDeferredDeeplink forKey:IS_DEFERRED];
    
    // Handle the Deeplink
    dispatch_async(dispatch_get_main_queue(), ^{
        TabController* tabBar = (TabController *)self.window.rootViewController;
        [tabBar openedWithDeeplink];
    });
}



#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
