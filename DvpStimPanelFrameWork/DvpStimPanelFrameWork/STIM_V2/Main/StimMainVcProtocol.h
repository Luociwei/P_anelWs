//
//  StimMainVcProtocol.h
//  DvpStimPanelFrameWork
//
//  Created by ciwei luo on 2020/11/5.
//  Copyright © 2020 suncode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StimVcMode.h"

NS_ASSUME_NONNULL_BEGIN

@protocol StimMainVcProtocol <NSObject>
@optional
-(void)StimControllerSwitchClick:(StimVcMode *)stimVcMode;
@end

NS_ASSUME_NONNULL_END
