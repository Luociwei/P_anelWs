//
//  CCELoadVC.m
//  DUT_Tool
//
//  Created by ciwei luo on 2020/9/9.
//  Copyright © 2020 ___Intelligent Automation___. All rights reserved.
//

#import "CCELoadViewController.h"
#import "ExtensionConst.h"

@interface CCELoadViewController ()
@property (assign) IBOutlet NSTextField *ccload1_view;
@property (assign) IBOutlet NSTextField *ccload2_view;
@property (assign) IBOutlet NSButton *btnset1;
@property (assign) IBOutlet NSButton *btnset2;
@property (assign) IBOutlet NSButton *btns1;
@property (assign) IBOutlet NSButton *btns2;
@property (assign) IBOutlet NSButton *btns3;
@property (assign) IBOutlet NSButton *btns4;
@property (assign) IBOutlet NSButton *btns5;
@property (assign) IBOutlet NSButton *btns6;

@property (assign) IBOutlet NSButton *btns7;
@property (nonatomic,copy)NSArray *eloadBtns;
@property (nonatomic,copy)NSArray *textFs;
@end

@implementation CCELoadViewController{
    BOOL status_load1;
    BOOL status_load2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.allSwitchs =@[@[_btns1,_btns2,_btns3,_btns4,_btns5,_btns6],@[_btns7]];
//    self.allSwitchs =@[@[_btns1,_btns2],@[_btns3,_btns4],@[_btns5,_btns6]];
    self.textFs = @[_ccload1_view,_ccload2_view];
    self.eloadBtns = @[_btnset1,_btnset2];
}

- (IBAction)setBtnClick:(NSButton *)btn{
    
    
#if 1
    // Insert code here
    
    
    
    
    
#else //suncode
    
    NSInteger index = [self.eloadBtns indexOfObject:btn];
    NSString *text = [[self.textFs objectAtIndex:index] stringValue];
    [CommandHandler generateCommandWithSwitchBtn:btn text:text];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    switch (index+1) {
    
        case 1:
            [dic setObject:text forKey:Set_ELoad1_CC];
            if (text.integerValue >=2000) {
                status_load1 = NO;
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    NSDate *date = [NSDate date];
                    while (!status_load1) {
                        if ([[NSDate date] timeIntervalSinceDate:date]>60 ) {
                            dispatch_sync(dispatch_get_main_queue(), ^{
                                [CommandHandler generateCommandWithSwitchBtn:btn text:@"0"];
                                self.ccload1_view.stringValue = @"0";
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
            
 
        case 2:
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
                                self.ccload2_view.stringValue = @"0";
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
    
    
 #endif
    
}




- (IBAction)btnsClick:(NSButton *)btn {
    if (btn.tag == 7) {
        
        [self setSwitch2BtnImage:btn];
    }else{
        [self mutexSwitchsStateWithCurrentSelectedBtn1:btn WithSwitchsArray:@[_btns1,_btns2,_btns3,_btns4,_btns5,_btns6]];
        //        if (btn.tag ==1 || btn.tag ==2) {
        //            [self mutexSwitchsStateWithCurrentSelectedBtn1:btn WithSwitchsArray:@[_btns1,_btns2]];
        //        }else if (btn.tag ==3 || btn.tag ==4) {
        //            [self mutexSwitchsStateWithCurrentSelectedBtn2:btn WithSwitchsArray:@[_btns3,_btns4]];
        //        }else{
        //           //[self mutexSwitchsStateWithCurrentSelectedBtn1:btn WithSwitchsArray:self.allSwitchs];
        //            [self mutexSwitchsStateWithCurrentSelectedBtn3:btn WithSwitchsArray:@[_btns5,_btns6]];
        //        }
        
    }
#if 1
    // Insert code here
    
    
#else //suncode
    
    [CommandHandler generateCommandWithSwitchBtn:btn text:@""];
    
#endif
    
}


@end
