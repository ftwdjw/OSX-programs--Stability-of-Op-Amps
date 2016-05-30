//
//  ViewController.m
//  stability2 OSX
//
//  Created by John Mac on 11/15/15.
//  Copyright (c) 2015 John Wetters. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)caculateGain:(id)sender {
    double loopGain,firstPole,secondPole,thirdPole;
    double term1,term2,term3;
    double unityGain,ratio1,ratio2,ratio3;
    double phase1,phase2,phase3,totalPhase,phaseMargin;
    double unityGain1,unityGain2;
    
    NSLog(@"loop gain %@",_loopGain.stringValue);
    NSLog(@"first pole %@",_firstPole.stringValue);
    NSLog(@"second pole %@",_secondPole.stringValue);
    NSLog(@"third pole %@",_thirdPole.stringValue);
    
    
    //convert strinf to CGFloat values for calculations
    
    loopGain = [_loopGain.stringValue floatValue];
    firstPole = [_firstPole.stringValue floatValue];
    secondPole = [_secondPole.stringValue floatValue];
    thirdPole = [_thirdPole.stringValue floatValue];
    
    //calculate unity gain freq
    
    term1=(loopGain/20);
    NSLog(@"term1 %e as float",term1);
    term2=pow(10,term1);
    NSLog(@"term2 %e as float",term2);
    term3=firstPole*secondPole*thirdPole;
    NSLog(@"term3 %e as float",term3);
    
    unityGain1=pow(term2,.333333333);
    NSLog(@"product %e as float",unityGain1);
    
    unityGain2=pow(term3,.333333333);
    NSLog(@"product %e as float",unityGain2);
    
    unityGain=unityGain1*unityGain2;
    NSLog(@"unity gain %e as float",unityGain);
    
    //send to view controller
    self.unityGain.stringValue
    = [NSString stringWithFormat:@"%e", unityGain];
    
    //now calculate phase
    ratio1=unityGain/firstPole;
    NSLog(@"ratio1 %e as float",ratio1);
    phase1=atan(ratio1)*180/M_PI;
    NSLog(@"phase1 %e as float",phase1);
    
    ratio2=unityGain/secondPole;
    NSLog(@"ratio2 %e as float",ratio2);
    phase2=atan(ratio2)*180/M_PI;
    NSLog(@"phase2 %e as float",phase2);
    
    ratio3=unityGain/thirdPole;
    NSLog(@"ratio3 %e as float",ratio3);
    phase3=atan(ratio3)*180/M_PI;
    NSLog(@"phase3 %e as float",phase3);
    
    totalPhase=phase1+phase2+phase3;
    NSLog(@"total phase %e as float",totalPhase);
    
    phaseMargin=180-fabs(totalPhase);
    NSLog(@"phase margin %e as float",phaseMargin);
    
    //send to view controller
    self.phaseMargin.stringValue = [NSString stringWithFormat:@"%e", phaseMargin];
    
    
    
    if (phaseMargin<=0) {
        self.stability.stringValue=@"unstable";
    } else if (0<phaseMargin && phaseMargin<=45) {
        self.stability.stringValue =@"marginally stable";
    } else if (phaseMargin>45) {
        self.stability.stringValue =@"stable";
    }
    
    
}


@end
