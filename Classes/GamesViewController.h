//
//  GamesViewController.h
//  Scorius
//
//  Created by Chad Berkley on 12/29/09.
//  Copyright 2009 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameMainTableView.h"

@interface GamesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> 
{
	UITableViewController *mainTableController;
	NSArray *games;
}

@property (nonatomic, retain) UITableViewController *mainTableController;
@property (nonatomic, retain) NSArray *games;

@end
