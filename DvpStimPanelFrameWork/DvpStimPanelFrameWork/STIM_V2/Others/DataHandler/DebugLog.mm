//
//  DebugLog
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 suncode. All rights reserved.
//

#import "DebugLog.h"

#define LogFOLDER @"/vault/MixDebugLog"

@interface DebugLog ()

@end


@implementation DebugLog


+(void)saveLogToDefaultFileWithContent:(NSString*)str{
    
    [self saveLogWithContent:str directoryPath:LogFOLDER fileName:@"xaiver"];
    
}

+(void)saveLogToDefaultFileWithContent:(NSString*)str fileName:(NSString *)fileName{
    
    [self saveLogWithContent:str directoryPath:LogFOLDER fileName:fileName];
    
}


+(void)saveLogWithContent:(NSString*)str directoryPath:(NSString *)directoryPath fileName:(NSString *)fileName{
    //Create the file
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyy-MM-dd HH:mm:ss"];
    NSString* currenttime = [formatter stringFromDate:[NSDate date]];
    NSMutableString *mutString = [NSMutableString stringWithString:currenttime];
    //NSString* currenttime = [formatter stringFromDate:startTime];
    
    NSString *file_name = [NSString stringWithFormat:@"%@.txt",fileName];
    NSString * filepath = [directoryPath stringByAppendingPathComponent:file_name];
    NSFileManager *fileManager =[NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filepath]) {
        if (![fileManager fileExistsAtPath:directoryPath]) {
            [fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        [fileManager createFileAtPath:filepath contents:nil attributes:nil];
    }
    
    if (![filepath containsString:@".csv"]) {
        str = [NSString stringWithFormat:@"%@\n",str];
    }
    [mutString appendString:str];
    NSData *data=[mutString dataUsingEncoding:NSUTF8StringEncoding];
    
    //Write to the file
    NSFileHandle *fileWrite=[NSFileHandle fileHandleForUpdatingAtPath:filepath];
    @synchronized (fileWrite) {
        [fileWrite seekToEndOfFile];
        [fileWrite writeData:data];
        [fileWrite closeFile];
    }
}


@end
