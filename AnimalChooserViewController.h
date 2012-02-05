//
//  AnimalChooserViewController.h
//  CustomizedPicker
//
//  Created by David Kapp on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define kComponentCount 2
#define kAnimalComponent 0
#define kSoundComponent 1

#import <UIKit/UIKit.h>
#import "ViewController.h"
@class ViewController;

@interface AnimalChooserViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) ViewController* mainViewController;
@property (strong, nonatomic) NSArray *animalNames;
@property (strong, nonatomic) NSArray *animalSounds;
@property (strong, nonatomic) NSArray *animalImages;

- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component;
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
@end
