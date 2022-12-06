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
    
    // Send Simple Event without arguments
    [Singular event:EVENT_SNG_LEVEL_ACHIEVED];
    
}

- (IBAction)sng_add_to_cartClicked:(id)sender {
    NSLog(@"sng_add_to_cart Button Clicked");
    
    // Create arguments for Event
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"100% Organic Cotton Mixed Plaid Flannel Shirt" forKey:ATTRIBUTE_SNG_ATTR_ITEM_DESCRIPTION];
    [dic setValue:@"$69.95" forKey:ATTRIBUTE_SNG_ATTR_ITEM_PRICE];
    [dic setValue:@"5 Star" forKey:ATTRIBUTE_SNG_ATTR_RATING];
    [dic setValue:@"Flannel Shirt" forKey:ATTRIBUTE_SNG_ATTR_SEARCH_STRING];
    [dic setValue:@"https://www.gap.com/browse/product.do?pid=488359012&cid=11900&pcid=11900&vid=1&cpos=5&cexp=2859&kcid=CategoryIDs%3D11900&cvar=25416&ctype=Listing&cpid=res22120510129881629780811#pdp-page-content" forKey:ATTRIBUTE_SNG_ATTR_DEEP_LINK];
    
    // Send Event with arguments
    [Singular event:EVENT_SNG_ADD_TO_CART withArgs:dic];
    
}

- (IBAction)customEventClicked:(id)sender {
    NSLog(@"customEvent Button Clicked");
    
    // Custom Event names must be <= 32 characters
    NSString* customEventName = @"my_custom_event_name";
    NSMutableDictionary *customArgs = [[NSMutableDictionary alloc] init];
    [customArgs setValue:@"value1" forKey:@"key1"];
    [customArgs setValue:@"value2" forKey:@"key2"];
    [Singular event:customEventName withArgs:customArgs];
    
}


- (IBAction)userIDField:(id)sender {
}
@end
