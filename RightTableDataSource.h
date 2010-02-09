//
//  RightTableDataSource.h
//  Scorius
//
//  Created by Chad Berkley on 1/30/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoDArray.h"

@interface RightTableDataSource : NSObject <UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate> 
{
  TwoDArray *dataSource;
}

@property (nonatomic, retain) TwoDArray *dataSource;

@end
