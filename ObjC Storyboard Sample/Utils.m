//
//  Utils.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "Utils.h"
#import "Constants.h"
#import <AppTrackingTransparency/ATTrackingManager.h>
#import <AdSupport/ASIdentifierManager.h>

@implementation Utils

+ (BOOL)isEmptyOrNull:(NSString *)text{
    if(!text || ![text length] ||
       ![[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]){
        return YES;
    }
    return NO;
}

+ (void)displayMessage:(NSString*) message withView:(UIViewController*) view{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];

    [view presentViewController:alert animated:YES completion:nil];
    int duration = 3; // duration in seconds
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}

+ (void)requestTrackingAuthorization{
    // Request App Tracking Transparency when the App is Ready, provides IDFA on consent to Singular SDK
    if (@available(iOS 14, *)) {
        double delayInSeconds = 3.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status){
                NSLog(@"-- ATT: %d",(int)status);
                NSString* IDFV = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
                NSString* IDFA = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
                [[NSUserDefaults standardUserDefaults] setObject:IDFV forKey:@"idfv"];
                [[NSUserDefaults standardUserDefaults] setObject:IDFA forKey:@"idfa"];
            }];
        });
    }
}

@end
