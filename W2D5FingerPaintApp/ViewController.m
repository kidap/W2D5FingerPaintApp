//
//  ViewController.m
//  W2D5FingerPaintApp
//
//  Created by Karlo Pagtakhan on 03/18/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "ViewController.h"
#import "Canvas.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UISegmentedControl *colorSegmentedControl;
@property (strong, nonatomic) IBOutlet Canvas *canvasView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self setColorFromSegmentedControl];
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)colorPicked:(id)sender {
  [self setColorFromSegmentedControl];
}
-(void) setColorFromSegmentedControl{
  switch (self.colorSegmentedControl.selectedSegmentIndex) {
    case 0:
      self.canvasView.color = [UIColor blackColor];
      break;
    case 1:
      self.canvasView.color = [UIColor redColor];
      break;
    case 2:
      self.canvasView.color = [UIColor blueColor];
      break;
    case 3:
      self.canvasView.color = [UIColor purpleColor];
      break;
    case 4:
      self.canvasView.color = [UIColor grayColor];
      break;
      
    default:
      break;
  }
}
- (IBAction)addTextField:(id)sender {
  UITextField *textField1 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame), 300, 60)];
  
  [textField1 setBorderStyle:UITextBorderStyleNone];
  [textField1 setText:@"Text"];
  [textField1 sizeToFit];
  textField1.delegate = self;
  
  [self.view addSubview:textField1];
  
  UIPanGestureRecognizer *panTextField = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panTextAdded:)];
  [textField1 addGestureRecognizer:panTextField];
}
-(void)panTextAdded:(UIPanGestureRecognizer *)recognizer{
  switch (recognizer.state) {
    case UIGestureRecognizerStateBegan:
    case UIGestureRecognizerStateChanged:
    case UIGestureRecognizerStateEnded:
      recognizer.view.center = [recognizer locationInView:self.view];
      break;
      
    default:
      break;
  }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
  [textField resignFirstResponder];
  return YES;
}

@end
