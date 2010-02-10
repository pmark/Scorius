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
  leftTableViewDataSource, rightTableViewController, mainScrollView;

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
	self.leftTableView.frame = CGRectMake(0, -5, leftTableViewSize.width, leftTableViewSize.height);
	
	self.leftTableView.scrollEnabled = NO;
	CGSize mainScrollViewSize = CGSizeMake(320, leftTableViewSize.height + cellHeight);
	self.mainScrollView.contentSize = mainScrollViewSize;
	self.mainScrollView.directionalLockEnabled = YES;
	self.mainScrollView.delegate = self;
	
	[self.rightScrollView addSubview:rightTableViewController.view];
	self.rightScrollView.contentSize = self.rightTableViewController.contentSize;
	self.rightScrollView.pagingEnabled = NO;
	self.rightScrollView.bounces = YES;
	//self.rightScrollView.frame = CGRectMake(0, 0, 1000, 1000);
	CGRect fr = self.rightScrollView.frame;
	self.rightScrollView.frame = CGRectMake(fr.origin.x, fr.origin.y, 
																					200, 
																					[rightTableViewController.dataSource countRows] * cellHeight);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	//NSLog(@"scrolling main scroll view");
}

@end
