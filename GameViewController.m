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
	TabularViewController *tvc = [[TabularViewController alloc] initWithNibName:@"TabularViewer" bundle:nil];
	NSArray *array = [self getRowHeaderArray];
	tvc.leftTableViewItems = array;
	tvc.rightTableViewItems = [self getTwoDArray];
	[mainViewController	addSubview:tvc.view];
}

- (NSArray*) getRowHeaderArray
{
	NSMutableArray *a = [NSMutableArray arrayWithCapacity:10];
	for(int i=0; i<10; i++)
	{
		[a insertObject:[NSString stringWithFormat:@"row %i",i] atIndex:i];
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
