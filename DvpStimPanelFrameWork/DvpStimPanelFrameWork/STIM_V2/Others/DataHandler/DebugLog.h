//
//  DebugLog
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 suncode. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DebugLog : NSObject
+(void)saveLogToDefaultFileWithContent:(NSString*)str;
+(void)saveLogWithContent:(NSString*)str directoryPath:(NSString *)directoryPath fileName:(NSString *)fileName;
+(void)saveLogToDefaultFileWithContent:(NSString*)str fileName:(NSString *)fileName;

@end

