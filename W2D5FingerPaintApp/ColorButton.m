//
//  ColorButton.m
//  W2WECustomControls
//
//  Created by Karlo Pagtakhan on 03/20/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "ColorButton.h"


@implementation ColorButton

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.bounds.size.width /2;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor blackColor].CGColor;
  }
  return self;
}
-(void)onSelect{
  if (self.selected) {
    CGPoint center = self.center;
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetHeight(self.frame)/1.5, CGRectGetWidth(self.frame)/1.5)];
    self.layer.cornerRadius = self.bounds.size.width / 2;
    [self setCenter:center];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.selected = NO;
    
  } else{
    CGPoint center = self.center;
    [self setFrame:CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetHeight(self.frame)*1.5, CGRectGetWidth(self.frame)*1.5)];
    self.layer.cornerRadius = self.bounds.size.width / 2;
    [self setCenter:center];
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.selected = YES;
    
  }
}

@end
