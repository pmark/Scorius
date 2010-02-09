//
//  ScoriusAppDelegate.m
//  Scorius
//
//  Created by Chad Berkley on 12/29/09.
//  Copyright ucsb 2009. All rights reserved.
//

#import "ScoriusAppDelegate.h"
#import "DatabaseUtil.h"

@implementation ScoriusAppDelegate

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application 
{ 
	//create and open the db
	[[DatabaseUtil getInstance] createEditableCopyOfDatabaseIfNeeded];
	[[DatabaseUtil getInstance] initializeDatabase];
	
  [window addSubview:tabBarController.view];
}

- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

