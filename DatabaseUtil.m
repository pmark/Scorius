//
//  DatabaseUtil.m
//  Scorius
//
//  Created by Chad Berkley on 1/15/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "DatabaseUtil.h"
#import "ScoriusConstants.h"
#import "Game.h"

/*
 * This is a singleton class used to perform ops on the sqlite database
 * to use it, get an instance of this class with getInstance() then 
 * call the methods.  Do not create more than once instance of this class.
 */
@implementation DatabaseUtil

@synthesize database;

static DatabaseUtil *singletonInstance = nil;

/*
 * get a singleton instance of this class
 */
+ (DatabaseUtil*) getInstance
{
	@synchronized(self)
	{
		if(singletonInstance == nil)
		{
			singletonInstance = [[self alloc] init];
		}
		return singletonInstance;
	}
	return nil;
}

/*
 * get an array of Games from the db
 */
- (NSArray*) getGames
{
	NSMutableArray *games = [[NSMutableArray alloc] init];
	NSString *query = @"select game_id, course_id, date, timestamp, description from games";
  sqlite3_stmt *statement;
	const char *sql = [query cStringUsingEncoding:NSASCIIStringEncoding];
	if(sqlite3_prepare_v2(database, sql, -1, &statement, NULL) != SQLITE_OK)
	{
		NSLog(@"Error returning statement from string query");
	}
	
	while(sqlite3_step(statement) == SQLITE_ROW)
	{
		Game *game = [[Game alloc] init];
		game.gameId = [NSString stringWithFormat:@"%i",sqlite3_column_int(statement, 0)];
		game.courseId = [NSString stringWithFormat:@"%i",sqlite3_column_int(statement, 1)];
		game.date = [NSString stringWithFormat:@"%s",sqlite3_column_text(statement, 2)];
		game.timestamp = [NSString stringWithFormat:@"%s",sqlite3_column_text(statement, 3)];
		game.description = [NSString stringWithFormat:@"%s",sqlite3_column_text(statement, 4)];
		[games addObject:game];
		[game release];
	}
	sqlite3_finalize(statement);

	return games;
}

- (Course *) getCourseForId:(NSString*)courseId
{
	Course *course = [[Course alloc] init];
	NSString *query = [NSString stringWithFormat:@"select course_id, name, location from courses where course_id = %@", courseId];
  sqlite3_stmt *statement;
	const char *sql = [query cStringUsingEncoding:NSASCIIStringEncoding];
	if(sqlite3_prepare_v2(database, sql, -1, &statement, NULL) != SQLITE_OK)
	{
		NSLog(@"Error returning statement from string query");
	}
	
	while(sqlite3_step(statement) == SQLITE_ROW)
	{
		course.courseId = [NSString stringWithFormat:@"%i",sqlite3_column_int(statement, 0)];
		course.name = [NSString stringWithFormat:@"%s",sqlite3_column_text(statement, 1)];
		course.location = [NSString stringWithFormat:@"%s",sqlite3_column_text(statement, 2)];
	}		
	return course;
}

/*
 * create the database, this should be called only once from the appDelegate
 */
- (void)createEditableCopyOfDatabaseIfNeeded 
{
	BOOL success;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:DATABASE_NAME];
	success = [fileManager fileExistsAtPath:writableDBPath];
	if(success) return;
	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DATABASE_NAME];
	success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
	if(!success)
	{
		NSAssert1(0, @"Failed to create writable database file with message '%s'.", [error localizedDescription]);
	}
}

/*
 * init the database.  should be called only once from the appDelegate
 */
- (void) initializeDatabase
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:DATABASE_NAME];
	if(sqlite3_open([path UTF8String], &database) != SQLITE_OK)  
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}
}


@end
