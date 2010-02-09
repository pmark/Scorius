//
//  Game.h
//  Scorius
//
//  Created by Chad Berkley on 1/15/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseUtil.h"
#import "Course.h"

@interface Game : NSObject {
		NSString *gameId;
		NSString *date;
		NSString *timestamp;
		NSString *description;
		NSString *courseId;
}

@property (nonatomic, retain) NSString *gameId;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *timestamp;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *courseId;

- (Course *)getCourse;

@end
