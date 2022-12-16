//
//  SceneDelegate.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import "SceneDelegate.h"
#import "Singular.h"
#import "Utils.h"
#import "Constants.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    NSLog(@"-- willConnectToSession");
    
    NSUserActivity* userActivity = [[[connectionOptions userActivities] allObjects] firstObject];
    
    // Printing Identifier for Vendor (IDFV) to Xcode Console for use in Singular SDK Console
    NSLog(@"-- Scene Delegate IDFV: %@", [[[UIDevice currentDevice] identifierForVendor] UUIDString]);
    
    // Capture the OpenURL and store in UserDefaults
    NSURL* url = userActivity.webpageURL;
    [[NSUserDefaults standardUserDefaults] setObject:url.absoluteString forKey:OPENURL];
    
    // Starts a new Singular session from a backgrounded App
    SingularConfig *config = [self getConfig];
    config.userActivity = userActivity;
    [Singular start:config];
    
    // Request App Tracking Transparency when the App is Ready, provides IDFA on consent to Singular SDK
    [Utils requestTrackingAuthorization];
}


- (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity{
    NSLog(@"-- continueUserActivity");
    
    // Capture the OpenURL and store in UserDefaults
    NSURL* url = userActivity.webpageURL;
    [[NSUserDefaults standardUserDefaults] setObject:url.absoluteString forKey:OPENURL];
    
    // Starts a new Singular session from a backgrounded App
    SingularConfig *config = [self getConfig];
    config.userActivity = userActivity;
    [Singular start:config];
}


- (void)scene:(UIScene *)scene openURLContexts:(nonnull NSSet<UIOpenURLContext *> *)URLContexts {
    NSLog(@"-- openURLContexts");
    
    // Capture the OpenURL and store in UserDefaults
    NSURL* url = [[URLContexts allObjects] firstObject].URL;
    [[NSUserDefaults standardUserDefaults] setObject:url.absoluteString forKey:DEEPLINK];
    [[NSUserDefaults standardUserDefaults] setObject:url.absoluteString forKey:OPENURL];
    
    // Starts a new Singular session on cold start from deeplink scheme
    if(url){
        SingularConfig *config = [self getConfig];
        config.openUrl = url;
        [Singular start:config];
    }
    
    // Redirect to the DeeplinkController if Non-Singular deeplink exists
    dispatch_async(dispatch_get_main_queue(), ^{
        TabController* tabBar = (TabController *)self.window.rootViewController;
        [tabBar openedWithDeeplink];
    });

}

- (SingularConfig *)getConfig {
    NSLog(@"-- Scene Delegate getConfig");
    
    // (Optional) Get 3rd Party Identifiers to set in Global Properties:
    // If 3rd party SDKs are providing any identifiers to Singular, the respective SDK must be initialized before Singular.
    NSString* thirdPartyKey = @"anonymousID";
    NSString* thirdPartyID = @"2ed20738-059d-42b5-ab80-5aa0c530e3e1";
    
    // Singular Config Options
    SingularConfig* config = [[SingularConfig alloc] initWithApiKey:APIKEY andSecret:SECRET];
    config.skAdNetworkEnabled = YES;
    config.waitForTrackingAuthorizationWithTimeoutInterval = 300;
    config.supportedDomains = @[@"subdomain.mywebsite.com",@"anothersubdomain.myotherwebsite.com"];
    config.singularLinksHandler = ^(SingularLinkParams * params) {[self processDeeplink:params];};
    // Using Singular Global Properties feature to capture third party identifiers
    [config setGlobalProperty:thirdPartyKey withValue:thirdPartyID overrideExisting:YES];
    [Singular setSessionTimeout:120];
    
    return config;
}

- (void)processDeeplink:(SingularLinkParams*)params{
    NSLog(@"-- Scene Delegate processDeeplink");
    
    // Get Deeplink data from Singular Link
    NSString* deeplink = [params getDeepLink];
    NSString* passthrough = [params getPassthrough];
    NSString* isDeferredDeeplink = [params isDeferred] ? @"Yes": @"No";
    
    // Store deeplink data in UserDefaults for access from DeeplinkController
    [[NSUserDefaults standardUserDefaults] setObject:deeplink forKey:DEEPLINK];
    [[NSUserDefaults standardUserDefaults] setObject:passthrough forKey:PASSTHROUGH];
    [[NSUserDefaults standardUserDefaults] setObject:isDeferredDeeplink forKey:IS_DEFERRED];
            
    // Redirect to the DeeplinkController if deeplink exists
    if (deeplink) {
        dispatch_async(dispatch_get_main_queue(), ^{
            TabController* tabBar = (TabController *)self.window.rootViewController;
            [tabBar openedWithDeeplink];
        });
    }
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    NSLog(@"sceneDidDisconnect");
    
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    NSLog(@"sceneDidBecomeActive");
    
}


- (void)sceneWillResignActive:(UIScene *)scene {
    NSLog(@"sceneWillResignActive");
    
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    NSLog(@"sceneWillEnterForeground");
   
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    NSLog(@"sceneDidEnterBackground");
    
}


@end
