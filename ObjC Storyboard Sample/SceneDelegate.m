//
//  SceneDelegate.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import <UIKit/UIKit.h>
#import "SceneDelegate.h"
#import "Singular.h"
#import "Utils.h"
#import <AppTrackingTransparency/ATTrackingManager.h>
#import <AdSupport/ASIdentifierManager.h>
#import "Constants.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)processDeeplink:(SingularLinkParams*)params{
    NSLog(@"processDeeplink");
    
    // Get Deeplink data from Singular Link
    NSString* deeplink = [params getDeepLink];
    NSString* passthrough = [params getPassthrough];
    NSString* isDeferredDeeplink = [params isDeferred] ? @"Yes": @"No";
    
    // Store in UserDefaults for access from DeeplinkController
    [[NSUserDefaults standardUserDefaults] setObject:deeplink forKey:DEEPLINK];
    [[NSUserDefaults standardUserDefaults] setObject:passthrough forKey:PASSTHROUGH];
    [[NSUserDefaults standardUserDefaults] setObject:isDeferredDeeplink forKey:IS_DEFERRED];
            
    // Handle to the DeeplinkController if deeplink exists
    if (deeplink) {
        dispatch_async(dispatch_get_main_queue(), ^{
            TabController* tabBar = (TabController *)self.window.rootViewController;
            [tabBar openedWithDeeplink];
        });
    }
}

// willConnectToSession
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    NSLog(@"willConnectToSession");
    //Might be able to use this instead of finsihed with options.
    
    NSUserActivity* userActivity = [[[connectionOptions userActivities] allObjects] firstObject];
    NSURL* url = userActivity.webpageURL;
    NSLog(@"willConnectToSession OpenURL: %@", url);
    [[NSUserDefaults standardUserDefaults] setObject:url.absoluteString forKey:OPENURL];
    
    SingularConfig* config = [[SingularConfig alloc] initWithApiKey:APIKEY andSecret:SECRET];
    config.singularLinksHandler = ^(SingularLinkParams * params) {[self processDeeplink:params];};
    config.skAdNetworkEnabled = YES;
    config.waitForTrackingAuthorizationWithTimeoutInterval = 300;
    //config.supportedDomains = @[@"subdomain.mywebsite.com", @"subdomain.myotherwebsite.com"];
    config.userActivity = userActivity;
    [Singular start:config];
}

// continueUserActivity
- (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity{
    NSLog(@"continueUserActivity");
    NSURL* url = userActivity.webpageURL;
    NSLog(@"continueUserActivity Open URL: %@", url);
    [[NSUserDefaults standardUserDefaults] setObject:url.absoluteString forKey:OPENURL];
    
    SingularConfig* config = [[SingularConfig alloc] initWithApiKey:APIKEY andSecret:SECRET];
    config.singularLinksHandler = ^(SingularLinkParams * params) {[self processDeeplink:params];};
    config.skAdNetworkEnabled = YES;
    config.waitForTrackingAuthorizationWithTimeoutInterval = 300;
    config.userActivity = userActivity;
    //config.supportedDomains = @[@"subdomain.mywebsite.com", @"subdomain.myotherwebsite.com"];
    [Singular start:config];
}

// openURLContexts
- (void)scene:(UIScene *)scene openURLContexts:(nonnull NSSet<UIOpenURLContext *> *)URLContexts {
    NSLog(@"openURLContexts");
    
    NSURL* url = [[URLContexts allObjects] firstObject].URL;
    NSLog(@"openURLContexts OpenURL: %@", url);
    [[NSUserDefaults standardUserDefaults] setObject:url.absoluteString forKey:OPENURL];
    
    if(url){
        SingularConfig* config = [[SingularConfig alloc] initWithApiKey:APIKEY andSecret:SECRET];
        config.singularLinksHandler = ^(SingularLinkParams * params) {[self processDeeplink:params];};
        config.skAdNetworkEnabled = YES;
        config.waitForTrackingAuthorizationWithTimeoutInterval = 300;
        config.openUrl = url;
        //config.supportedDomains = @[@"subdomain.mywebsite.com", @"subdomain.myotherwebsite.com"];
        [Singular start:config];
   }
}



- (void)sceneDidDisconnect:(UIScene *)scene {
    NSLog(@"sceneDidDisconnect");
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    NSLog(@"sceneDidBecomeActive");
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    
    // Request App Tracking Transparency when the App is Ready, provides IDFA on consent to Singular SDK
    if (@available(iOS 14, *)) {
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status){}];});
    }
}


- (void)sceneWillResignActive:(UIScene *)scene {
    NSLog(@"sceneWillResignActive");
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    NSLog(@"sceneWillEnterForeground");
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    NSLog(@"sceneDidEnterBackground");
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
