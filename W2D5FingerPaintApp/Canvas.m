//
//  Canvas.m
//  W2D5FingerPaintApp
//
//  Created by Karlo Pagtakhan on 03/18/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "Canvas.h"
#import "UIKit/UIKit.h"
#import "Line.h"
#import "AppDelegate.h"

@interface Canvas()
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,strong) UIColor *color;
@property (nonatomic, assign) BOOL helloWorld;
@end
@implementation Canvas

//MARK: Initializer
- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    _lines = [[NSMutableArray alloc] init];
    _color = [UIColor blackColor];
    _helloWorld = NO;
  }
  return self;
}

//MARK: Touches
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  //self.lines = [[NSMutableArray alloc] init];
  if(self.helloWorld){
    self.color = [UIColor redColor];
  } else{
    self.color = [UIColor blackColor];
    self.helloWorld = YES;
  }
  
  
  [self createLineWithTouches:touches];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  [self createLineWithTouches:touches];
  
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}

//MARK: Line
-(void)createLineWithTouches:(NSSet<UITouch *> *)touches{
  
  UITouch *touch = [touches anyObject];
  [self.lines addObject:[[Line alloc] initLineWithColor:self.color
                                           withLocation:[touch locationInView:self]
                                           withPrevious:[touch previousLocationInView:self]]];

  [self setNeedsDisplay];
  
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  // Drawing code
  UIBezierPath *bezeirPath = [UIBezierPath bezierPath];
  bezeirPath.lineCapStyle = kCGLineCapRound;
  bezeirPath.lineWidth = 10;
  
  //Curren line drawn
  for (Line *line in self.lines) {
    [line.color set];
    [bezeirPath moveToPoint:line.previousLocation];
    [bezeirPath addLineToPoint:line.Location];
  }
  
  [bezeirPath stroke];
  

  }

@end
