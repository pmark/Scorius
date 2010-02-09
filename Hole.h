//
//  Hole.h
//  Scorius
//
//  Created by Chad Berkley on 1/16/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Hole : NSObject {
  NSString *holeId;
	NSString *number; 
	NSString *par;
	NSString *courseId;
}

@property (nonatomic, retain) NSString *holeId;
@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSString *par;
@property (nonatomic, retain) NSString *courseId;


@end
