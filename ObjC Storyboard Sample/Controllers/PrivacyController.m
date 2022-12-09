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
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"PrivacyController" forKey:ATTRIBUTE_SNG_ATTR_CONTENT_ID];
    [Singular event:EVENT_SNG_CONTENT_VIEW withArgs:dic];
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"-- PrivacyController - viewWillAppear");
    
    // Displaying the Identifiers on the PrivacyController
    [self.idfvValue setText:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    [self.idfaValue setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"idfa"]];
}

- (IBAction)gdprToggled:(id)sender {
    if (self.gdpr.isOn){
        // If User toggles the GDPR Opt Out to ON, we want to disable the Singular SDK to prohibit Tracking
        [Singular event:@"GDPR_OptOut"];
        
        [Singular stopAllTracking]; // This disables the Singular SDK
        
        NSLog(@"-- GDPR Tracking OptOut - Tracking Stopped");
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"GDPR Tracking OptOut - Tracking Stopped"] withView:self];
        
    } else {
        // If User toggles the GDPR Opt Out to OFF, we want to check the tracking state, and re-enable Tracking
        if ([Singular isAllTrackingStopped] == TRUE){
            
            [Singular resumeAllTracking]; // This enables the Singular SDK
            [Singular trackingOptIn]; // This notifies Singular the User is Opt'ing in for Tracking
            
            [Singular event:@"GDPR_OptIn"];
            
            NSLog(@"-- GDPR Tracking OptIn - Tracking Started");
            [Utils displayMessage:[[NSString alloc] initWithFormat:@"GDPR Tracking OptIn - Tracking Started"] withView:self];
        }
    }
}

- (IBAction)limitedDataSharingOptionToggled:(id)sender {
    if (self.limited_data_sharing.isOn){
        // If User toggles the CCPA Limited Data Sharing Opt Out to ON, we want to disable datasharing for this device
        [Singular limitDataSharing:YES]; // This will limit data sharing to ad network partners
        [Singular event:@"LimitedDataSharing_OptIn"];
        
        //Logging for testing
        NSLog(@"-- Limited Data Sharing OptIn - Tracking remains enabled but limited data will not be shared with Networks");
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"Limited Data Sharing OptIn - Tracking remains enabled but limited data will not be shared with Networks"] withView:self];
    } else {
        // If User toggles the CCPA Limited Data Sharing Opt Out to OFF, we want to re-enable datasharing for this device
        [Singular limitDataSharing:NO]; // This will reactivate data sharing to ad network partners
        [Singular event:@"LimitedDataSharing_OptOut"];
        
        NSLog(@"Limited Data Sharing OptOut - All Data will be shared with networks");
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"Limited Data Sharing OptOut - All Data will be shared with networks"] withView:self];
        }
}

- (IBAction)shareDeviceInfo:(id)sender {
    NSString* IDFV = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString* IDFA = [[NSUserDefaults standardUserDefaults] objectForKey:@"idfa"];
    if (IDFV || IDFA) {
        NSLog(@"-- Sharing Device Info");
        NSArray *items = @[[NSString stringWithFormat:@"Device Identifiers:\n\nIDFV: %@\nIDFA: %@",IDFV, IDFA]];
        UIActivityViewController* shareController = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
        shareController.modalPresentationStyle = UIModalPresentationPopover;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:shareController animated:YES completion:nil];
        });
    }
}

@end
