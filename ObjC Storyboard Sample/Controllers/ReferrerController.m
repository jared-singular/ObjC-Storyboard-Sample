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
    NSLog(@"ReferrerController - viewDidLoad");
    // Do any additional setup after loading the view.
}

- (void)viewDidDisappear:(BOOL)animated{
    self.referrerIDField.text = nil;
    self.referrerNameField.text = nil;
}

- (IBAction)sharedClicked:(id)sender {
    NSLog(@"Share Link Button Clicked");
    NSString* referrerBaseLink = @"https://joobjcstatic.sng.link/Cje1e/aknl?_dl=joobjcstatic%3A%2F%2Fmydeeplink/referrer&_smtype=3";
    NSString* referrerID = self.referrerIDField.text;
    NSString* referrerName = self.referrerNameField.text;
    
    NSDictionary* passthroughParams = @{@"channel": @"sms"};
    
    [Singular createReferrerShortLink:referrerBaseLink
        referrerName:referrerName
        referrerId:referrerID
        passthroughParams:passthroughParams
        completionHandler:^(NSString *shortLink, NSError *error) {
                if (error) {
                    // Logic to retry/abort/modify the params passed to the function, based on the cause of the error
                    NSLog(@"Error: %@", error);
                }

                if (shortLink) {
                    // Add your share logic here
                    NSLog(@"Short Link Received: %@", shortLink);
                    
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
