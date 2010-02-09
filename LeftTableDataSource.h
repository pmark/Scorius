//
//  LeftTableDataSource.h
//  Scorius
//
//  Created by Chad Berkley on 1/28/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoDTableViewController.h"

@interface LeftTableDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>
{
  NSArray *items;
	UITableView *tableView;
	TwoDTableViewController *rightTableViewController;
	NSInteger currentTopRow;
	UIScrollView *rightScrollView;
}

@property (nonatomic, retain) NSArray *items;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) TwoDTableViewController *rightTableViewController;
@property (nonatomic, assign) NSInteger currentTopRow;
@property (nonatomic, assign) UIScrollView *rightScrollView;

@end
