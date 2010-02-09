//
//  GameViewController.h
//  Scorius
//
//  Created by Chad Berkley on 1/16/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "TwoDArray.h"

@interface GameViewController : UIViewController 
{
	IBOutlet UILabel *courseNameLabel;
	Game *game;
	IBOutlet UIView *mainViewController;
}

@property (nonatomic, retain) IBOutlet UILabel *courseNameLabel;
@property (nonatomic, retain) Game *game;
@property (nonatomic, retain) UIView *mainViewController;

- (TwoDArray*) getTwoDArray;
- (NSArray*) getRowHeaderArray;

@end
