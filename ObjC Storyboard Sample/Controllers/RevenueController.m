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
    
    // Get the SKPaymentTransaction* transaction object
    
    // Send a transaction event to Singular
    //[Singular iapComplete:transaction];

    // Send a transaction event to Singular with a custom name for the event
    //[Singular iapComplete:transaction withName:@"MyCustomRevenue"];
    
    [Singular customRevenue:@"Needs_SKPaymentTransaction" currency:@"USD" amount:0.99];
    
    // Alert Message
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"iapComplete" message:@"Requires SKPaymentTransaction Data and this app can not simulate the event. Check RevenueController and Help Center for documentation." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
    
}

- (IBAction)revenueMethodClicked:(id)sender {
    NSLog(@"revenueMethod Button Clicked");
    
    // Revenue Method with product details
    [Singular revenue:@"EUR" amount:5.00 productSKU:@"SKU1928375"
    productName:@"Reservation Fee" productCategory:@"Fee"
    productQuantity:1 productPrice:5.00];
}

- (IBAction)customRevenueMethodClicked:(id)sender {
    NSLog(@"customRevenueMethod Button Clicked");
    
    // Custom Revenue with a custom name and product details
    [Singular customRevenue:@"MyCustomRevenue" currency:@"EUR"
    amount:5.00 productSKU:@"SKU1928375"
    productName:@"Reservation Fee" productCategory:@"Fee"
    productQuantity:1 productPrice:5.00];
}

@end
