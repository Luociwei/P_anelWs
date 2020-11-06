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
    [self respondsToStimControllerSwitchClickWithSwtichName:[self getSwitchBtnName:switchBtn] switchBtn:switchBtn];
    
#else //suncode

    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
 #endif
}

-(NSString *)getSwitchBtnName:(NSButton *)btn{
    NSString *btnName = @"";
    NSInteger tag = btn.tag;
    if (btn.title.length) {
        
    }else{
        if (tag == 78) {
            btnName = [self joinSwitchBtnAndTextName:@"S1" textName:@""];
        }else if (tag == 79){
            btnName = [self joinSwitchBtnAndTextName:@"S2" textName:@""];
        }else if (tag == 37){
            btnName = [self joinSwitchBtnAndTextName:@"S3" textName:@""];
        }else if (tag == 38){
            btnName = [self joinSwitchBtnAndTextName:@"S4" textName:@""];
        }else if (tag == 39){
            btnName = [self joinSwitchBtnAndTextName:@"S5" textName:@""];
        }
        
    }
    
    return btnName;
}
- (IBAction)bit78_79Click:(NSButton *)switchBtn {
    [self setSwitch1BtnImage:switchBtn];
#if 1
    // Insert code here
//    [self getSwitchBtnName:switchBtn]
    [self respondsToStimControllerSwitchClickWithSwtichName:[self getSwitchBtnName:switchBtn] switchBtn:switchBtn];
#else //suncode
    
    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
    
#endif
}



@end
