//
//  DeeplinkController.h
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeeplinkController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *deeplinkField;
@property (weak, nonatomic) IBOutlet UILabel *passthroughField;
@property (weak, nonatomic) IBOutlet UILabel *isDeferredField;
@property (weak, nonatomic) IBOutlet UILabel *openURLField;

@end

NS_ASSUME_NONNULL_END
