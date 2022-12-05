//
//  SignInController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "SignInController.h"
#import "Singular.h"
#import "Utils.h"

@interface SignInController ()

@end

@implementation SignInController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"SignInController - viewDidLoad");
    // Do any additional setup after loading the view.
}


- (IBAction)loginClicked:(id)sender {
    NSLog(@"Login Button Clicked");
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
