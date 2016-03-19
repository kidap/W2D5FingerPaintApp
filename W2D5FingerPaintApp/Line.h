//
//  Line.h
//  W2D5FingerPaintApp
//
//  Created by Karlo Pagtakhan on 03/18/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Line : UIView

@property (nonatomic,assign) CGPoint previousLocation;
@property (nonatomic,assign) CGPoint Location;
@property (nonatomic,assign) CGPoint velocity;
@property (nonatomic,strong) UIColor *color;

-(instancetype) initLineWithColor:(UIColor *) color
                     withLocation:(CGPoint)location
                     withPrevious:(CGPoint)previousLocation;
                     //withVelocity:(CGPoint)velocity;
@end
