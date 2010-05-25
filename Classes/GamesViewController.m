//
//  GamesViewController.m
//  Scorius
//
//  Created by Chad Berkley on 12/29/09.
//  Copyright 2009 ucsb. All rights reserved.
//

#import "GamesViewController.h"
#import "DatabaseUtil.h"
#import "Game.h"
#import "GameViewController.h"
#import "GameView.h"
#import "Course.h"

@implementation GamesViewController

@synthesize mainTableController, games;

- (void)viewDidLoad
{
  
	if(mainTableController == nil)
	{
		mainTableController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
	}
	
	self.games = [[DatabaseUtil getInstance] getGames];
	
	UITableView *gameMainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
	gameMainTableView.delegate = self;
	gameMainTableView.dataSource = self;
	
  [self.view addSubview:gameMainTableView];
}

/*
 * return the cells for the table
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Game *game = [self.games objectAtIndex:indexPath.row];

	UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0,0,100,100) reuseIdentifier:nil];		
	cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 100, 100)];
	Course *course = [[DatabaseUtil getInstance] getCourseForId:game.courseId];
	label.text = [NSString stringWithFormat:@"Game at %@ on %@", course.name, game.date];
	[label sizeToFit];
	[cell addSubview:label];
	return cell;
}

/*
 * number of rows in the section (table since we only have one section)
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.games count];
}

/*
 * user tapped a cell
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	Game *game = [self.games objectAtIndex:indexPath.row];
	GameViewController *newController = [[GameViewController alloc] initWithNibName:@"GameView" bundle:nil];
	newController.game = game;
	[game release];
	[self.navigationController pushViewController:newController animated:YES];
}

- (void) viewDidUnload
{
	[games release];
}

@end
