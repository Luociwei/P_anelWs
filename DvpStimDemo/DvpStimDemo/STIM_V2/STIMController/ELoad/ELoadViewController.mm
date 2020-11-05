//
//  ELoadViewController
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import "ELoadViewController.h"


@interface ELoadViewController ()
@property (assign) IBOutlet NSButton *btn1;
@property (assign) IBOutlet NSButton *btn2;
@property (assign) IBOutlet NSButton *btn3;
@property (assign) IBOutlet NSButton *btn4;
@property (assign) IBOutlet NSButton *btn5;

@property (assign) IBOutlet NSButton *btn6;
@property (assign) IBOutlet NSButton *btn7;
@property (assign) IBOutlet NSButton *btn8;

@property (nonatomic,copy)NSArray *eloadBtns;
@property (nonatomic,copy)NSArray *textFs;

@property (nonatomic,copy)NSArray *switchsArr1;
@property (nonatomic,copy)NSArray *switchsArr2;

@property (assign) IBOutlet NSButton *setBtn1;
@property (assign) IBOutlet NSButton *setBtn2;
@property (assign) IBOutlet NSButton *setBtn3;
@property (assign) IBOutlet NSButton *setBtn4;

@property (assign) IBOutlet NSTextField *textF1;
@property (assign) IBOutlet NSTextField *textF2;
@property (assign) IBOutlet NSTextField *textF3;
@property (assign) IBOutlet NSTextField *textF4;


@end


@implementation ELoadViewController{
    BOOL status_load1;
    BOOL status_load2;
}

//- (IBAction)switchClick:(NSButton *)switchBtn {
//    NSInteger s = switchBtn.tag;
//    [self mutexSwitchsStateWithCurrentSelectedBtn1:switchBtn WithSwitchsArray:self.switchsArr1];
//    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
//
//
//}

- (IBAction)btnsClick:(NSButton *)btn {
    //        NSInteger s = btn.tag;
    
    [self mutexSwitchsStateWithCurrentSelectedBtn1:btn WithSwitchsArray:self.switchsArr1];
    
    [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
    
}


- (IBAction)switchClick2:(NSButton *)switchBtn {
    //    [self changeSwitchStateWithSelectBtn:switchBtn];
    //    [self setSwitch1BtnImage:switchBtn];
    //    self.lastBtn2=switchBtn;
    [self mutexSwitchsStateWithCurrentSelectedBtn2:switchBtn WithSwitchsArray:self.switchsArr2];
    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
    
}

- (IBAction)setBtnClick:(NSButton *)btn{
    NSInteger index = [self.eloadBtns indexOfObject:btn];
    NSString *text = [[self.textFs objectAtIndex:index] stringValue];
    [CommandHandler generateCommandWithSwitchBtn:btn text:text];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    switch (index+1) {
        case 1:
            [dic setObject:text forKey:Set_ELoad1_CR];
            break;
        case 2:
            [dic setObject:text forKey:Set_ELoad1_CC];
            if (text.integerValue >=2000) {
                status_load1 = NO;
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    NSDate *date = [NSDate date];
                    while (!status_load1) {
                        if ([[NSDate date] timeIntervalSinceDate:date]>60 ) {
                            dispatch_sync(dispatch_get_main_queue(), ^{
                            [CommandHandler generateCommandWithSwitchBtn:btn text:@"0"];
                            status_load1 = YES;
                            NSString *path = [[NSBundle mainBundle]pathForResource:@"information.plist" ofType:nil];
                            NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
                            NSAlert * alert = [[NSAlert alloc] init];
                            [alert addButtonWithTitle:@"OK"];
                            if ([dic objectForKey:@"title"]) {
                                alert.messageText = [dic objectForKey:@"title"];//@"Warning"
                            }else{
                                alert.messageText = @"Warning";
                            }
                            
                            if ([dic objectForKey:@"eload1Mes"]) {
                                alert.informativeText = [dic objectForKey:@"eload1Mes"];
                            }else{
                                alert.informativeText = @"USBSOC is connected";
                            }
                            
                                [alert runModal];
                                
                            });

                        }
                        [NSThread sleepForTimeInterval:0.5];
                    }

                    
                });
            }else{
                status_load1 = YES;
            }
            
            break;
            
        case 3:
            [dic setObject:text forKey:Set_ELoad2_CR];
            break;
        
        case 4:
            [dic setObject:text forKey:Set_ELoad2_CC];
            if (text.integerValue >=2000) {
                status_load2 = NO;
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    NSDate *date = [NSDate date];
                    while (!status_load2) {
                        if ([[NSDate date] timeIntervalSinceDate:date]>60 ) {
                            dispatch_sync(dispatch_get_main_queue(), ^{
                                [CommandHandler generateCommandWithSwitchBtn:btn text:@"0"];
                                status_load2 = YES;
                                NSString *path = [[NSBundle mainBundle]pathForResource:@"information.plist" ofType:nil];
                                NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
                                NSAlert * alert = [[NSAlert alloc] init];
                                [alert addButtonWithTitle:@"OK"];
                                if ([dic objectForKey:@"title"]) {
                                    alert.messageText = [dic objectForKey:@"title"];//@"Warning"
                                }else{
                                    alert.messageText = @"Warning";
                                }
                                
                                if ([dic objectForKey:@"eload2Mes"]) {
                                    alert.informativeText = [dic objectForKey:@"eload2Mes"];
                                }else{
                                    alert.informativeText = @"USBSOC is connected";
                                }
                                
                                [alert runModal];
                                
                            });
                            
                        }
                        [NSThread sleepForTimeInterval:0.5];
                    }
                    
                    
                });
            }else{
                status_load2 = YES;
            }
            break;
            
        default:
            break;
    }
    
        [[NSNotificationCenter defaultCenter] postNotificationName:StimSetNotification object
                                                                       :nil userInfo
                                                                        :dic] ;
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInitTextFieldsAndSetBtns];
    [self setInitSwitchs];
    
    // Do view setup here.
    
}

