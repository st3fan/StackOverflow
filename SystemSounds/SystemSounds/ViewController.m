//
//  ViewController.m
//  SystemSounds
//
//  Created by Stefan Arentz on 10/20/2013.
//  Copyright (c) 2013 Stefan Arentz. All rights reserved.
//

#import "ViewController.h"
@import AudioToolbox;

@interface ViewController ()
@property SystemSoundID systemSoundId;
@property SystemSoundID alertSoundId;
@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    OSStatus status;
    
    status = AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([[NSBundle mainBundle] URLForResource: @"SystemSound" withExtension: @"caf"]),
        &_systemSoundId);
    if (status != noErr) {
        NSLog(@"Cannot create sound: %d", (int)status);
    }

    status = AudioServicesCreateSystemSoundID((CFURLRef) CFBridgingRetain([[NSBundle mainBundle] URLForResource: @"AlertSound" withExtension: @"aif"]),
        &_alertSoundId);
    if (status != noErr) {
        NSLog(@"Cannot create sound: %d", (int)status);
    }
}

- (IBAction)playSystemSound:(id)sender {
    AudioServicesPlaySystemSound(self.systemSoundId);
}

- (IBAction)playAlertSound:(id)sender {
    AudioServicesPlayAlertSound(self.alertSoundId);
}

@end
