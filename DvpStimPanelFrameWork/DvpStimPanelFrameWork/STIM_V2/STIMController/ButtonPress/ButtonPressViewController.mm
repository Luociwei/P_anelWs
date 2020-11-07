//
//  ButtonPressViewController
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 suncode. All rights reserved.
//

#import "ButtonPressViewController.h"
#import "ExtensionConst.h"

@interface ButtonPressViewController ()
@property (assign) IBOutlet NSButton *bit_118_btn;
@property (assign) IBOutlet NSButton *bit_117_btn;

@property (assign) IBOutlet NSButton *bit_116_btn;
@property (weak) IBOutlet NSImageView *backgroundView;
@property (copy) NSArray *switchBtns;

@end


@implementation ButtonPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setImageView:self.backgroundView imageName:@"BUTTON_PRESS.jpg"];
    self.switchBtns = @[_bit_118_btn,_bit_117_btn,_bit_116_btn];
    self.allSwitchs=@[@[_bit_118_btn,_bit_117_btn,_bit_116_btn]];
}

- (IBAction)bit_118_117_116BtnsClick:(NSButton *)switchBtn {
    
    [self mutexSwitchsStateWithCurrentSelectedBtn1:switchBtn WithSwitchsArray:self.switchBtns];
    
#if 1
    // Insert code here
    [self getSwitchBtnName:switchBtn];
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:switchBtn];
 
#else //suncode //suncode 
    
    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
    
#endif
}


-(void)setImages{
    [self setImageView:self.backgroundView imageName:@"BUTTON_PRESS.jpg"];
    [self setSwitch1BtnImage:self.bit_116_btn];
    [self setSwitch1BtnImage:self.bit_117_btn];
    [self setSwitch1BtnImage:self.bit_118_btn];
 
}


-(NSString *)getSwitchBtnName:(NSButton *)btn{
    NSString *btnName = @"";
    NSInteger tag = btn.tag;
    
    if (tag ==118) {
        
        btnName = [self joinSwitchBtnAndTextName:@"S1" textName:@""];
        
    }else if (tag==117){
        
        btnName = [self joinSwitchBtnAndTextName:@"S2" textName:@""];
    }else if (tag==116){
        
        btnName = [self joinSwitchBtnAndTextName:@"S3" textName:@""];
        
    }
    
    return btnName;
}
@end
