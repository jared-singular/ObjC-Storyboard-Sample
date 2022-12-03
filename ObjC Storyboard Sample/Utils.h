//
//  Utils.h
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import <UIKit/UIKit.h>

@interface Utils : NSObject

+ (BOOL)isEmptyOrNull:(NSString *)text;
+ (void)displayMessage:(NSString*) message withView:(UIViewController*) view;

@end
