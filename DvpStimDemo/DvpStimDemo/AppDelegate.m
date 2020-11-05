//
//  AppDelegate.m
//  DvpStimDemo
//
//  Created by ciwei luo on 2020/11/3.
//  Copyright © 2020 ciwei luo. All rights reserved.
//

#import "AppDelegate.h"
#import <DvpStimPanelFrameWork/DischargeViewController.h>
#import <DvpStimPanelFrameWork/CCELoadViewController.h>
#import <DvpStimPanelFrameWork/StimMainVC.h>
#import "MyWindowController.h"

#import "EloadVC.h"
#import "DmicVC.h"
#import "ResAudioVC.h"
#import "OrionVC.h"
#import "PowerVC.h"

#import "RigelVC.h"
#import "NtcVC.h"
#import "ButtonPressVC.h"
#import "DischargeVC.h"
#import "LdcmVC.h"
#import "PenroseVC.h"

@interface AppDelegate ()
@property (nonatomic, strong) MyWindowController *stimVC;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

//    [self setUPChildVC:[CCELoadViewController allocInit]];
////    [self setUPChildVC:[ELoadViewController new]];
//    [self setUPChildVC:[DMICViewController allocInit]];
//    [self setUPChildVC:[ResAudioViewController allocInit]];
//    [self setUPChildVC:[ORIONViewController allocInit]];
//    [self setUPChildVC:[PowerViewController allocInit]];
//    [self setUPChildVC:[RigelViewController allocInit]];
//    [self setUPChildVC:[NTCViewController allocInit]];
//    [self setUPChildVC:[ButtonPressViewController allocInit]];
//    [self setUPChildVC:[DischargeViewController allocInit]];
//    [self setUPChildVC:[LDCMViewController allocInit]];
//    [self setUPChildVC:[PenroseViewController allocInit]];

- (IBAction)stimPanel:(NSButton *)btn {
    
    
    [self.stimVC showWindowWithViewControllers:@[
                                                 
                                                 [CCELoadViewController allocInit],
                                                 [DMICViewController allocInit],
                                                 [ResAudioViewController allocInit],
                                                 [ORIONViewController allocInit],
                                                 [PowerViewController allocInit],
                                                 [RigelViewController allocInit],
                                                 [NTCViewController allocInit],
                                                 [ButtonPressViewController allocInit],
                                                 [DischargeViewController allocInit],
                                                 [LDCMViewController allocInit],
                                                 [PenroseViewController allocInit],
            
                                                 
                                                 ]];
}



- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    self.stimVC = [[MyWindowController alloc] initWithWindowNibName:@"MyWindowController"];

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
