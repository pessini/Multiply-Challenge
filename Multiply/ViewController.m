//
//  ViewController.m
//  Multiply
//
//  Created by Leandro Pessini on 3/9/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UISlider *multiplierSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectZero];
    [textView setKeyboardType:UIKeyboardTypeNumberPad];
    [textView.delegate self];
    [self.view addSubview:textView];
    [textView becomeFirstResponder];



}

#pragma mark textView Delegates

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{

    self.numberLabel.text = textView.text;
    return YES;
}

#pragma mark IBAction

- (IBAction)sliderValueChanged:(UISlider *)sender
{

    // When the user drags the slider and changes its value, adjust the value of multiplierLabel to be the same
    self.multiplierLabel.text = [NSString stringWithFormat:@"%i", (int)self.multiplierSlider.value];

}


- (IBAction)onCalculateButtonPressed:(UIButton *)sender
{
    // converting the number entered to an intValue
    int number = [self.numberLabel.text intValue];

    // converting the multiplier to an intValue
    int multiplier = [self.multiplierLabel.text intValue];

    
    int result;
    if (self.operatorSegmentControl.selectedSegmentIndex == 0)
    {
        result = number * multiplier;
    }
    else
    {
        result = number / multiplier;
    }


    // checking if the result is a multiple of 3 and 5
    BOOL isMultipleOfThree = !(result % 3);
    BOOL isMultipleOfFive = !(result % 5);

    if (isMultipleOfThree && isMultipleOfFive)
    {
        self.answerLabel.text = @"fizzbuzz";
    }
    else if (isMultipleOfThree)
    {
        self.answerLabel.text = @"fizz";
    }
    else if (isMultipleOfFive)
    {
        self.answerLabel.text = @"buzz";
    }
    else
    {
        self.answerLabel.text = [NSString stringWithFormat:@"%i", result];
    }

    // change the viewController's background depending on the result
    if (result >= 20)
    {
        self.view.backgroundColor = [UIColor greenColor];
    }
    else
    {
        self.view.backgroundColor = [UIColor whiteColor];

    }

    NSLog(@"%i", result);


}


@end
