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
@property (weak) IBOutlet NSImageView *backgroundView;
@end


@implementation DischargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setImages];
    
    self.allSwitchs = @[@[_bit253,_bit256,_bit227,_bit254,_bit255,_bit99]];
    
}

-(NSString *)getSwitchBtnName:(NSButton *)btn{
    NSString *btnName = @"";
    NSInteger tag = btn.tag;
    if (btn.title.length) {
        
    }else{
        if (tag == 253) {
            btnName = [self joinSwitchBtnAndTextName:@"S1" textName:@""];
        }else if (tag == 255){
            btnName = [self joinSwitchBtnAndTextName:@"S2" textName:@""];
        }else if (tag == 256){
            btnName = [self joinSwitchBtnAndTextName:@"S3" textName:@""];
        }else if (tag == 227){
            btnName = [self joinSwitchBtnAndTextName:@"S4" textName:@""];
        }else if (tag == 254){
            btnName = [self joinSwitchBtnAndTextName:@"S5" textName:@""];
        }else if (tag == 99){
            btnName = [self joinSwitchBtnAndTextName:@"S6" textName:@""];
        }
        
    }
    
    return btnName;
}

-(void)setImages{
    [self setImageView:self.backgroundView imageName:@"DISCHARGE.jpg"];

    [self setSwitch1BtnImage:self.bit99];
    [self setSwitch1BtnImage:self.bit253];
    [self setSwitch1BtnImage:self.bit256];
    [self setSwitch1BtnImage:self.bit227];
    
    [self setSwitch1BtnImage:self.bit254];
    [self setSwitch1BtnImage:self.bit255];

    
}


- (IBAction)btsClick:(NSButton *)switchBtn {
    
    
    [self setSwitch1BtnImage:switchBtn];
    
    
#if 1
    // Insert code here
    [self getSwitchBtnName:switchBtn];
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:switchBtn];
#else //suncode

    
    [[CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
     
    
#endif
    
}


@end
