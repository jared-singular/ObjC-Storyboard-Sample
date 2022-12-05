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


- (IBAction)sharedClicked:(id)sender {
    NSLog(@"Share Link Button Clicked");
}

@end
