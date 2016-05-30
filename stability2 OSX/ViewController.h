//
//  ViewController.h
//  stability2 OSX
//
//  Created by John Mac on 11/15/15.
//  Copyright (c) 2015 John Wetters. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak, nonatomic) IBOutlet NSTextField *loopGain;
@property (weak, nonatomic) IBOutlet NSTextField *firstPole;
@property (weak, nonatomic) IBOutlet NSTextField *secondPole;
@property (weak, nonatomic) IBOutlet NSTextField *thirdPole;
@property (weak, nonatomic) IBOutlet NSTextField *unityGain;
@property (weak, nonatomic) IBOutlet NSTextField *phaseMargin;
@property (weak, nonatomic) IBOutlet NSTextField *stability;
- (IBAction)caculateGain:(id)sender;



@end

