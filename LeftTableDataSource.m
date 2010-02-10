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

@synthesize items, tableView, rightTableViewController, currentTopRow, rightScrollView, header;

/*
 * get a cell for an indexPath for te left table
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	NSString *text = (NSString*)[items objectAtIndex:indexPath.row];
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

/*
 * get the size of the table
 */
- (CGSize)getTableSize
{
	CGFloat length = [items count] * cellHeight;
	return CGSizeMake(120, length);
}

/*
 * number of sections in the TV
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

//uncomment this to make a vertical separator between the left table and right table
/*- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
	NSMutableArray *headers = [[NSMutableArray alloc] initWithCapacity:1];
	NSString *header = @"";
	[headers addObject:header];
	return headers;
}*/

/*
 * get the title for the table
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if(self.header != nil)
	{
		return header;
	}
	
	return @"";
}

/*
 * set the header height
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return headerHeight;
}

@end
