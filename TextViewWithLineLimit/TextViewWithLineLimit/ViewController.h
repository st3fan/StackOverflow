//
//  ViewController.h
//  TextViewWithLineLimit
//
//  Created by Stefan Arentz on 10/20/2013.
//  Copyright (c) 2013 Stefan Arentz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
