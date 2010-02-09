//
//  2DArray.m
//  Scorius
//
//  Created by Chad Berkley on 1/28/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "TwoDArray.h"


@implementation TwoDArray

@synthesize array;

/*
 * init a TwoDArray with an row and column capacity
 */
- (id)initWithCapacity:(NSInteger)rows columns:(NSInteger)cols
{
	self.array = [[NSMutableArray alloc] initWithCapacity:rows];
	for(int i=0; i<rows; i++)
	{
		NSMutableArray *row = [[NSMutableArray alloc] initWithCapacity:cols];
		for(int j=0; j<cols; j++)
		{
			[row insertObject:@"" atIndex:j];
		}
		[self.array insertObject:row atIndex:i];
	}
	return self;
}

/*
 * get the value at a specified index
 */
- (NSObject*)getValue:(NSInteger)row column:(NSInteger)col
{
	NSMutableArray *a = (NSMutableArray*)[self.array objectAtIndex:row];
	return [a objectAtIndex:col];
}

/*
 * set the value at a specified index
 */
- (void)setValue:(NSObject*)value row:(NSInteger)r column:(NSInteger)c
{
	NSMutableArray *a = (NSMutableArray*)[self.array objectAtIndex:r];
	[a replaceObjectAtIndex:c withObject:value];
}

/*
 * return a single row as an array
 */
- (NSArray*)getRow:(NSInteger)row
{
	return (NSArray*)[self.array objectAtIndex:row];
}

/*
 * return a column as an array
 */
- (NSArray*)getColumn:(NSInteger)col
{
	NSMutableArray *result = [[NSMutableArray alloc]initWithCapacity:[self.array count]];
	for(int i=0; i<[self.array count]; i++)
	{
		NSArray *row = (NSArray*)[self.array objectAtIndex:i];
		NSObject *obj = [row objectAtIndex:col];
		[result insertObject:obj atIndex:i];
	}
	return result;
}

- (NSInteger)countRows
{
	return [self.array count];
}

- (NSInteger)countColumns
{
	NSMutableArray *a = (NSMutableArray*)[self.array objectAtIndex:0];
	return [a count];
}

@end
