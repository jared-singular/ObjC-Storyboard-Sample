//
//  EventsController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "EventsController.h"
#import "Singular.h"
#import "Utils.h"

@interface EventsController ()

@end

@implementation EventsController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"EventsController - viewDidLoad");
    // Do any additional setup after loading the view.
}


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
