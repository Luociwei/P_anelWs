//
//  PenroseViewController.m
//  DVP_Tool
//
//  Created by ciwei luo on 2020/9/23.
//  Copyright © 2020 ___Intelligent Automation___. All rights reserved.
//

#import "PenroseViewController.h"
#import "ExtensionConst.h"


@interface PenroseViewController ()

@property (assign) IBOutlet NSTextField *FreqPWM1;
@property (assign) IBOutlet NSTextField *DutyPWM1;
@property (assign) IBOutlet NSButton *SetPWM1;
@property (assign) IBOutlet NSButton *OffPWM1;

@property (assign) IBOutlet NSTextField *FreqPWM2;
@property (assign) IBOutlet NSTextField *DutyPWM2;
@property (assign) IBOutlet NSButton *SetPWM2;
@property (assign) IBOutlet NSButton *OffPWM2;

@property (assign) IBOutlet NSButton *s1;
@property (assign) IBOutlet NSButton *s2;
@property (assign) IBOutlet NSTextField *descLabel;

@end

@implementation PenroseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.allSwitchs = @[@[_s1,_s2]];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"information.plist" ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *desc = [dic objectForKey:@"Penrose_Desc"];
    if (desc.length) {
        self.descLabel.stringValue = desc;
    }
    
}

- (IBAction)s1click:(NSButton *)btn {
    
    [self dmicSwitchsStateWithCurrentSelectedBtn:btn WithSwitchsArray:@[@[_s1,_s2]]];
#if 1
    // Insert code here
    
    

#else //suncode
    
    [[CommandHandler generateCommandWithSwitchBtn:btn text:@""];
     
#endif
    
}

//-(void)resetRelays{
//    [super resetRelays];
//    
//
//}

- (IBAction)btnPwm1Click:(NSButton *)btn {//pwm output enable(channel4*500*50)
         
         
#if 1
         // Insert code here
         
         
         
         
         
#else //suncode
         
         
         
         if ([btn.title.lowercaseString containsString:@"set"]) {
             NSString *freqPWM1 =self.FreqPWM1.stringValue;
             NSString *duty1 =self.DutyPWM1.stringValue;
             if (freqPWM1.length && duty1.length) {
                 NSString *textVaule = [NSString stringWithFormat:@"%@,%@",freqPWM1,duty1];
                 [CommandHandler generateCommandWithSwitchBtn:btn text:textVaule];
             }
         }else{
             [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
         }
         
#endif
         
     }

- (IBAction)btnPwm2Click:(NSButton *)btn {//pwm output enable(channel4*500*50)
    
    
#if 1
    // Insert code here
    
    
    
    
    
#else //suncode
    
    
    if ([btn.title.lowercaseString containsString:@"set"]) {
        NSString *freqPWM2 =self.FreqPWM2.stringValue;
        NSString *duty2 =self.DutyPWM2.stringValue;
        if (freqPWM2.length && duty2.length) {
            NSString *textVaule = [NSString stringWithFormat:@"%@,%@",freqPWM2,duty2];
            [CommandHandler generateCommandWithSwitchBtn:btn text:textVaule];
        }
    }else{
        [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
    }
    
#endif
}






@end
