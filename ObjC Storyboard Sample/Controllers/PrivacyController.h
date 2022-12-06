//
//  PrivacyController.h
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PrivacyController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *gdpr;
@property (weak, nonatomic) IBOutlet UISwitch *limited_data_sharing;
@property (weak, nonatomic) IBOutlet UILabel *idfvValue;
@property (weak, nonatomic) IBOutlet UILabel *idfaValue;

@end

NS_ASSUME_NONNULL_END
