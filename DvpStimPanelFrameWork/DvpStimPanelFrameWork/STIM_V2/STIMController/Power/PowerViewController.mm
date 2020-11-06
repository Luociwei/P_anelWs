//
//  BaseVC.m
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import "PowerViewController.h"
#import "ExtensionConst.h"
//#import "RegexKitLite.h"
#define kNotificationOnLoadProfile            @"On_ReloadProfileByRecMsg"
@interface PowerViewController ()

@property (assign) IBOutlet NSTextField *textF1;
@property (assign) IBOutlet NSTextField *textF2;
@property (assign) IBOutlet NSTextField *textF3;
@property (assign) IBOutlet NSTextField *textF4;
@property (assign) IBOutlet NSTextField *textF5;
@property (assign) IBOutlet NSTextField *textF6;
@property (copy) NSArray *textFeilds;
@property(strong,nonatomic)NSTextField *showingTextF;

@property (assign) IBOutlet NSTextField *measurementLable;
@property (assign) IBOutlet NSButton *s1;
@property (assign) IBOutlet NSButton *s2;
@property (assign) IBOutlet NSButton *s3;
@property (assign) IBOutlet NSButton *s4;
@property (assign) IBOutlet NSButton *s5;

@property (assign) IBOutlet NSButton *btn5v;
@property (assign) IBOutlet NSButton *btn9v;
@property (assign) IBOutlet NSButton *btn12v;
@property (assign) IBOutlet NSButton *btn15v;

@property (weak) IBOutlet NSImageView *backgroundView;


@end


@implementation PowerViewController
{
//    CDUTController * pDUT;
    NSString *gainValue;
    NSString *nameAIMeas;
    NSString *nameAIUnit;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [DebugLog saveLogToDefaultFileWithContent:[NSString stringWithFormat:@"start---------------%@-----------------log",self.title] fileName:self.title];
    
    [self setImages];
    self.textFeilds = @[_textF1,_textF2,_textF3,_textF4,_textF5,_textF6];
    self.allSwitchs = @[@[_s1,_s2,_s3,_s4],@[_s5]];
    
    [self.btn5v setEnabled:YES];
    [self.btn9v setEnabled:NO];
    [self.btn12v setEnabled:NO];
    [self.btn15v setEnabled:NO];
    
    // [self setDutController];
}


-(void)setImages{
    [self setImageView:self.backgroundView imageName:@"POWER.jpg"];
    [self setSwitch1BtnImage:self.s1];
    [self setSwitch1BtnImage:self.s2];
    [self setSwitch1BtnImage:self.s3];
    [self setSwitch1BtnImage:self.s4];
    [self setSwitch3BtnImage:self.s5];
}

-(NSString *)getSwitchBtnNameWithTag:(NSInteger)tag{
    NSString *btnName = @"";
    if (tag ==3) {
    
        btnName = [self joinSwitchBtnAndTextName:@"Set_VBATT" textName:self.textF1.stringValue];
        
    }else if (tag==4){

        btnName = [self joinSwitchBtnAndTextName:@"Set_VBUS" textName:self.textF2.stringValue];
 
    }else if (tag==10){
        btnName = [self joinSwitchBtnAndTextName:@"Set_VBUS_5V" textName:self.textF3.stringValue];
        
    }else if (tag==11){

        btnName = [self joinSwitchBtnAndTextName:@"Set_VBUS_9V" textName:self.textF4.stringValue];
    }else if (tag==12){
        
        btnName = [self joinSwitchBtnAndTextName:@"Set_VBUS_12V" textName:self.textF5.stringValue];
    }else if (tag==13){
        
        btnName = [self joinSwitchBtnAndTextName:@"Set_VBUS_15V" textName:self.textF6.stringValue];
    }else if (tag==338){
        
        btnName = [self joinSwitchBtnAndTextName:@"S1" textName:@""];
    }else if (tag==64){
        
        btnName = [self joinSwitchBtnAndTextName:@"S2" textName:@""];
    }else if (tag==63){
        
        btnName = [self joinSwitchBtnAndTextName:@"S3" textName:@""];
    }else if (tag==50){
        
        btnName = [self joinSwitchBtnAndTextName:@"S4" textName:@""];
    }else if (tag==49){
        
        btnName = [self joinSwitchBtnAndTextName:@"S5" textName:@""];
    }
    
    return btnName;
}


- (IBAction)btnsClick:(NSButton *)switchBtn {
    
    if (switchBtn.tag == 49) {
        [self setSwitch3BtnImage:switchBtn];
    }else{
        [self setSwitch1BtnImage:switchBtn];
    }
    
    
#if 1
    // Insert code here
    NSString *btnTextName = [self getSwitchBtnNameWithTag:switchBtn.tag];
    [self respondsToStimControllerSwitchClickWithSwtichName:btnTextName switchBtn:switchBtn];
    

#else //suncode
    
    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
    //    [self sendCmd:[CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""]];
    
    
#endif
}


