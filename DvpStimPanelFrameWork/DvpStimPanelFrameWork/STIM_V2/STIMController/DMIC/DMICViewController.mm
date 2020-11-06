//
//  DMICViewController
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import "DMICViewController.h"
#import "ExtensionConst.h"

@interface DMICViewController ()
@property (assign) IBOutlet NSButton *switchBtn1;

@property (assign) IBOutlet NSButton *switchBtn2;
@property (assign) IBOutlet NSButton *switchBtn3;
@property (assign) IBOutlet NSButton *switchBtn4;

@property (assign) IBOutlet NSButton *switchBtn5;
@property (assign) IBOutlet NSButton *switchBtn6;
@property (assign) IBOutlet NSButton *switchBtn7;
@property (assign) IBOutlet NSButton *switchBtn8;
@property (copy) NSArray *switchBtns;

@property (assign) IBOutlet NSButton *startBtn;
@property (assign) IBOutlet NSButton *stopBtn;
@end


@implementation DMICViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.switchBtns = @[@[_switchBtn1,_switchBtn2],@[_switchBtn3,_switchBtn4],@[_switchBtn5,_switchBtn6],@[_switchBtn7,_switchBtn8]];
    self.allSwitchs=@[@[_switchBtn1,_switchBtn2,_switchBtn3,_switchBtn4,_switchBtn5,_switchBtn6,_switchBtn7,_switchBtn8]];
    int j=1;
    for (NSArray *btns in self.switchBtns) {
        
        for (NSButton *btn in btns) {
            btn.alternateTitle=@"IO";
            btn.state=0;
            if (j==1) {
                btn.tag=107;
            }else if (j==2){
                btn.tag=108;
            }else if (j==3){
                btn.tag=106;
            }else if (j==4){
                btn.tag=105;
            }
            
        }
        j++;
    }
}

- (IBAction)pdmBtnClick:(NSButton *)btn {
    
#if 1
    // Insert code here
    
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:btn];
    
    
#else //suncode
    
    [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
    
#endif
    
    
}



- (IBAction)btnsClick:(NSButton *)switchBtn {
    
    [self dmicSwitchsStateWithCurrentSelectedBtn:switchBtn WithSwitchsArray:self.switchBtns];
    
    
#if 1
    // Insert code here
    
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:switchBtn];
    
    
#else //suncode
    
    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
    
#endif
    

    
}

//-(void)setRadius{
    //    self.startBtn.wantsLayer = YES;
    //
    //    [self.startBtn.layer setCornerRadius:8];
    //
    //    [self.startBtn.layer setMasksToBounds:YES];
//}

@end
