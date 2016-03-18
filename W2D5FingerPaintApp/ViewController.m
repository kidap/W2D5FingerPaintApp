//
//  ViewController.m
//  W2D5FingerPaintApp
//
//  Created by Karlo Pagtakhan on 03/18/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *colorSegmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)colorPicked:(id)sender {
  switch (self.colorSegmentedControl.selectedSegmentIndex) {
    case 0:
      [[NSNotificationCenter defaultCenter] postNotificationName:@"colorSelected" object:[UIColor blackColor]];
      break;
    case 1:
      [[NSNotificationCenter defaultCenter] postNotificationName:@"colorSelected" object:[UIColor redColor]];
      break;
    case 2:
      [[NSNotificationCenter defaultCenter] postNotificationName:@"colorSelected" object:[UIColor blueColor]];
      break;
      
    default:
      break;
  }
}

@end
