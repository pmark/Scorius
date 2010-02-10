//
//  RightTableDataSource.m
//  Scorius
//
//  Created by Chad Berkley on 1/30/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "RightTableDataSource.h"
#import "TabularViewConstants.h"

@implementation RightTableDataSource
@synthesize dataSource, columnHeaders;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger col = tableView.tag;
	NSInteger row = indexPath.row;
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell.textLabel.text = (NSString*)[dataSource getValue:row column:col];
	return cell;
}

/*
 * return the number of rows in the left table
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [dataSource countRows];
}

/*
 * return the height for the cells
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return cellHeight;
}

/*
 * return column headers for the right table
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSInteger col = tableView.tag;
	if([self.columnHeaders count] > col)
	{
		return (NSString*)[self.columnHeaders objectAtIndex:col];
	}
	else 
	{
		return [NSString stringWithFormat:@"%i", col];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	//TODO: should not have to hack this with a +5....
	return headerHeight + 5;
}

@end
