//
//  TabularViewController.m
//  Scorius
//
//  Created by Chad Berkley on 1/28/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "TabularViewController.h"
#import "LeftTableDataSource.h"

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
	
	self.leftTableView.scrollEnabled = NO;
	//CGSize mainScrollViewSize = CGSizeMake(1000, leftTableView.contentSize.width);
	CGSize mainScrollViewSize = CGSizeMake(320, 1000);
	self.mainScrollView.contentSize = mainScrollViewSize;
	self.mainScrollView.directionalLockEnabled = YES;
	self.mainScrollView.delegate = self;
	
	[self.rightScrollView addSubview:rightTableViewController.view];
	//self.rightScrollView.delegate = self.rightTableViewController.rightTableDataSource;
	self.rightScrollView.contentSize = self.rightTableViewController.contentSize;
	self.rightScrollView.pagingEnabled = NO;
	self.rightScrollView.bounces = YES;
	NSLog(@"right scroll pane content width: %f  height: %f", self.rightScrollView.contentSize.width, self.rightScrollView.contentSize.height);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	NSLog(@"scrolling main scroll view");
}

@end
