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
@property (strong, nonatomic) IBOutlet UISegmentedControl *modeSegmentedControl;
@property (strong, nonatomic) NSMutableSet *textFieldsOnScreen;

@end

@implementation ViewController
//MARK: View Controller methods
- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self prepareView];
  [self setColorFromSegmentedControl:self.colorSegmentedControl];
  [self modeSelected:self.modeSegmentedControl];
}
- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

//MARK:Prepare View
-(void)prepareView{
  self.textFieldsOnScreen = [[NSMutableSet alloc] init];
}

//MARK:IBActions
- (IBAction)colorPicked:(id)sender {
  [self setColorFromSegmentedControl:sender];
}
- (IBAction)modeSelected:(id)sender {
  [self setModeFromSegmentedControl:sender];
}
- (IBAction)newCanvasButton:(id)sender {
  [self.canvasView newCanvas];
  //Remove all added textfields
  for(UITextField *textField in self.textFieldsOnScreen) {
    [textField removeFromSuperview];
  }
  [self.textFieldsOnScreen removeAllObjects];
}

- (IBAction)addTextField:(id)sender {
  UITextField *textField1 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame), 300, 60)];
  
  [textField1 setBorderStyle:UITextBorderStyleNone];
  [textField1 setText:@"Text"];
  [textField1 invalidateIntrinsicContentSize];
  [textField1 setTextColor:self.canvasView.color];
  textField1.delegate = self;
  
  [self.view addSubview:textField1];
  [self.textFieldsOnScreen addObject:textField1];
  
  UIPanGestureRecognizer *panTextField = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panTextAdded:)];
  [textField1 addGestureRecognizer:panTextField];
}
//MARK: Gestures
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
//MARK: Textfield delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
  [textField resignFirstResponder];
  return YES;
}
//MARK: Help methods

-(void) setColorFromSegmentedControl:(UISegmentedControl *)segmentControl{
  switch (segmentControl.selectedSegmentIndex) {
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
-(void)setModeFromSegmentedControl:(UISegmentedControl *)segmentControl{
  self.canvasView.mode = segmentControl.selectedSegmentIndex;
}

  @end
