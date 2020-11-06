//
//  StimMainVC
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STIMBaseViewController.h"
@class StimMainVcProtocol;
NS_ASSUME_NONNULL_BEGIN
#define kNotificationOnLoadProfile            @"On_ReloadProfileByRecMsg"
#define kNotificationStartTestByRecMsg        @"On_StartTestByRecMsg"

@interface StimMainVC : NSWindowController<StimMainVcProtocol>

-(void)showWindowWithViewControllers:(NSArray <STIMBaseViewController *>*)viewControllers;
-(void)resetAllRelays;

@end

NS_ASSUME_NONNULL_END
