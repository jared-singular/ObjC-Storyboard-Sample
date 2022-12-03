//
//  EventsController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "EventsController.h"

@interface EventsController ()

@end

@implementation EventsController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"EventsController - viewDidLoad");
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
- (IBAction)sng_level_achievedClicked:(id)sender {
    NSLog(@"sng_level_achieved Button Clicked");
}

- (IBAction)sng_add_to_cartClicked:(id)sender {
    NSLog(@"sng_add_to_cart Button Clicked");
}

- (IBAction)customEventClicked:(id)sender {
    NSLog(@"customEvent Button Clicked");
}


@end
