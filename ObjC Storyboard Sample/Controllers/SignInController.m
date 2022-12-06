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
    NSString* userID = self.userIDField.text;
    
    if([Utils isEmptyOrNull:userID]){
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"Enter a UserID to simulate the login process!"] withView:self];
    } else {
        NSLog(@"Login Button Clicked");
        [Singular setCustomUserId:userID];
        [Singular event:EVENT_SNG_LOGIN];
        self.userIDField.text = nil;
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"Login Success!"] withView:self];
        
    }
}

@end
