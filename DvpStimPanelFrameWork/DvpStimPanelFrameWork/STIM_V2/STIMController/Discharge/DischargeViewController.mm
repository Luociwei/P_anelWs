//
//  DischargeViewController
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import "DischargeViewController.h"
#import "ExtensionConst.h"
@interface DischargeViewController ()

@property (assign) IBOutlet NSButton *bit253;
@property (assign) IBOutlet NSButton *bit256;
@property (assign) IBOutlet NSButton *bit227;
@property (assign) IBOutlet NSButton *bit254;

@property (assign) IBOutlet NSButton *bit99;
@property (assign) IBOutlet NSButton *bit255;

@end


@implementation DischargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allSwitchs = @[@[_bit253,_bit256,_bit227,_bit254,_bit255,_bit99]];
}


- (IBAction)btsClick:(NSButton *)switchBtn {
    
    
    [self setSwitch1BtnImage:switchBtn];
    
    
#if 1
    // Insert code here
    
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:switchBtn];
#else //suncode

    
    [[CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
     
    
#endif
    
}


@end
