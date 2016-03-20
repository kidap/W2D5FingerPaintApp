//
//  ViewController.m
//  W2D5FingerPaintApp
//
//  Created by Karlo Pagtakhan on 03/18/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "ViewController.h"
#import "Canvas.h"
#import "ColorButton.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UISegmentedControl *colorSegmentedControl;
@property (strong, nonatomic) IBOutlet Canvas *canvasView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *modeSegmentedControl;
@property (strong, nonatomic) NSMutableSet *textFieldsOnScreen;
@property (weak, nonatomic) IBOutlet ColorButton *blackButton;
@property (weak, nonatomic) IBOutlet ColorButton *redButton;
@property (weak, nonatomic) IBOutlet ColorButton *blueButton;
@property (weak, nonatomic) IBOutlet ColorButton *purpleButton;
@property (weak, nonatomic) IBOutlet ColorButton *greyButton;
@property (weak, nonatomic) IBOutlet UIView *yellowButton;
@property (strong, nonatomic) ColorButton *currentSelectedColor;

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
  
  UITapGestureRecognizer *blackButtonTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorButtonTapped:)];
  [self.blackButton addGestureRecognizer:blackButtonTapped];
  
  UITapGestureRecognizer *redButtonTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorButtonTapped:)];
  [self.redButton addGestureRecognizer:redButtonTapped];
  
  
  UITapGestureRecognizer *blueButtonTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorButtonTapped:)];
  [self.blueButton addGestureRecognizer:blueButtonTapped];
  
  
  UITapGestureRecognizer *purpleButtonTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorButtonTapped:)];
  [self.purpleButton addGestureRecognizer:purpleButtonTapped];
  
  
  UITapGestureRecognizer *greyButtonTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorButtonTapped:)];
  [self.greyButton addGestureRecognizer:greyButtonTapped];
  
  
  UITapGestureRecognizer *yellowButtonTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorButtonTapped:)];
  [self.yellowButton addGestureRecognizer:yellowButtonTapped];
  
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
  [textField1 sizeToFit];
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

-(void) colorButtonTapped:(UITapGestureRecognizer *)recognizer{
  //Deselect last button pressed
  [self.currentSelectedColor onSelect];
  
  //Get current color selected
  ColorButton *colorSelected = (ColorButton *) recognizer.view;
  [colorSelected onSelect];
  self.canvasView.color = colorSelected.backgroundColor;
  
  //Set current color selected
  self.currentSelectedColor = colorSelected;
}

//MARK: Textfield delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
  [textField sizeToFit];
  [textField resignFirstResponder];
  return YES;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
  [textField sizeToFit];
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
