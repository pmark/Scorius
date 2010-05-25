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
  leftTableHeader, leftTableWidth;

/*
 * initialize with a nib
 */
- (id) init 
{
	if(self = [super initWithNibName:@"TabularViewer" bundle:nil])
	{
		leftTableWidth = 120;
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
	self.leftTableViewDataSource.leftTableWidth = self.leftTableWidth;
	self.leftTableViewDataSource.currentTopRow = 0;
	self.leftTableViewDataSource.rightTableViewController = self.rightTableViewController;
	self.leftTableViewDataSource.rightScrollView = self.rightScrollView;
	CGSize leftTableViewSize = [self.leftTableViewDataSource getTableSize];
	//set the size and position of the left table view 
	self.leftTableView.frame = CGRectMake(0, 0, leftTableWidth, leftTableViewSize.height + 50);
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
	self.rightScrollView.frame = CGRectMake(leftTableWidth, 0, 
																					320 - leftTableWidth, 
																					[rightTableViewController.dataSource countRows] * cellHeight + 50);
	
	
}

/*
 * return a label with text rotated 
 */
+ (UIView*) getRotatedLabel:(NSString*)text angle:(CGFloat)rotation
{
	UIView *newview = [[UIView alloc] init];
	UILabel *label = [[UILabel alloc] init];
	label.text = text;
	label.adjustsFontSizeToFitWidth = YES;
	//label.backgroundColor = [UIColor grayColor];
	label.textColor = [UIColor blackColor];
	label.opaque = NO;
	[label sizeToFit];
	[newview addSubview:label];
	newview.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(-55));
	newview.bounds = CGRectMake(30,-30, 0, 0);
	return newview;
}

/*
 * return a reversed string
 */
+ (NSString*) reverseText:(NSString*)text
{
	return @"";
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	//NSLog(@"scrolling main scroll view");
}

@end
