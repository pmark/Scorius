//
//  TwoDTableViewController.m
//  Scorius
//
//  Created by Chad Berkley on 1/30/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "TwoDTableViewController.h"
#import "TabularViewConstants.h"

@implementation TwoDTableViewController

@synthesize dataSource, tableViews, rightTableDataSource, contentSize;


/*
 * initialize with a 2D array data source
 */
- (id)initWithDataSource:(TwoDArray*)ds
{
	if(self = [super init])
	{
		self.dataSource = ds;
		self.rightTableDataSource = [[RightTableDataSource alloc] init];
		tableViews = [[NSMutableArray alloc] initWithCapacity:[self.dataSource countColumns]];
		for(int i=0; i<[self.dataSource countColumns]; i++)
		{ //initialize a UITableViewController for each of the columns
			UITableView *c = [[UITableView alloc] init];
			c.tag = i;
			c.scrollEnabled = NO;
			c.dataSource = self.rightTableDataSource;
			c.delegate = self.rightTableDataSource;
			[tableViews insertObject:c atIndex:i];
		}
		self.rightTableDataSource.dataSource = self.dataSource;
		
		NSInteger width = [self.dataSource countColumns] * rowWidth;
		//NSInteger height = cellHeight * [self.dataSource countColumns];
		NSInteger height = [self.dataSource countRows] * cellHeight;
		self.contentSize = CGSizeMake(width, height);
		self.view.frame = CGRectMake(0, 25, 200, viewHeight);
	}
	return self;
}

/*
 * create the view
 */
- (void)viewDidLoad
{
	for(int i=0; i<[self.tableViews count]; i++)
	{
		UITableView *tv = (UITableView*)[self.tableViews objectAtIndex:i];
		tv.frame = CGRectMake(i * cellHeight, -25, rowWidth, cellHeight * [self.dataSource countColumns] + 50);
		[self.view addSubview:tv];
	}
}

@end