-(void)setInitSwitchs{
    self.switchsArr1= @[_btn1,_btn2,_btn3,_btn4,_btn5];
    self.switchsArr2= @[_btn6,_btn7,_btn8];
    self.allSwitchs =@[@[_btn1,_btn2,_btn3,_btn4,_btn5,_btn6,_btn7,_btn8]];
    
    
//    self.switchBtns = @[_bit_244_btn1,_bit_244_btn2,_bit_244_btn3,_bit_244_btn4,_bit_242_btn1,_bit_242_btn2,_bit_242_btn3,_bit_242_btn4,_bit_245_btn1,_bit_245_btn2,_bit_245_btn3,_bit_245_btn4,_bit_243_btn1,_bit_243_btn2,_bit_243_btn3,_bit_243_btn4];
//
//    self.allSwitchs = @[@[_bit_245_btn1,_bit_245_btn2,_bit_245_btn3,_bit_245_btn4,_bit_243_btn1,_bit_243_btn2,_bit_243_btn3,_bit_243_btn4],@[_bit_244_btn1,_bit_244_btn2,_bit_244_btn3,_bit_244_btn4,_bit_242_btn1,_bit_242_btn2,_bit_242_btn3,_bit_242_btn4]];
//    [self setSwitchInitState:self.switchsArr1];
//    [self setSwitchInitState:self.switchsArr2];
}

-(void)setInitEloadBtns{
    
    self.textFs = @[_textF1,_textF2,_textF3,_textF4];
    self.eloadBtns = @[_setBtn1,_setBtn2,_setBtn3,_setBtn4];
}

-(void)setSwitchInitState:(NSArray *)arr{
    int i=1;
    for (NSButton *btn in arr) {
        btn.state = 0;
        btn.alternateTitle=@"IO";
        if (arr==self.switchsArr1) {
            btn.tag=800+i;
        }else{
            btn.tag=805+i;
        }
        
    }
}

-(void)setInitTextFieldsAndSetBtns{
    [self setInitEloadBtns];
//    for (int i =0; i<4; i++) {
//        NSTextField *textF =self.textFs[i];
//        NSButton *btn = self.eloadBtns[i];
//        [textF setTag:i+1];
//        [btn setTag:i+1];
//        btn.alternateTitle = @"ELOAD";
//    }
}


@end
