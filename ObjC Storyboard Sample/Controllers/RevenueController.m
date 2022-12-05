//
//  RevenueController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "RevenueController.h"
#import "Singular.h"
#import "Utils.h"

@interface RevenueController ()

@end

@implementation RevenueController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"RevenueController - viewDidLoad");
    // Do any additional setup after loading the view.
}


- (IBAction)iapCompleteMethodClicked:(id)sender {
    NSLog(@"iapCompleteMethod Button Clicked");
}

- (IBAction)revenueMethodClicked:(id)sender {
    NSLog(@"revenueMethod Button Clicked");
}

- (IBAction)customRevenueMethodClicked:(id)sender {
    NSLog(@"customRevenueMethod Button Clicked");
}

@end
