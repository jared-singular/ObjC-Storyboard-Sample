//
//  SignInController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "SignInController.h"

@interface SignInController ()

@end

@implementation SignInController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"SignInController - viewDidLoad");
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)loginClicked:(id)sender {
    NSLog(@"Login Button Clicked");
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
