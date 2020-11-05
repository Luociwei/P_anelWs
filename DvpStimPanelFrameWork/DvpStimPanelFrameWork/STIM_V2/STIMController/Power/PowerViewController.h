//
//  BaseVC.h
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STIMBaseViewController.h"
//#import "DutController.h"


@interface PowerViewController<DataInterface> : STIMBaseViewController



-(void)resetRelays;

@end
