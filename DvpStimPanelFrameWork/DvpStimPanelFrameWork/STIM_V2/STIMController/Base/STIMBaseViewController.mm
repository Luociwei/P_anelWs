//
//  StimMainVC
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#define LogFOLDER @"/vault/StimLog"
#define textF_W 200
#define textF_h 60
#import "STIMBaseViewController.h"
#import "ExtensionConst.h"
#import "StimVcMode.h"

@interface STIMBaseViewController ()
@property (nonatomic,strong)NSButton *lastBtn1;
@property (nonatomic,strong)NSButton *lastBtn2;
@property (nonatomic,strong)NSButton *lastBtn3;
@property (nonatomic,copy)NSArray *mutexSwitchsArr1;
@property (nonatomic,copy)NSArray *mutexSwitchsArr2;
@property (nonatomic,copy)NSArray *mutexSwitchsArr3;
@property (nonatomic,strong)NSButton *lastBtn_dmic;
//@property (nonatomic,copy)NSArray *switchsArr_dmic;
@end




@implementation STIMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}




//-(instancetype)initWithNibName:(NSNibName)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
//        [self initWithNibName:NSStringFromClass([self class]) bundle:bundle];
//
//    }
//    return self;
//}

+(instancetype)allocInit{
   
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
   
    STIMBaseViewController *vc = [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:bundle];

    return vc;
    
}




-(void)removeLogFile{
    NSFileManager *fileManager =[NSFileManager defaultManager];
    [fileManager removeItemAtPath:LogFOLDER error:nil];
}


-(void)resetRelays{

    if (!self.allSwitchs.count) {
        return;
    }
    for (int i =0; i<self.allSwitchs.count; i++) {
        NSArray *arr =self.allSwitchs[i];
        for (NSButton *btn in arr) {
            btn.state=0;
            if (i==0) {
                [self setSwitch1BtnImage:btn];
            }else{
                [self setSwitch2BtnImage:btn];
            }
            
        }
    }
    
}


-(void)setSwitch1BtnImage:(NSButton *)switchBtn{
    if (switchBtn.state) {
//        [switchBtn setImage:[NSImage imageNamed:@"switch1_on"]];
        [self setSwitchImage:@"switch1_on.jpg" switchBtn:switchBtn];
    }else{
//        [switchBtn setImage:[NSImage imageNamed:@"switch1_off"]];
        [self setSwitchImage:@"switch1_off.jpg" switchBtn:switchBtn];
    }
}
-(void)setSwitch2BtnImage:(NSButton *)switchBtn{
    if (switchBtn.state) {

        [self setSwitchImage:@"switch2_on.jpg" switchBtn:switchBtn];
//        [switchBtn setImage:[NSImage imageNamed:@"switch2_on"]];

    }else{
        [self setSwitchImage:@"switch2_off.jpg" switchBtn:switchBtn];
//        [switchBtn setImage:[NSImage imageNamed:@"switch2_off"]];
    }
}

-(NSString *)joinSwitchBtnAndTextName:(NSString *)btnName textName:(NSString *)textValue{
    
    NSString *btnTextName = @"";
    if (textValue.length) {
        btnTextName = [NSString stringWithFormat:@"%@++%@",btnName,textValue];
    }else{
        btnTextName = btnName;
    }
    return btnTextName;
}
-(void)setSwitchImage:(NSString *)imageName switchBtn:(NSButton *)switchBtn{
    NSString *pic_path = [[NSBundle bundleForClass:[self class]].resourcePath stringByAppendingPathComponent:imageName];
    NSImage *image = [[NSImage alloc]initWithContentsOfFile:pic_path];
    [switchBtn setImage:image];
}

-(void)mutexSwitchsStateWithCurrentSelectedBtn1:(NSButton *)switchBtn WithSwitchsArray:(NSArray *)switchs{
    self.mutexSwitchsArr1 = switchs;
    [self changeSwitchStateWithSelectBtn:switchBtn];
    [self setSwitch1BtnImage:switchBtn];
    self.lastBtn1=switchBtn;
}
-(void)mutexSwitchsStateWithCurrentSelectedBtn2:(NSButton *)switchBtn WithSwitchsArray:(NSArray *)switchs{
    self.mutexSwitchsArr2 = switchs;
    [self changeSwitchStateWithSelectBtn:switchBtn];
    [self setSwitch1BtnImage:switchBtn];
    self.lastBtn2=switchBtn;
}

