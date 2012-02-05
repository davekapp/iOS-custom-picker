//
//  AnimalChooserViewController.m
//  CustomizedPicker
//
//  Created by David Kapp on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimalChooserViewController.h"

@implementation AnimalChooserViewController
@synthesize mainViewController;
@synthesize animalNames;
@synthesize animalSounds;
@synthesize animalImages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  self.animalNames = [[NSArray alloc] initWithObjects:@"鼠", @"鵝鳥", @"猫", @"犬", @"蛇", @"熊", @"豚", nil];
  self.animalSounds = [[NSArray alloc] initWithObjects:@"チュー", @"ガ", @"ニャーニャー", @"ワンワン", @"サー", @"ガオー", @"ブーブー", nil];
  NSArray *imageNames = [[NSArray alloc] initWithObjects:@"mouse.png", @"goose.png", @"cat.png", @"dog.png", @"snake.png", @"bear.png", @"pig.png", nil];
  
  NSMutableArray *images = [[NSMutableArray alloc] init];
  for (NSString *filename in imageNames) {
    [images addObject: [[UIImageView alloc] initWithImage:[UIImage imageNamed:filename]] ];
  }
  self.animalImages = images;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
  [self setAnimalNames:nil];
  [self setAnimalSounds:nil];
  [self setAnimalImages:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void)viewDidAppear:(BOOL)animated {
  [self.mainViewController
    displayAnimal:[self.animalNames objectAtIndex:0] 
    withSound:[self.animalSounds objectAtIndex:0] 
    fromComponent:@"none"];
}

- (void)viewWillDisappear:(BOOL)animated {
  self.mainViewController.animalChooserVisible = NO;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return kComponentCount;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  if (component == kAnimalComponent) {
    return [self.animalImages count];
  }
  else {
    return [self.animalSounds count];
  }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
  if (component == kAnimalComponent) {
    return [self.animalImages objectAtIndex:row];
  } 
  else {
    UILabel *soundLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 32)];
    soundLabel.backgroundColor = [UIColor clearColor];
    soundLabel.text = [self.animalSounds objectAtIndex:row];
    return soundLabel;
  }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
  return 55.0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
  if (component == kAnimalComponent) {
    return 120.0;
  }
  else {
    return 280.0;
  }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  int chosenAnimal = [pickerView selectedRowInComponent:kAnimalComponent];
  int chosenSound = [pickerView selectedRowInComponent:kSoundComponent];
  [self.mainViewController 
    displayAnimal:[self.animalNames objectAtIndex:chosenAnimal]
    withSound:[self.animalSounds objectAtIndex:chosenSound]
    fromComponent:[NSString stringWithFormat:@"%d", component]]; 
}

@end
