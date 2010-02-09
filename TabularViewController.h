//
//  TabularViewController.h
//  Scorius
//
//  Created by Chad Berkley on 1/28/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LeftTableDataSource.h"
#import "TwoDArray.h"
#import "TwoDTableViewController.h"

@interface TabularViewController : UIViewController	<UIScrollViewDelegate>
{
	IBOutlet UITableView *leftTableView;
	IBOutlet UIScrollView *rightScrollView;
	IBOutlet UIScrollView *mainScrollView;
	
	NSArray *leftTableViewItems;
	TwoDArray *rightTableViewItems;
	
	LeftTableDataSource *leftTableViewDataSource;
	TwoDTableViewController *rightTableViewController;
}

@property (nonatomic, retain) IBOutlet UITableView *leftTableView;
@property (nonatomic, retain) IBOutlet UIScrollView *rightScrollView;
@property (nonatomic, retain) IBOutlet UIScrollView *mainScrollView;
@property (nonatomic, retain) NSArray *leftTableViewItems;
@property (nonatomic, retain) TwoDArray *rightTableViewItems;
@property (nonatomic, retain) LeftTableDataSource *leftTableViewDataSource;
@property (nonatomic, retain) TwoDTableViewController *rightTableViewController;

@end
