//
//  LDCMViewController.m
//  DUT_Tool
//
//  Created by ciwei luo on 2020/8/24.
//  Copyright © 2020 ___Intelligent Automation___. All rights reserved.
//

#import "LDCMViewController.h"
#import "ExtensionConst.h"
#define kNotificationOnLoadProfile            @"On_ReloadProfileByRecMsg"
@interface LDCMViewController ()

@property (assign) IBOutlet NSButton *imagBtn1;

@property (assign) IBOutlet NSButton *imagBtn2;

@property (assign) IBOutlet NSButton *imagBtn3;
@property (assign) IBOutlet NSImageView *image1;
@property (assign) IBOutlet NSImageView *image2;

@property (assign) IBOutlet NSButton *btnTrace1;
@property (assign) IBOutlet NSButton *btnTrace2;
@property (assign) IBOutlet NSTextField *powerBoardView;
@property (assign) IBOutlet NSTextField *vauleDisplay;
@property (assign) IBOutlet NSTextField *descLabel;

@end

@implementation LDCMViewController
//+(instancetype)allocInit{
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//    
//    LDCMViewController *vc = [[self alloc] initWithNibName:NSStringFromClass([LDCMViewController class]) bundle:bundle];
//    return vc;
//    
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
//    NSInteger state = self.imagBtn1.state;
    NSLog(@"111");
    NSString *path = [[NSBundle mainBundle]pathForResource:@"information.plist" ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *desc = [dic objectForKey:@"LDCM_Desc"];
    if (desc.length) {
        self.descLabel.stringValue = desc;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector
                                                     :@selector(vauleDisplay:) name
                                                     :@"getMeasurementValue" object
                                                     :nil] ;
}

-(void)vauleDisplay:(NSNotification*)nf{
    NSDictionary *userInfo = [nf userInfo];
    
    if ([userInfo objectForKey:@"measurement"]) {
      //  coefficient =[[userInfo objectForKey:@"coefficient"] intValue];
        
        self.vauleDisplay.stringValue =[userInfo objectForKey:@"measurement"];
    }
}

- (IBAction)pbSetClick:(NSButton *)btn {

#if 1
    // Insert code here
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:btn];
    
#else //suncode


    if ([btn.title.lowercaseString containsString:@"set"]) {
        NSString *textVaule =self.powerBoardView.stringValue;
        if (textVaule.length) {
            [CommandHandler generateCommandWithSwitchBtn:btn text:textVaule];
        }
    }else{
        self.btnTrace2.state =0;
        [self.btnTrace2 setImage:[NSImage imageNamed:@"switch3_on"]];
        [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
    }
    
#endif

}


- (IBAction)traceClick:(NSButton *)btn {
    [self setSwitch3BtnImage:btn];
    
    
#if 1
    // Insert code here
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:btn];
    
#else //suncode
      [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
#endif
  
}

-(void)setSwitch3BtnImage:(NSButton *)switchBtn{
    if (switchBtn.state) {
        [switchBtn setImage:[NSImage imageNamed:@"switch3_off"]];
    }else{
        [switchBtn setImage:[NSImage imageNamed:@"switch3_on"]];
    }
}

- (IBAction)imagBtnsClick:(NSButton *)btn {
    
    
    [self setSwitch1BtnImage:btn];
#if 1
    // Insert code here
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:btn];
    
#else //suncode
    [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
#endif
    
}

-(void)setSwitch1BtnImage:(NSButton *)switchBtn{
    NSInteger state = switchBtn.state;
    self.imagBtn1.state = state;
    self.imagBtn2.state = state;
    self.imagBtn3.state = state;
    if (state) {
        [self.imagBtn1 setImage:[NSImage imageNamed:@"Canvas 4"]];
        [self.imagBtn2 setImage:[NSImage imageNamed:@"Canvas 4"]];
        [self.imagBtn3 setImage:[NSImage imageNamed:@"Canvas 4"]];
    }else{
        [self.imagBtn1 setImage:[NSImage imageNamed:@"Canvas 1"]];
        [self.imagBtn2 setImage:[NSImage imageNamed:@"Canvas 1"]];
        [self.imagBtn3 setImage:[NSImage imageNamed:@"Canvas 1"]];
    }
}


- (IBAction)btnsClick:(NSButton *)btn {
    
    NSInteger btn_tag = btn.tag;
    if (btn_tag==1001) {
        [self.image1 setImage:[NSImage imageNamed:@"image1"]];
    }else if (btn_tag==1002){
        [self.image1 setImage:[NSImage imageNamed:@"image2"]];
    }else if (btn_tag==1003){
        [self.image1 setImage:[NSImage imageNamed:@"image3"]];
    }else if (btn_tag==1004){
        [self.image1 setImage:[NSImage imageNamed:@"image4"]];
    }else if (btn_tag==1005){
        [self.image1 setImage:[NSImage imageNamed:@"image5"]];
    }else if (btn_tag==1006){
        [self.image1 setImage:[NSImage imageNamed:@"image6"]];
    }else if (btn_tag==1007){
        [self.image1 setImage:[NSImage imageNamed:@"image7"]];
    }else if (btn_tag==1008){
        [self.image1 setImage:[NSImage imageNamed:@"image8"]];
    }else if (btn_tag==1009){
        [self.image2 setImage:[NSImage imageNamed:@"image9"]];
    }else if (btn_tag==1010){
        [self.image2 setImage:[NSImage imageNamed:@"image10"]];
    }else if (btn_tag==1011){
        [self.image2 setImage:[NSImage imageNamed:@"image11"]];
    }else if (btn_tag==1012){
        [self.image2 setImage:[NSImage imageNamed:@"image12"]];
    }else if (btn_tag==1013){
        [self.image2 setImage:[NSImage imageNamed:@"image13"]];
    }else if (btn_tag==1014){
        [self.image2 setImage:[NSImage imageNamed:@"image14"]];
    }else if (btn_tag==1015){
        [self.image2 setImage:[NSImage imageNamed:@"image15"]];
    }else if (btn_tag==1016){
        [self.image2 setImage:[NSImage imageNamed:@"image16"]];
    }
    
    
#if 1
    // Insert code here
    
    [self respondsToStimControllerSwitchClickWithSwtichName:@"S1" switchBtn:btn];
#else //suncode
    
  
    [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
    
     
#endif
    
}

-(void)dealloc{
//    [super dealloc];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)resetRelays{
    self.imagBtn1.state = 0;
    self.imagBtn2.state = 0;
    self.imagBtn3.state = 0;
    self.btnTrace1.state =0;
    self.btnTrace2.state =0;
    
    [self.imagBtn1 setImage:[NSImage imageNamed:@"Canvas 1"]];
    [self.imagBtn2 setImage:[NSImage imageNamed:@"Canvas 1"]];
    [self.imagBtn3 setImage:[NSImage imageNamed:@"Canvas 1"]];
    
    [self.image1 setImage:[NSImage imageNamed:@"image1"]];
    [self.image2 setImage:[NSImage imageNamed:@"image9"]];
    
    [self.btnTrace1 setImage:[NSImage imageNamed:@"switch3_on"]];
    [self.btnTrace2 setImage:[NSImage imageNamed:@"switch3_on"]];
}

@end
