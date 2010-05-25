//
//  RightTableDataSource.m
//  Scorius
//
//  Created by Chad Berkley on 1/30/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "RightTableDataSource.h"
#import "TabularViewConstants.h"
#import "VerticalTextViewController.h"
#import "TabularViewConstants.h"
#import "TabularViewController.h"

@implementation RightTableDataSource
@synthesize dataSource, columnHeaders;

/*
 * get the cell for the index
 */
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

/*
 * number of sections
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

/*
 * height for the header row
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return headerHeight;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger) section
{
	
	NSInteger col = tableView.tag;
	NSString *text = [NSString stringWithFormat:@"%i", col];
	if([self.columnHeaders count] > col)
	{
		text = (NSString*)[self.columnHeaders objectAtIndex:col];
	}
	
	return [TabularViewController getRotatedLabel:text angle:-45];
}


@end
