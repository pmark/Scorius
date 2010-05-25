//
//  GameViewController.m
//  Scorius
//
//  Created by Chad Berkley on 1/16/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "GameViewController.h"
#import "Course.h"
#import "TabularViewController.h"
#import "TwoDArray.h"

@implementation GameViewController

@synthesize courseNameLabel, game, mainViewController;

/*
 * load the view
 */
- (void)viewDidLoad 
{
	[super viewDidLoad];
	Course *course = [self.game getCourse];
	self.courseNameLabel.text = [NSString stringWithFormat:@"Game at %@ on %@", course.name, game.date];
	[self.courseNameLabel sizeToFit];
	TabularViewController *tvc = [[TabularViewController alloc] init];
	NSArray *array = [self getRowHeaderArray];
	tvc.rightTableViewHeaders = [self getRightTableHeaderArray];
	tvc.leftTableViewItems = array;
	tvc.leftTableHeader = @"HoleXXX";
	tvc.rightTableViewItems = [self getTwoDArray];
	tvc.leftTableWidth = 50;
	[mainViewController	addSubview:tvc.view];
}

- (NSArray*) getRightTableHeaderArray
{
	NSMutableArray *a = [NSMutableArray arrayWithCapacity:10];
	[a insertObject:[NSString stringWithFormat:@"Chad"] atIndex:0];
	[a insertObject:[NSString stringWithFormat:@"Mark"] atIndex:1];
	[a insertObject:[NSString stringWithFormat:@"Paige"] atIndex:2];
	[a insertObject:[NSString stringWithFormat:@"Andrea"] atIndex:3];
	[a insertObject:[NSString stringWithFormat:@"Matthew"] atIndex:4];
	[a insertObject:[NSString stringWithFormat:@"Josh"] atIndex:5];
	[a insertObject:[NSString stringWithFormat:@"Dan"] atIndex:6];
	[a insertObject:[NSString stringWithFormat:@"Kelly"] atIndex:7];
	[a insertObject:[NSString stringWithFormat:@"Elowah"] atIndex:8];
	[a insertObject:[NSString stringWithFormat:@"Christopher"] atIndex:9];

	return a;
}

- (NSArray*) getRowHeaderArray
{
	NSMutableArray *a = [NSMutableArray arrayWithCapacity:10];
	for(int i=0; i<10; i++)
	{
		[a insertObject:[NSString stringWithFormat:@"%i",i] atIndex:i];
	}
	return a;
}

/*
 * create a test array of values
 */
- (TwoDArray*)getTwoDArray
{
	NSInteger numrows = 10;
	NSInteger numcols = 10;
	TwoDArray *mainArray = [[TwoDArray alloc] initWithCapacity:numrows columns:numcols];
	for(int i=0; i<numrows; i++)
	{
		for(int j=0; j<numcols; j++)
		{
			NSString *val = [NSString stringWithFormat:@"%i,%i",i,j];
			[mainArray setValue:val row:i column:j];
		}
	}
	return mainArray;
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc 
{
    [super dealloc];
}


@end
