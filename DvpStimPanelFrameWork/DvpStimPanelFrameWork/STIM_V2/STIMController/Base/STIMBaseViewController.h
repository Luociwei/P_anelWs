//
//  StimMainVC
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//
//NTCViewController
#import <Cocoa/Cocoa.h>
#import "StimMainVcProtocol.h"
#import "StimVcMode.h"

@interface STIMBaseViewController : NSViewController

+(instancetype)allocInit;
-(void)resetRelays;
@property (nonatomic,copy)NSArray *allSwitchs;
-(void)setSwitch1BtnImage:(NSButton *)switchBtn;
-(void)setSwitch2BtnImage:(NSButton *)switchBtn;
@property (nonatomic,strong)StimVcMode *stimMode;
-(void)mutexSwitchsStateWithCurrentSelectedBtn1:(NSButton *)switchBtn WithSwitchsArray:(NSArray *)switchs;
-(void)mutexSwitchsStateWithCurrentSelectedBtn2:(NSButton *)switchBtn WithSwitchsArray:(NSArray *)switchs;
-(void)mutexSwitchsStateWithCurrentSelectedBtn3:(NSButton *)switchBtn WithSwitchsArray:(NSArray *)switchs;
@property (weak) id<StimMainVcProtocol>stimDelegate;
-(void)dmicSwitchsStateWithCurrentSelectedBtn:(NSButton *)switchBtn WithSwitchsArray:(NSArray *)switchs;
-(void)respondsToStimControllerSwitchClickWithSwtichName:(NSString *)name switchBtn:(NSButton *)switchBtn;
-(NSString *)joinSwitchBtnAndTextName:(NSString *)btnName textName:(NSString *)textValue;


@end
