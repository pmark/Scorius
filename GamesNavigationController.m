//
//  GamesNavigationController.m
//  Scorius
//
//  Created by Chad Berkley on 1/15/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "GamesNavigationController.h"
#import "GamesViewController.h"

@implementation GamesNavigationController

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
	GamesViewController *gamesViewController = [[GamesViewController alloc] init];
	[self pushViewController:gamesViewController animated:YES];
}

@end
