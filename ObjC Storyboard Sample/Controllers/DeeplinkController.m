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
//#import "Variables.h"

@interface DeeplinkController ()

@end

@implementation DeeplinkController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"DeeplinkController - viewWillAppear");
    
    // Display deeplink data
    [self.deeplinkField setText:[[NSUserDefaults standardUserDefaults] objectForKey:DEEPLINK]];
    [self.passthroughField setText:[[NSUserDefaults standardUserDefaults] objectForKey:PASSTHROUGH]];
    [self.isDeferredField setText:[[NSUserDefaults standardUserDefaults] objectForKey:IS_DEFERRED]];
    [self.openURLField setText:[[NSUserDefaults standardUserDefaults] objectForKey:OPENURL]];

}

- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"viewDidDisappear");
    NSLog(@"Clearing Link Data");
    
    // Clear the deeplink data so they are not used again.
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:DEEPLINK];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:PASSTHROUGH];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:IS_DEFERRED];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:OPENURL];
}

@end
