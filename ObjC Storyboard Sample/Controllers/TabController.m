//
//  TabController.m
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import "TabController.h"
#import "Singular.h"
#import "Utils.h"

@interface TabController ()

@end

@implementation TabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)openedWithDeeplink{
    // Display the DeeplinkController
    [self setSelectedIndex:4];
}

// Minimizes the keyboard when it's not needed
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
