//
//  RevenueController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "RevenueController.h"

@interface RevenueController ()

@end

@implementation RevenueController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"RevenueController - viewDidLoad");
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
