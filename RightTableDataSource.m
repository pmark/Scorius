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
@synthesize dataSource;

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


@end