-(void)resetRelays{
    [super resetRelays];
    
//    [self.s5 setImage:[NSImage imageNamed:@"switch3_on"]];
    [self.s5 setState:NSControlStateValueOff];
    [self setSwitch3BtnImage:self.s5];
    [self.btn5v setEnabled:YES];
    [self.btn9v setEnabled:NO];
    [self.btn12v setEnabled:NO];
    [self.btn15v setEnabled:NO];
}

//-(void)setSwitch3BtnImage:(NSButton *)switchBtn{
//    if (switchBtn.state) {
//        [switchBtn setImage:[NSImage imageNamed:@"switch3_off"]];
//    }else{
//        [switchBtn setImage:[NSImage imageNamed:@"switch3_on"]];
//    }
//}


- (IBAction)okBtnsClick:(NSButton *)switchBtn
{
    

#if 1
    // Insert code here
    NSString *btnTextName = [self getSwitchBtnNameWithTag:switchBtn.tag];
    [self respondsToStimControllerSwitchClickWithSwtichName:btnTextName switchBtn:switchBtn];
    
#else //suncode
    NSTextField *textF =nil;
    
    for (NSTextField *textFiled in self.textFeilds) {
        if (textFiled.tag == switchBtn.tag) {
            textF =textFiled;
        }
    }
    NSString *textVaule =textF.stringValue;
    NSString *fileCSV = [[NSBundle mainBundle] pathForResource:@"ChooseScript" ofType:@"plist"];
    NSMutableDictionary *listCsvName = [[NSMutableDictionary alloc]init];
    [listCsvName removeAllObjects];
    [listCsvName setDictionary:[NSDictionary dictionaryWithContentsOfFile:fileCSV]];
    //    [self sendCmd:[CommandHandler generateCommandWithSwitchBtn:switchBtn text:textVaule]];
    if ([switchBtn.alternateTitle isEqualToString:@"VBUS"]) {
      
        if ([listCsvName valueForKey:@"PowerVbus_TEST"])
        {
            NSString *csvName = [listCsvName valueForKey:@"PowerVbus_TEST"];
            NSLog(@"%@",csvName);
            
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                 csvName,@"Load_Profile_Debug",nil];
            [[NSDistributedNotificationCenter defaultCenter] postNotificationName:kNotificationOnLoadProfile object:nil userInfo:dic deliverImmediately:YES];
            
            [NSThread sleepForTimeInterval:5];
        }
  
    }else if ([switchBtn.alternateTitle isEqualToString:@"VBUS2"]){
        
        NSString *listCsvKey =@"PowerVbus_5v_TEST";
        if (switchBtn.tag ==10) {
            listCsvKey =@"PowerVbus_5v_TEST";
            [self.btn9v setEnabled:YES];
        }else if (switchBtn.tag ==11){
            listCsvKey =@"PowerVbus_9v_TEST";
            //            [self.btn5v setEnabled:NO];
            [self.btn12v setEnabled:YES];
            //             [self.btn15v setEnabled:YES];
        }else if (switchBtn.tag ==12){
            //            [self.btn9v setEnabled:NO];
            [self.btn15v setEnabled:YES];
            listCsvKey =@"PowerVbus_12v_TEST";
        }else if (switchBtn.tag ==13){
            //            [self.btn9v setEnabled:NO];
            listCsvKey =@"PowerVbus_15v_TEST";
        }
        
        
        if ([listCsvName valueForKey:listCsvKey])
        {
            NSString *csvName = [listCsvName valueForKey:listCsvKey];
            NSLog(@"%@",csvName);
            
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                                 csvName,@"Load_Profile_Debug",nil];
            [[NSDistributedNotificationCenter defaultCenter] postNotificationName:kNotificationOnLoadProfile object:nil userInfo:dic deliverImmediately:YES];
            
            [NSThread sleepForTimeInterval:10];
        }
        
    }else if ([switchBtn.alternateTitle isEqualToString:@"VBATT"]){
        
       // NSString *listCsvKey =@"PowerVbus_5v_TEST";
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"stimPanelResetAll" object
                                                                  :nil userInfo
                                                                  :nil] ;

    }
        [CommandHandler generateCommandWithSwitchBtn:switchBtn text:textVaule];
    
    
    
    if (switchBtn.tag ==3 || switchBtn.tag==4) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        if (switchBtn.tag == 3) {
            [dic setObject:textVaule forKey:Set_VBATT];
        }else if(switchBtn.tag == 4){
            [dic setObject:textVaule forKey:Set_VBUS];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:StimSetNotification object
                                                                :nil userInfo
                                                                  :dic] ;
    }
    
    #endif
    
}



-(void)dealloc{
//    [super dealloc];
    NSLog(@"%s",__func__);
    

}


@end
