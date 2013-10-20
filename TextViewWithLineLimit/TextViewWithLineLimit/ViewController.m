//
//  ViewController.m
//  TextViewWithLineLimit
//
//  Created by Stefan Arentz on 10/20/2013.
//  Copyright (c) 2013 Stefan Arentz. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView.delegate = self;
}

// Make the change that is about to happen on a copy of the text. If that change results in more than N lines then
// we reject it.

- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    static const NSUInteger MAX_NUMBER_OF_LINES_ALLOWED = 3;

    NSMutableString *t = [NSMutableString stringWithString: self.textView.text];
    [t replaceCharactersInRange: range withString: text];
    
    NSUInteger numberOfLines = 0;
    for (NSUInteger i = 0; i < t.length; i++) {
        if ([t characterAtIndex: i] == '\n') {
            numberOfLines++;
        }
    }
    
    return (numberOfLines < MAX_NUMBER_OF_LINES_ALLOWED);
}

@end
