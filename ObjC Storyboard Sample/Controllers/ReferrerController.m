//
//  ReferrerController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "ReferrerController.h"

@interface ReferrerController ()

@end

@implementation ReferrerController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ReferrerController - viewDidLoad");
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
- (IBAction)sharedClicked:(id)sender {
    NSLog(@"Share Link Button Clicked");
}

@end
