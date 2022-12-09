//
//  DeeplinkController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "DeeplinkController.h"
#import "AppDelegate.h"
#import "SceneDelegate.h"
#import "Constants.h"
#import "Singular.h"
#import "Utils.h"

@interface DeeplinkController ()

@end

@implementation DeeplinkController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"DeeplinkController" forKey:ATTRIBUTE_SNG_ATTR_CONTENT_ID];
    [Singular event:EVENT_SNG_CONTENT_VIEW withArgs:dic];
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"-- DeeplinkController - viewWillAppear");
    
    // Display deeplink data from UserDefaults
    [self.deeplinkField setText:[[NSUserDefaults standardUserDefaults] objectForKey:DEEPLINK]];
    [self.passthroughField setText:[[NSUserDefaults standardUserDefaults] objectForKey:PASSTHROUGH]];
    [self.isDeferredField setText:[[NSUserDefaults standardUserDefaults] objectForKey:IS_DEFERRED]];
    [self.openURLField setText:[[NSUserDefaults standardUserDefaults] objectForKey:OPENURL]];
}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"-- viewDidDisappear");
    NSLog(@"-- Clearing Link Data");
    
    // Clear the deeplink data from UserDefaults
    [[NSUserDefaults standardUserDefaults] setObject:@"App did not open with a deep link" forKey:DEEPLINK];
    [[NSUserDefaults standardUserDefaults] setObject:@"App did not open with a deep link" forKey:PASSTHROUGH];
    [[NSUserDefaults standardUserDefaults] setObject:@"App did not open with a deep link" forKey:IS_DEFERRED];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:OPENURL];
}

@end