-(void)mutexSwitchsStateWithCurrentSelectedBtn3:(NSButton *)switchBtn WithSwitchsArray:(NSArray *)switchs{
    self.mutexSwitchsArr3 = switchs;
    [self changeSwitchStateWithSelectBtn:switchBtn];
    [self setSwitch1BtnImage:switchBtn];
    self.lastBtn3=switchBtn;
}

-(void)dmicSwitchsStateWithCurrentSelectedBtn:(NSButton *)switchBtn WithSwitchsArray:(NSArray *)switchs{
    NSControlStateValue btnState = switchBtn.state;
    if (switchBtn.tag==_lastBtn_dmic.tag) {
        for (NSArray *btns in switchs) {
            if ([btns containsObject:switchBtn]) {
                for (NSButton *btn in btns) {
                    btn.state=btnState;
                    [self setSwitch1BtnImage:btn];
                }
            }
        }
    }else{
        
        for (NSArray *btns in switchs) {
            if ([btns containsObject:switchBtn]) {
                for (NSButton *btn in btns) {
                    btn.state=btnState;
                    [self setSwitch1BtnImage:btn];
                }
            }else{
                for (NSButton *otherBtn in btns) {
                    otherBtn.state = !btnState;
                    [self setSwitch1BtnImage:otherBtn];
                }
            }
        }
    }
    
    _lastBtn_dmic = switchBtn;
    
//    [CommandHandler generateCommandWithSwitchBtn:switchBtn text:@""];
}
-(StimVcMode *)stimMode{
    if (_stimMode == nil) {
        _stimMode = [[StimVcMode alloc]init];
        _stimMode.controllerTitle = NSStringFromClass([self class]);
        _stimMode.textBoxVaule = @"";
        _stimMode.switchName = @"";
        _stimMode.switchTyte = @"";
    }
    return _stimMode;
}

-(void)changeSwitchStateWithSelectBtn:(NSButton *)switchBtn{
    
    NSButton *lastBtn = nil;
    if ([self.mutexSwitchsArr2 containsObject:switchBtn]) {
        lastBtn = self.lastBtn2;
    }else if ([self.mutexSwitchsArr1 containsObject:switchBtn]){
        lastBtn = self.lastBtn1;
    }else if ([self.mutexSwitchsArr3 containsObject:switchBtn]){
        lastBtn = self.lastBtn3;
    }
    
    if (lastBtn==switchBtn) {
        return;
    }else{
        if (lastBtn) {
            NSControlStateValue state =!switchBtn.state;
            [lastBtn setState:state];
            [self setSwitch1BtnImage:lastBtn];
        }
    }
    
    lastBtn = switchBtn;
}


-(void)dealloc{
//    [super dealloc];
    NSLog(@"%s",__func__);

}




-(void)respondsToStimControllerSwitchClickWithSwtichName:(NSString *)name switchBtn:(NSButton *)switchBtn{
    self.stimMode.switchState = switchBtn.state;
    self.stimMode.textBoxVaule = @"";
    if ([name containsString:@"++"]) {
        NSArray *arr = [name componentsSeparatedByString:@"++"];
        self.stimMode.switchName = arr[0];
        if (arr.count == 2) {
            self.stimMode.textBoxVaule = arr[1];
        }
    }else{
        self.stimMode.switchName = name;
    }

    self.stimMode.switchTag = (int)switchBtn.tag;
    self.stimMode.switchTyte = switchBtn.alternateTitle;
    
    if (self.stimDelegate && [self.stimDelegate respondsToSelector:@selector(StimControllerSwitchClick:)]) {
        
        [self.stimDelegate StimControllerSwitchClick:self.stimMode];
    }
}
@end
