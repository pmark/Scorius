//
//  2DArray.h
//  Scorius
//
//  Created by Chad Berkley on 1/28/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TwoDArray : NSObject {
  NSMutableArray *array;
}

@property (nonatomic, retain) NSMutableArray *array;

- (id)initWithCapacity:(NSInteger)rows columns:(NSInteger)cols;
- (void)setValue:(NSObject*)value row:(NSInteger)r column:(NSInteger)c;
- (NSObject*)getValue:(NSInteger)row column:(NSInteger)col;
- (NSArray*)getColumn:(NSInteger)col;
- (NSArray*)getRow:(NSInteger)row;
- (NSInteger)countColumns;
- (NSInteger)countRows;
@end
