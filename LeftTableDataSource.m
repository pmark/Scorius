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

/*- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	//NSLog(@"Scrolling");
	NSArray *visiblePaths = [self.tableView indexPathsForVisibleRows];
	NSIndexPath *ip = (NSIndexPath*)[visiblePaths objectAtIndex:0];
	NSLog(@"row at top: %i",ip.row);
	NSInteger row = ip.row;
	if(self.currentTopRow != row)
	{ //if the top row changes, scroll the other scroll view
		//[self.rightTableViewController scrollTo:ip];		
		CGRect bounds = scrollView.bounds;
		CGFloat x = self.rightScrollView.bounds.origin.x;
		CGFloat y = bounds.origin.y;
		NSLog(@"scrolling rightScrollView to %f, %f",x,y);
		[self.rightScrollView scrollRectToVisible:CGRectMake(x,y,self.rightScrollView.bounds.size.width,self.rightScrollView.bounds.size.height) animated:YES];
	}
	//[self.rightScrollView scrollRectToVisible:CGRectMake(499,499,1,1) animated:YES];
	
}*/

@end
