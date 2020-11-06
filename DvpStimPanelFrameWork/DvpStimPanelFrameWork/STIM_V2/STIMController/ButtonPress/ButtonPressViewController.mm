//
//  ButtonPressViewController
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import "ButtonPressViewController.h"
#import "ExtensionConst.h"

@interface ButtonPressViewController ()
@property (assign) IBOutlet NSButton *bit_118_btn;
@property (assign) IBOutlet NSButton *bit_117_btn;

@property (assign) IBOutlet NSButton *bit_116_btn;

@property (copy) NSArray *switchBtns;

@end


@implementation ButtonPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.switchBtns = @[_bit_118_btn,_bit_117_btn,_bit_116_btn];
    self.allSwitchs=@[@[_bit_118_btn,_bit_117_btn,_bit_116_btn]];
}

- (IBAction)bit_118_117_116BtnsClick:(NSButton *)switchBtn {
    
    [self mutexSwitchsStateWithCurrentSelectedBtn1:switchBtn WithSwitchsArray:self.switchBtns];
    
#if 1
    // Insert code here
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:switchBtn];
 
#else //suncode //suncode 
    
    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
    
#endif
}



@end
