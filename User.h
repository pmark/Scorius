//
//  User.h
//  Scorius
//
//  Created by Chad Berkley on 1/16/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface User : NSObject {
  NSString *userId;
	NSString *firstName;
	NSString *lastName;
	NSString *userName;
	NSString *password;
	BOOL admin;
}

@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, assign) BOOL admin;

@end
