//
//  SceneDelegate.h
//  ObjC Storyboard Sample
//
//  Created by Jared Ornstead on 12/2/22.
//

#import <UIKit/UIKit.h>
#import "TabController.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;
@property(nonatomic, readonly) UITabBar *tabBar;


@end

