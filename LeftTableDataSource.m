//
//  LeftTableDataSource.m
//  Scorius
//
//  Created by Chad Berkley on 1/28/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "LeftTableDataSource.h"
#import "TabularViewConstants.h"

@implementation LeftTableDataSource

@synthesize items, tableView, rightTableViewController, currentTopRow, rightScrollView;

/*
 * get a cell for an indexPath for te left table
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	//UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
	NSString *text = (NSString*)[items objectAtIndex:indexPath.row];
	//label.text = text;
	//[cell addSubview:label];
	//[label sizeToFit];
	cell.textLabel.text = text;
	return cell;
}

/*
 * return the number of rows in the left table
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [items count];
}

/*
 * return the height for the cells
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return cellHeight;
}

- (CGSize)getTableSize
{
	CGFloat length = [items count] * cellHeight;
	return CGSizeMake(120, length);
}

@end
