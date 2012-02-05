//
//  ViewController.h
//  CustomizedPicker
//
//  Created by David Kapp on 2/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimalChooserViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *output;
@property (nonatomic) Boolean animalChooserVisible;

- (IBAction)showAnimalChooser:(id)sender;
- (void)displayAnimal:(NSString *)chosenAnimal withSound:(NSString *)animalSound fromComponent:(NSString *)chosenComponent;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
@end
