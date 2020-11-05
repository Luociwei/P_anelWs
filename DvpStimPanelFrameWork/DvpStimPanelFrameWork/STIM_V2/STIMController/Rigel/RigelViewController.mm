//
//  DischargeViewController
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import "RigelViewController.h"
#import "ExtensionConst.h"

@interface RigelViewController ()
@property (assign) IBOutlet NSButton *bit78_btn;
@property (assign) IBOutlet NSButton *bit79_btn;
@property (assign) IBOutlet NSButton *bit39_btn;
@property (assign) IBOutlet NSButton *bit38_btn;
@property (assign) IBOutlet NSButton *bit37_btn;

@property (copy) NSArray *switchBtns;
@end


@implementation RigelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.switchBtns = @[_bit37_btn,_bit38_btn,_bit39_btn];
    self.allSwitchs = @[@[_bit37_btn,_bit38_btn,_bit39_btn,_bit78_btn,_bit79_btn]];
}



- (IBAction)bit37_38_39Click:(NSButton *)switchBtn {
    
    [self mutexSwitchsStateWithCurrentSelectedBtn1:switchBtn WithSwitchsArray:self.switchBtns];
    
#if 1
    // Insert code here
    
    
#else //suncode

    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
 #endif
}


- (IBAction)bit78_79Click:(NSButton *)switchBtn {
    [self setSwitch1BtnImage:switchBtn];
#if 1
    // Insert code here
    
    
#else //suncode
    
    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
    
#endif
}



@end
