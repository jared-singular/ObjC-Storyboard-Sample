//
//  ReferrerController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "ReferrerController.h"
#import "Singular.h"
#import "Utils.h"

@interface ReferrerController ()

@end

@implementation ReferrerController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"-- ReferrerController - viewDidLoad");
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"ReferrerController" forKey:ATTRIBUTE_SNG_ATTR_CONTENT_ID];
    [Singular event:EVENT_SNG_CONTENT_VIEW withArgs:dic];
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"-- ReferrerController - viewDidDisappear");
    // Clear the Referrer data so they are not used again.
    self.referrerIDField.text = nil;
    self.referrerNameField.text = nil;
}

- (IBAction)sharedClicked:(id)sender {
    NSLog(@"-- Share Link Button Clicked");
    
    // Define variables for the Referral Short Link:
    
    // Add your Singular tracking link to be used as a base link:
    NSString* referrerBaseLink = @"https://joobjcstatic.sng.link/Cje1e/aknl?_dl=joobjcstatic%3A%2F%2Fmydeeplink/referrer&_smtype=3";
    
    // Add your Referrer ID and Name
    NSString* referrerID = self.referrerIDField.text;
    NSString* referrerName = self.referrerNameField.text;
    
    // Customize any Passthrough Parameters
    NSDictionary* passthroughParams = @{@"channel": @"sms"};
    
    // Call the ReferrerShortLink Method to get your shortlink to share on Social
    [Singular createReferrerShortLink:referrerBaseLink
        referrerName:referrerName
        referrerId:referrerID
        passthroughParams:passthroughParams
        completionHandler:^(NSString *shortLink, NSError *error) {
                if (error) {
                    // Logic to retry/abort/modify the params passed to the function, based on the cause of the error
                    NSLog(@"-- Error: %@", error);
                }

                if (shortLink) {
                    NSLog(@"-- Short Link Received: %@", shortLink);
                    
                    // Add your share logic here:
                    
                    // Share Link to ShareController
                    NSArray *items = @[[NSString stringWithFormat:@"Check out this new app: %@",shortLink]];
                    UIActivityViewController* shareController = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
                    shareController.modalPresentationStyle = UIModalPresentationPopover;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self presentViewController:shareController animated:YES completion:nil];
                    });
                }
            }
    ];
}

@end
