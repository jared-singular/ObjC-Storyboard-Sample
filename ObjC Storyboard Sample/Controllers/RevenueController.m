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
    NSLog(@"-- RevenueController - viewDidLoad");
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:@"RevenueController" forKey:ATTRIBUTE_SNG_ATTR_CONTENT_TYPE];
    [dic setValue:@"2" forKey:ATTRIBUTE_SNG_ATTR_CONTENT_ID];
    [dic setValue:@"Revenue Method Buttons" forKey:ATTRIBUTE_SNG_ATTR_CONTENT];
    [Singular event:EVENT_SNG_CONTENT_VIEW withArgs:dic];
}


- (IBAction)iapCompleteMethodClicked:(id)sender {
    NSLog(@"iapCompleteMethod Button Clicked");
    
    // *** Get the SKPaymentTransaction* transaction object ***
    //SKPaymentTransaction* transaction = ...;
    
    // Send a transaction event to Singular without a custom event name
    //[Singular iapComplete:transaction];

    // Send a transaction event to Singular with a custom event name
    //[Singular iapComplete:transaction withName:@"MyCustomRevenue"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"iapComplete" message:@"Requires SKPaymentTransaction Data and this app can not simulate the event. Check RevenueController and Help Center for documentation." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
    
    // Sending a Custom Revenue Event only for notification purposes that the button was pressed.
    [Singular customRevenue:@"Needs_SKPaymentTransaction" currency:@"USD" amount:0.99];
}

- (IBAction)revenueMethodClicked:(id)sender {
    NSLog(@"-- revenueMethod Button Clicked");
    
    // Revenue with no product details
    [Singular revenue:@"USD" amount:1.99];

    // Send a Revenue Event with product details using the Revenue Method
    [Singular revenue:@"EUR" amount:5.00 productSKU:@"SKU1928375"
    productName:@"Reservation Fee" productCategory:@"Fee"
    productQuantity:1 productPrice:5.00];
}

- (IBAction)customRevenueMethodClicked:(id)sender {
    NSLog(@"-- customRevenueMethod Button Clicked");
    
    // Send a Custom Revenue Event with a custom name and no product details
    [Singular customRevenue:@"MyCustomRevenue" currency:@"USD" amount:1.99];

    // Send a Custom Revenue Event with product details using the Revenue Method
    [Singular customRevenue:@"MyCustomRevenue" currency:@"EUR"
    amount:5.00 productSKU:@"SKU1928375"
    productName:@"Reservation Fee" productCategory:@"Fee"
    productQuantity:1 productPrice:5.00];
}

@end
