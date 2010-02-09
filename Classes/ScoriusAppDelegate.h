//
//  ScoriusAppDelegate.h
//  Scorius
//
//  Created by Chad Berkley on 12/29/09.
//  Copyright ucsb 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoriusAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
