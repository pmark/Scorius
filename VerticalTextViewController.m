//
//  VerticalTextViewController.m
//  Scorius
//
//  Created by Chad Berkley on 2/11/10.
//  Copyright 2010 ucsb. All rights reserved.
//

#import "VerticalTextViewController.h"
#import "TabularViewConstants.h"

@implementation VerticalTextViewController

@synthesize text;

NSInteger letterWidth = 10;
NSInteger letterHeight = 15;


/*
 0 1 2 3 4 5 n
 1           X
 2         X
 3       E
 4     L
 5   O
 n H
 
 
 */

- (id) initWithText:(NSString*)labelText
{
	if(self = [super init])
	{
		self.text = labelText;
	}
	
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
	label.text = self.text;
	[self.view addSubview:label];
  //rotate the view here
	self.view.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(45));
	return self;
}

/*
- (UIView*)verticalLabel
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,letterWidth,[text length] * letterHeight)];
	for(int i=0; i<[text length]; i++)
	{
		NSRange range = NSMakeRange(i, 1);
		NSString *c = [text substringWithRange:range];
		UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(letterWidth * i, (([text length] - 1) - i) * letterHeight, letterWidth, letterHeight)];
		l.font = [UIFont fontWithName:@"Courier" size:12];
		l.text = c;
		[view addSubview:l];
	}
	return view;
}
*/
 
@end
