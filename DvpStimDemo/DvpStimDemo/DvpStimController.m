//
//  DvpStimController.m
//  DvpStimDemo
//
//  Created by ciwei luo on 2020/11/5.
//  Copyright © 2020 ciwei luo. All rights reserved.
//

#import "DvpStimController.h"

@interface DvpStimController ()
@property (weak) IBOutlet NSButton *log;
@property (assign) IBOutlet NSTextField *logView;
@end

@implementation DvpStimController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)reset_all:(id)sender {
    [self resetAllRelays];
}

#pragma mark - StimMainVcProtocol
-(void)StimControllerSwitchClick:(StimVcMode *)stimVcMode{
    NSString *controllerTitle = stimVcMode.controllerTitle;
    StimSwitchState switchState = stimVcMode.switchState;
    NSString *switchName = stimVcMode.switchName;
    int switchTag = stimVcMode.switchTag;
    NSString *switchTyte = stimVcMode.switchTyte;
    NSString *textVaule = stimVcMode.textBoxVaule;
    NSString *log =[NSString stringWithFormat:@"--controllerName:%@--switchState:%lu--switchName:%@--switchTag:%d--switchTyte:%@--textVaule:%@",controllerTitle,(unsigned long)switchState,switchName,switchTag,switchTyte,textVaule];
    
    self.log.title =log;
    
    NSLog(@"%@", log);
    //    if ([controllerTitle isEqualToString:@"CCELoadViewController"]) {
    //
    //    }else if ([controllerTitle isEqualToString:@"DMICViewController"]){
    //
    //    }else if ([controllerTitle isEqualToString:@"ResAudioViewController"]){
    //
    //    }
    //   Insert code here....
    
    
}


@end
