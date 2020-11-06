//
//  MyWindowController.m
//  DvpStimDemo
//
//  Created by ciwei luo on 2020/11/4.
//  Copyright © 2020 ciwei luo. All rights reserved.
//

#import "MyWindowController.h"


@interface MyWindowController ()


@end

@implementation MyWindowController



- (void)windowDidLoad {
    [super windowDidLoad];

    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}



#pragma mark - StimMainVcProtocol
-(void)StimControllerSwitchClick:(StimVcMode *)stimVcMode{
    NSString *controllerTitle = stimVcMode.controllerTitle;
    StimSwitchState switchState = stimVcMode.switchState;
    NSString *switchName = stimVcMode.switchName;
    int switchTag = stimVcMode.switchTag;
    NSString *switchTyte = stimVcMode.switchTyte;
    
    
    NSLog(@"respondsToStimControllerSwitchClick----controllerTitle:%@--switchState:%lu--switchName:%@--switchTag:%d--switchTyte:%@--",controllerTitle,(unsigned long)switchState,switchName,switchTag,switchTyte);
    

//    if ([controllerTitle isEqualToString:@"CCELoadViewController"]) {
//
//    }else if ([controllerTitle isEqualToString:@"DMICViewController"]){
//
//    }else if ([controllerTitle isEqualToString:@"ResAudioViewController"]){
//
//    }
//   Insert code here....
    
    
}


- (IBAction)testLogView:(NSTextField *)sender {
}
@end
