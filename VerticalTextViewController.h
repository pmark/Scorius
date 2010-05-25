//
//  VerticalTextViewController.h
//  Scorius
//
//  Created by Chad Berkley on 2/11/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VerticalTextViewController : UIViewController {
  NSString *text;
}

@property (nonatomic, retain) NSString *text;

- (id) initWithText:(NSString*)labelText;

@end
