//
//  Course.h
//  Scorius
//
//  Created by Chad Berkley on 1/16/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Course : NSObject {
  NSString *courseId;
	NSString *name;
	NSString *location;
}

@property (nonatomic, retain) NSString *courseId;
@property (nonatomic, retain) NSString *name;
@property	(nonatomic, retain) NSString *location;

@end
