//
//  StimVcMode.h
//  DvpStimPanelFrameWork
//
//  Created by ciwei luo on 2020/11/5.
//  Copyright © 2020 suncode. All rights reserved.
//
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
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//typedef NS_OPTIONS(NSUInteger, StimBaseControllerNames) {
//    StimControlleCCELoad= 1,
//    StimControlleDMICV = 2,
//    StimControlleResAudio = 3,
//    StimControlleORION = 4,
//    StimControllePower= 5,
//    StimControlleRigel = 6,
//    StimControlleNTC = 7,
//    StimControlleButtonPress = 8,
//    StimControlleRigel = 9,
//    StimControlleNTC = 10,
//    StimControlleButtonPress = 8
//};
typedef NS_OPTIONS(NSUInteger, StimSwitchState) {
    StimSwitchStateOff= 0,
    StimSwitchStateOn = 1

};

@interface StimVcMode : NSObject
@property(copy)NSString *controllerTitle;

@property StimSwitchState switchState;//Switch Button State

@property(copy)NSString *switchName;//S1/S2/S3....

@property int switchTag;//Switch Button Tag

@property(copy)NSString *switchTyte;//IO

@property(copy)NSString *textBoxVaule;//IO

@end

NS_ASSUME_NONNULL_END
