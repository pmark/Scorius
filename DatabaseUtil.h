//
//  DatabaseUtil.h
//  Scorius
//
//  Created by Chad Berkley on 1/15/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Course.h";

@interface DatabaseUtil : NSObject 
{
  sqlite3 *database;
}

@property (assign) sqlite3 *database;

+ (DatabaseUtil*) getInstance;
- (void)createEditableCopyOfDatabaseIfNeeded;
- (void)initializeDatabase;
- (NSArray*) getGames;
- (Course*) getCourseForId:(NSString*)courseId;

@end
