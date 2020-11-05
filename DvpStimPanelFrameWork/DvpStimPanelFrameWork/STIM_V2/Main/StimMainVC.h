//
//  StimMainVC
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN
#define kNotificationOnLoadProfile            @"On_ReloadProfileByRecMsg"
#define kNotificationStartTestByRecMsg        @"On_StartTestByRecMsg"

@interface StimMainVC : NSWindowController

-(void)showWindowWithViewControllers:(NSArray <NSViewController *>*)viewControllers;
-(void)resetAllRelays;

@end

NS_ASSUME_NONNULL_END
