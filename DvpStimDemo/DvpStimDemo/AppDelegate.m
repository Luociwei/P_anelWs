//
//  AppDelegate.m
//  DvpStimDemo
//
//  Created by ciwei luo on 2020/11/3.
//  Copyright © 2020 ciwei luo. All rights reserved.
//
//[CCELoadViewController allocInit],
//[DMICViewController allocInit],
//[ResAudioViewController allocInit],
//[ORIONViewController allocInit],
//[PowerViewController allocInit],
//[RigelViewController allocInit],
//[NTCViewController allocInit],
//[ButtonPressViewController allocInit],
//[DischargeViewController allocInit],
//[LDCMViewController allocInit],
//[PenroseViewController allocInit],
#import "AppDelegate.h"
#import <DvpStimPanelFrameWork/CCELoadViewController.h>
#import <DvpStimPanelFrameWork/DMICViewController.h>
#import <DvpStimPanelFrameWork/ResAudioViewController.h>
#import <DvpStimPanelFrameWork/ORIONViewController.h>
#import <DvpStimPanelFrameWork/PowerViewController.h>
#import <DvpStimPanelFrameWork/RigelViewController.h>
#import <DvpStimPanelFrameWork/NTCViewController.h>
#import <DvpStimPanelFrameWork/ButtonPressViewController.h>
#import <DvpStimPanelFrameWork/NTCViewController.h>
#import <DvpStimPanelFrameWork/DischargeViewController.h>
#import <DvpStimPanelFrameWork/LDCMViewController.h>
#import <DvpStimPanelFrameWork/PenroseViewController.h>
#import <DvpStimPanelFrameWork/StimMainVC.h>
#import "DvpStimController.h"
#import "DemoStimController.h"


@interface AppDelegate ()

@property (nonatomic, strong) DvpStimController *stimVC;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.stimVC = [[DvpStimController alloc] initWithWindowNibName:@"DvpStimController"];
}

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
                                                 [DemoStimController allocInit]
            
                                                 ]];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
