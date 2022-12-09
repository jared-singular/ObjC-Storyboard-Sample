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
    NSLog(@"-- SignInController - viewDidLoad");
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"SignInController" forKey:ATTRIBUTE_SNG_ATTR_CONTENT_ID];
    [Singular event:EVENT_SNG_CONTENT_VIEW withArgs:dic];
}


- (IBAction)loginClicked:(id)sender {
    NSString* userID = self.userIDField.text;
    
    if([Utils isEmptyOrNull:userID]){
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"Enter a UserID to simulate the login process!"] withView:self];
    } else {
        NSLog(@"-- Login Button Clicked");
        
        // Set the User ID in Singular using the setCustomUserID Method
        [Singular setCustomUserId:userID];
        
        // Sending a Standard Event after setting the customUserID show the Custom User ID is inhereted.
        [Singular event:EVENT_SNG_LOGIN];
        
        self.userIDField.text = nil;
        [Utils displayMessage:[[NSString alloc] initWithFormat:@"Login Success!"] withView:self];
    }
}

@end
