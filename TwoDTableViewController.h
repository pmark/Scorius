//
//  TwoDTableViewController.h
//  Scorius
//
//  Created by Chad Berkley on 1/30/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoDArray.h"
#import "RightTableDataSource.h"

@interface TwoDTableViewController : UIViewController 
{
	TwoDArray *dataSource;
	NSMutableArray *tableViews;
	RightTableDataSource *rightTableDataSource;
	CGSize contentSize;
}

@property (nonatomic, retain) TwoDArray *dataSource;
@property (nonatomic, retain) NSMutableArray *tableViews;
@property (nonatomic, retain) RightTableDataSource *rightTableDataSource;
@property (nonatomic, assign) CGSize contentSize;

- (id)initWithDataSource:(TwoDArray*)ds;

@end
