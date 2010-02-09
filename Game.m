//
//  Game.m
//  Scorius
//
//  Created by Chad Berkley on 1/15/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "Game.h"


@implementation Game
@synthesize gameId, date, timestamp, description, courseId;

- (Course *)getCourse
{
	return [[DatabaseUtil getInstance] getCourseForId:self.courseId];
}


@end
