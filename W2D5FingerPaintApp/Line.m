//
//  Line.m
//  W2D5FingerPaintApp
//
//  Created by Karlo Pagtakhan on 03/18/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "Line.h"

@implementation Line

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initLineWithColor:(UIColor *) color
             withLocation:(CGPoint)location
             withPrevious:(CGPoint)previousLocation{
    if (self = [super init]) {
      _previousLocation = previousLocation;
      _Location = location;
      _color = color;
    }
    return self;
}
@end
