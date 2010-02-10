//
//  TabularViewController.m
//  Scorius
//
//  Created by Chad Berkley on 1/28/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "TabularViewController.h"
#import "LeftTableDataSource.h"
#import "TabularViewConstants.h"

@implementation TabularViewController

@synthesize rightScrollView, leftTableView, leftTableViewItems, rightTableViewItems,
  leftTableViewDataSource, rightTableViewController, mainScrollView, rightTableViewHeaders,
  leftTableHeader;

/*
 * initialize with a nib
 */
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
	{
		return self;
	}
	return self;
}

/*
 * load the view
 */
- (void) viewDidLoad
{
	if(self.leftTableViewDataSource == nil)
	{
		self.leftTableViewDataSource = [[LeftTableDataSource alloc] init];
	}

	if(self.rightTableViewController == nil)
	{
		self.rightTableViewController = [[TwoDTableViewController alloc] initWithDataSource:self.rightTableViewItems];
	}
		
	self.leftTableView.dataSource = self.leftTableViewDataSource;
	self.leftTableViewDataSource.items = self.leftTableViewItems;
	self.leftTableView.delegate = self.leftTableViewDataSource;
	
	self.leftTableViewDataSource.tableView = self.leftTableView;
	self.leftTableViewDataSource.currentTopRow = 0;
	self.leftTableViewDataSource.rightTableViewController = self.rightTableViewController;
	self.leftTableViewDataSource.rightScrollView = self.rightScrollView;
	CGSize leftTableViewSize = [self.leftTableViewDataSource getTableSize];
	//set the size and position of the left table view 
	self.leftTableView.frame = CGRectMake(0, 0, leftTableViewSize.width, leftTableViewSize.height + 50);
	self.leftTableViewDataSource.header = self.leftTableHeader;
	
	self.leftTableView.scrollEnabled = NO;
	//set size and position of main scroll view
	CGSize mainScrollViewContentSize = CGSizeMake(320, leftTableViewSize.height + cellHeight);
	self.mainScrollView.contentSize = mainScrollViewContentSize;
	self.mainScrollView.directionalLockEnabled = YES;
	self.mainScrollView.delegate = self;
  self.mainScrollView.frame = CGRectMake(0, 0, 320, viewHeight);
	
	[self.rightScrollView addSubview:rightTableViewController.view];
	//set the size of the right scrollable area
	self.rightScrollView.contentSize = self.rightTableViewController.contentSize;
	self.rightScrollView.pagingEnabled = NO;
	self.rightScrollView.bounces = YES;
	self.rightTableViewController.rightTableDataSource.columnHeaders = self.rightTableViewHeaders;
	//set the size and location of the right scroll view
	self.rightScrollView.frame = CGRectMake(120, 0, 
																					200, 
																					[rightTableViewController.dataSource countRows] * cellHeight + 50);
	
	
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	//NSLog(@"scrolling main scroll view");
}

@end
