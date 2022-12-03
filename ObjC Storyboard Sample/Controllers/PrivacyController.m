//
//  PrivacyController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "PrivacyController.h"
#import "SignInController.h"

@interface PrivacyController ()
@property (weak, nonatomic) IBOutlet UILabel *idfvValue;

@end

@implementation PrivacyController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PrivacyController - viewDidLoad");
    // Do any additional setup after loading the view.
    NSString* IDFV = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"IDFV: %@", IDFV);
    [self.idfvValue setText:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)nextClicked:(id)sender {
    NSLog(@"Next Button Clicked");
    //Loading a view controller from a storyboard when button is clicked
    //https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/PresentingaViewController.html#//apple_ref/doc/uid/TP40007457-CH14-SW1
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignInController* myVC = [sb instantiateViewControllerWithIdentifier:@"SignInController"];
     
    // Configure the view controller.
     
    // Display the view controller
    [self presentViewController:myVC animated:YES completion:nil];
    //[self.navigationController pushViewController:myVC animated:YES ];
}
- (IBAction)gdprToggled:(id)sender {
    NSLog(@"GDPR Option Toggled");
}

- (IBAction)limitedDataSharingOptionToggled:(id)sender {
    NSLog(@"Limited Data Sharing Option Toggled");
}

- (IBAction)ccpaUnderAgeToggled:(id)sender {
    NSLog(@"CCPA Under Age Option Toggled");
}

@end
