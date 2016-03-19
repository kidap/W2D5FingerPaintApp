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

@interface Canvas()
@property (nonatomic,strong) NSMutableArray *lines;
@property (nonatomic,strong) NSMutableArray *collectionOfPath;

@end
@implementation Canvas

//MARK: Initializer
- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    _lines = [[NSMutableArray alloc] init];
    _color = [UIColor blackColor];
    _collectionOfPath = [[NSMutableArray alloc] init];
  }
  return self;
}

//MARK: Touches
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  self.lines = [NSMutableArray new];
  [self createLineWithTouches:touches];
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  [self createLineWithTouches:touches];
  
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  [self.collectionOfPath addObject:[self.lines copy]];
  [self.lines removeAllObjects];
}

//MARK: Line
-(void)createLineWithTouches:(NSSet<UITouch *> *)touches{
  //Instantiate and save line
  UITouch *touch = [touches anyObject];
  Line *line = [[Line alloc] initLineWithColor:self.color
                                  withLocation:[touch locationInView:self]
                                  withPrevious:[touch previousLocationInView:self]];
  [self.lines addObject:line];
  [self setNeedsDisplay];
  
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  
  //Stroke Previous lines saved
  for (NSMutableArray *linesArray in self.collectionOfPath) {
    UIBezierPath *bezeirPath2 = [UIBezierPath bezierPath];
    bezeirPath2.lineCapStyle = kCGLineCapRound;
    bezeirPath2.lineWidth = 10;
    
    for (Line *line in linesArray) {
      [line.color set];
      bezeirPath2.miterLimit=-20;
      [bezeirPath2 moveToPoint:line.previousLocation];
      [bezeirPath2 addLineToPoint:line.Location];
    }
    [bezeirPath2 strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
  }

  //Stroke current line drawn
  UIBezierPath *bezeirPath = [UIBezierPath bezierPath];
  bezeirPath.lineCapStyle = kCGLineCapRound;
  bezeirPath.lineWidth = 10;
  
  for (Line *line in self.lines) {
    [line.color set];
    bezeirPath.miterLimit=-20;
    [bezeirPath moveToPoint:line.previousLocation];
    [bezeirPath addLineToPoint:line.Location];
  }
  [bezeirPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
  
  
}



@end
