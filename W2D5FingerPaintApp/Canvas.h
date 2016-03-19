//
//  Canvas.h
//  W2D5FingerPaintApp
//
//  Created by Karlo Pagtakhan on 03/18/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
  Draw,
  Erase
} CanvasDrawMode;

@interface Canvas : UIView
@property (nonatomic,strong) UIColor *color;
@property (nonatomic,assign) CanvasDrawMode mode;


-(void)newCanvas;
@end
