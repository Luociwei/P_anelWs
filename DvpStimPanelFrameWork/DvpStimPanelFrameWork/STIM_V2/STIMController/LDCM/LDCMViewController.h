//
//  LDCMViewController.h
//  DUT_Tool
//
//  Created by ciwei luo on 2020/8/24.
//  Copyright © 2020 ___Intelligent Automation___. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STIMBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LDCMViewController : STIMBaseViewController
//+(instancetype)allocInit;
-(void)resetRelays;
@end

NS_ASSUME_NONNULL_END
