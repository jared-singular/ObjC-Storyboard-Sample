//
//  PrivacyController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "PrivacyController.h"
#import "SignInController.h"
#import "Singular.h"
#import "Utils.h"

@interface PrivacyController ()

@end

@implementation PrivacyController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"PrivacyController - viewWillAppear");
    NSLog(@"IDFV: %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"idfv"]);
    NSLog(@"IDFA: %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"idfa"]);
    [self.idfvValue setText:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    [self.idfaValue setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"idfa"]];
}

- (IBAction)gdprToggled:(id)sender {
    if (self.gdpr.isOn){
        [Singular event:@"GDPR_OptOut"];
        [Singular stopAllTracking];
        
        //Logging for testing
        NSLog(@"GDPR Tracking OptOut - Tracking Stopped");
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"GDPR Tracking OptOut - Tracking Stopped"] withView:self];
    } else {
        if ([Singular isAllTrackingStopped] == TRUE){
            [Singular resumeAllTracking];
            [Singular trackingOptIn];
            [Singular event:@"GDPR_OptIn"];
            
            //Logging for testing
            NSLog(@"GDPR Tracking OptIn - Tracking Started");
            [Utils displayMessage:[[NSString alloc] initWithFormat:@"GDPR Tracking OptIn - Tracking Started"] withView:self];
        }
    }
}

- (IBAction)limitedDataSharingOptionToggled:(id)sender {
    if (self.limited_data_sharing.isOn){
        [Singular limitDataSharing:YES];
        [Singular event:@"LimitedDataSharing_OptIn"];
        
        //Logging for testing
        NSLog(@"Limited Data Sharing OptIn - Tracking remains enabled but limited data will not be shared with Networks");
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"Limited Data Sharing OptIn - Tracking remains enabled but limited data will not be shared with Networks"] withView:self];
    } else {
        [Singular limitDataSharing:NO];
        [Singular event:@"LimitedDataSharing_OptOut"];
        
        //Logging for testing
        NSLog(@"Limited Data Sharing OptOut - All Data will be shared with networks");
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"Limited Data Sharing OptOut - All Data will be shared with networks"] withView:self];
        }
}

@end
