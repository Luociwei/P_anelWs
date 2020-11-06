//
//  CommandHandler
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import "CommandHandler.h"
#import "GraphicHeader.h"

@interface CommandHandler ()

@end


@implementation CommandHandler

+(NSString *)generateCommandWithSwitchBtn:(NSButton *)switchBtn text:(NSString *)strButtonBlindTextfile{
    NSString *sPrefix = switchBtn.alternateTitle;
    int nidentifier = switchBtn.tag;
    int nstate=(int)switchBtn.state;
    if (!strButtonBlindTextfile.length) {
        strButtonBlindTextfile=@"N/A";
    }
    
    NSString *cmd =[self graphicToCmd:sPrefix withIdentifier:nidentifier withState:!nstate withTextContent:strButtonBlindTextfile];
    return cmd;
}


+(NSString *)generateCommandWithPrefix:(NSString *)sPrefix nidentifier:(int)nidentifier nstate:(int)nstate text:(NSString *)strButtonBlindTextfile{
    NSString *cmd = [self graphicToCmd:sPrefix withIdentifier:nidentifier withState:!nstate withTextContent:strButtonBlindTextfile];
    return cmd;
}

+(NSString *)graphicToCmd:(NSString *) sPrefix withIdentifier:(int)nidentifier withState:(int)nState withTextContent:(NSString *)buttonText
{
    
    
    char cmd[255];
    sprintf(cmd, "luadebugpanel.onClickGraphic(\"%s\",%d,%d,\"%s\")",
            [sPrefix cStringUsingEncoding:NSASCIIStringEncoding],
            nidentifier,
            nState,
            [buttonText cStringUsingEncoding:NSASCIIStringEncoding]
            );
    NSLog(@"===click: %s",cmd);
    if ([[NSString stringWithUTF8String:cmd] containsString:@"ORION_IO"])
    {
        return @"";
    }
    
    
    NSDictionary *cmdList=[self getSitmDatas];
    NSString *cmdSend= nil;
    NSString * identifier = [NSString stringWithFormat:@"%04d",nidentifier];
    
    
    if ([sPrefix isEqualToString:@"VBUS2"])
    {
        
        int btn_vaule =[buttonText intValue];
        NSString *key = @"X100";
        NSString *coefficient =@"100";
        if (btn_vaule<500&&btn_vaule>=0) {
            key = @"X1000";
            coefficient = @"1000";
        }else if (btn_vaule>=500&&btn_vaule<2000){
            key = @"X100";
            coefficient = @"100";
        }else if (btn_vaule>=2000&&btn_vaule<=3000){
            key = @"X10";
            coefficient =@"10";
        }
        
        if ([[cmdList valueForKey:@"VBUS2"] valueForKey:key]) {
            NSString *cmd = [[cmdList valueForKey:@"VBUS2"] valueForKey:key];
            
            NSMutableDictionary* dicCmd1 = [NSMutableDictionary dictionary];
            [dicCmd1 setValue:cmd forKey:@"send_XavierCmd"];
            [dicCmd1 setValue:coefficient forKey:@"coefficient"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Send_To_StimCmd" object
                                                                      :nil userInfo
                                                                      :dicCmd1] ;
        }
        
        [NSThread sleepForTimeInterval:0.5];
        if ([[cmdList valueForKey:@"VBUS2"] valueForKey:identifier])
        {
            if (buttonText &&[buttonText isNotEqualTo:@"N/A"])
            {
                NSString *str = [[cmdList valueForKey:@"VBUS2"] valueForKey:identifier];
                buttonText = [buttonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                
                if ([buttonText intValue]>3000)
                {
                    buttonText = @"3000";
                }
                if ([buttonText intValue]<0)
                {
                    buttonText = @"0";
                }
                cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                //                int volt = 5000;
                //                if ([identifier isEqualToString:@"0001"])
                //                {
                //                    volt = 5000;
                //                    int ret = (volt -1221)/4;
                //                    //cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:[NSString stringWithFormat:@"%d",ret]];
                //                }
                //                else if ([identifier isEqualToString:@"0002"])
                //                {
                //                    volt = 9000;
                //                }
                //                 else if ([identifier isEqualToString:@"0003"])
                //                {
                //                    volt = 12000;
                //                }
                //                else if ([identifier isEqualToString:@"0004"])
                //                {
                //                    volt = 15000;
                //                }
                
                NSLog(@"===sendCmd: %@",cmdSend);
                NSString *mutex_identifier = nil;
                if (cmdSend)
                {
                    NSArray *cmdArray = [cmdSend componentsSeparatedByString:@"#"];
                    if ([cmdArray count]>0)
                    {
                        cmdSend = cmdArray[0];
                    }
                    if ([cmdArray count]>1)
                    {
                        mutex_identifier = cmdArray[1];
                    }

                }
                
                
                
                NSMutableDictionary* dicCmd = [NSMutableDictionary dictionary];
                [dicCmd setValue:cmdSend forKey:kSendDUTCmd];
                [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationDUTCmd object
                                                                          :nil userInfo
                                                                          :dicCmd] ;
                
   
            }
            
            
        }
        
    }else{
        
        if ([sPrefix isEqualToString:@"BUTTON"])
        {
            if ([[cmdList valueForKey:@"BUTTON"] valueForKey:identifier])
            {
                if (buttonText &&[buttonText isNotEqualTo:@"N/A"])
                {
                    NSString *str = [[cmdList valueForKey:@"BUTTON"] valueForKey:identifier];
                    buttonText = [buttonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                }
                
                
            }
            
        }
        
        else if ([sPrefix isEqualToString:@"MEAS"])
        {
            if ([[cmdList valueForKey:@"MEAS"] valueForKey:identifier])
            {
                NSString *str = [[cmdList valueForKey:@"MEAS"] valueForKey:identifier];
                cmdSend = str;
            }
            
        }
        
        else if ([sPrefix isEqualToString:@"LDCM"])
        {
            if ([[cmdList valueForKey:@"LDCM"] valueForKey:identifier])
            {
                NSString *str = [[cmdList valueForKey:@"LDCM"] valueForKey:identifier];
                if (buttonText.length) {
                    
                    
                    buttonText = [buttonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    if ([buttonText intValue]>16000)
                    {
                        buttonText = @"16000";
                    }
                    if ([buttonText intValue]<1221)
                    {
                        buttonText = @"1221";
                    }
                    
                    int ret = ([buttonText intValue] -1221)/4;
                    //                int ret = (5000 -1221)/4;
                    cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:[NSString stringWithFormat:@"%d",ret]];
                    
                    
                    // cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                }
               
                
//                cmdSend = str;
            }
            
        }
        
        else if ([sPrefix isEqualToString:@"PDMBUTTON"])
        {
            if ([[cmdList valueForKey:@"PDMBUTTON"] valueForKey:identifier])
            {
                NSString *str = [[cmdList valueForKey:@"PDMBUTTON"] valueForKey:identifier];
                cmdSend = str;
            }
            
        }
        
        else if ([sPrefix isEqualToString:@"VBUS"])
        {
            if ([[cmdList valueForKey:@"VBUS"] valueForKey:identifier])
            {
                if (buttonText &&[buttonText isNotEqualTo:@"N/A"])
                {
                    NSString *str = [[cmdList valueForKey:@"VBUS"] valueForKey:identifier];
                    buttonText = [buttonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    if ([buttonText intValue]>16000)
                    {
                        buttonText = @"16000";
                    }
                    if ([buttonText intValue]<1221)
                    {
                        buttonText = @"1221";
                    }
                    
                    int ret = ([buttonText intValue] -1221)/4;
                    //                int ret = (5000 -1221)/4;
                    cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:[NSString stringWithFormat:@"%d",ret]];
                }
                
                
            }
            
        }
        
        
        else if ([sPrefix isEqualToString:@"VBATT"])
        {
            if ([[cmdList valueForKey:@"VBATT"] valueForKey:identifier])
            {
                if (buttonText &&[buttonText isNotEqualTo:@"N/A"])
                {
                    NSString *str = [[cmdList valueForKey:@"VBATT"] valueForKey:identifier];
                    buttonText = [buttonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    NSLog(@"---VBATT : %@",buttonText);
                    cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"krefreshTab" object:nil];
                }
            }
            
        }
        
        else if ([sPrefix isEqualToString:@"ELOAD"])
        {
            if ([[cmdList valueForKey:@"ELOAD"] valueForKey:identifier])
            {
                if (buttonText &&[buttonText isNotEqualTo:@"N/A"])
                {
                    NSString *str = [[cmdList valueForKey:@"ELOAD"] valueForKey:identifier];
                    buttonText = [buttonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    if ([buttonText isNotEqualTo:@"0"])
                    {
                        cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                    }
                    else
                    {
                        str = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                        cmdSend = [str stringByReplacingOccurrencesOfString:@"eload enable" withString:@"eload disable"];
                    }
                    
                    // [[NSNotificationCenter defaultCenter]postNotificationName:@"krefreshTab" object:nil];
                }
            }
            
        }
        
        else if ([sPrefix isEqualToString:@"Penrose"])
        {
            NSString *subKey = [NSString stringWithFormat:@"SetPwm%d",identifier.intValue];
            
            if (identifier.intValue == 1 || identifier.intValue == 2) {
                subKey = [NSString stringWithFormat:@"SetPwm%d",identifier.intValue];
            }else if(identifier.intValue == 3 || identifier.intValue == 4) {
                subKey = [NSString stringWithFormat:@"OffPwm%d",identifier.intValue];
            }
            
            NSString *vaule =[[cmdList valueForKey:@"Penrose"] valueForKey:subKey];

            if (vaule)
            {
//                if (buttonText &&[buttonText isNotEqualTo:@"N/A"])
//                {
                    NSString *str = vaule;
                    buttonText = [buttonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    if ([buttonText isNotEqualTo:@"0"])
                    {
                        cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                    }

//                }
            }
            
        }
        
        else if([sPrefix isEqualToString:@"IO_Penrose"])
        {
            NSString *subKey =@"";
            if (nState >0)
            {
                subKey = [NSString stringWithFormat:@"S%d_DISCONNECT",identifier.intValue];
            }
            else
            {
                subKey = [NSString stringWithFormat:@"S%d_CONNECT",identifier.intValue];
            }
            
            if ([[cmdList valueForKey:@"IO_Penrose"] valueForKey:subKey])
            {
                cmdSend = [[cmdList valueForKey:@"IO_Penrose"] valueForKey:subKey];
            }
            
        }
        
        else if ([sPrefix isEqualToString:@"Set_ELoad"])
        {
            NSString *subKey = [NSString stringWithFormat:@"CC_Load%d",identifier.intValue];
            NSString *vaule =[[cmdList valueForKey:@"Set_ELoad"] valueForKey:subKey];
            if (vaule)
            {
                if (buttonText &&[buttonText isNotEqualTo:@"N/A"])
                {
                    NSString *str = vaule;
                    buttonText = [buttonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    if ([buttonText isNotEqualTo:@"0"])
                    {
                        cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                    }
                    else
                    {
                        str = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                        cmdSend = [str stringByReplacingOccurrencesOfString:@"eload enable" withString:@"eload disable"];
                    }
                    
                    // [[NSNotificationCenter defaultCenter]postNotificationName:@"krefreshTab" object:nil];
                }
            }
            
        }
        
        else if([sPrefix isEqualToString:@"IO_LDCM"])
        {
            NSString *subKey =@"";
            if (nState >0)
            {
                subKey = [NSString stringWithFormat:@"S%d_DISCONNECT",identifier.intValue];
            }
            else
            {
                subKey = [NSString stringWithFormat:@"S%d_CONNECT",identifier.intValue];
            }
            
            if ([[cmdList valueForKey:@"IO_LDCM"] valueForKey:subKey])
            {
                cmdSend = [[cmdList valueForKey:@"IO_LDCM"] valueForKey:subKey];
            }
            
        }
        
        else if([sPrefix isEqualToString:@"IO_ELoad"])
        {
            NSString *subKey =@"";
            if (nState >0)
            {
                subKey = [NSString stringWithFormat:@"S%d_DISCONNECT",identifier.intValue];
            }
            else
            {
                subKey = [NSString stringWithFormat:@"S%d_CONNECT",identifier.intValue];
            }
            
            if ([[cmdList valueForKey:@"IO_ELoad"] valueForKey:subKey])
            {
                cmdSend = [[cmdList valueForKey:@"IO_ELoad"] valueForKey:subKey];
            }
            
        }
        
        else if([sPrefix isEqualToString:@"IO"])
        {
            NSString *subKey =@"";
            if (nState >0)
            {
                subKey = [NSString stringWithFormat:@"%@_DISCONNECT",identifier];
            }
            else
            {
                subKey = [NSString stringWithFormat:@"%@_CONNECT",identifier];
            }
            
            if ([[cmdList valueForKey:@"IO"] valueForKey:subKey])
            {
                cmdSend = [[cmdList valueForKey:@"IO"] valueForKey:subKey];
            }
            
        }
        else if([sPrefix isEqualToString:@"BIT"])
        {
            NSString *subKey =@"";
            if (nState >0)
            {
                subKey = [NSString stringWithFormat:@"%@_DISCONNECT",identifier];
            }
            else
            {
                subKey = [NSString stringWithFormat:@"%@_CONNECT",identifier];
            }
            
            if ([[cmdList valueForKey:@"IO"] valueForKey:subKey])
            {
                cmdSend = [[cmdList valueForKey:@"IO"] valueForKey:subKey];
            }
            
        }
        else if([sPrefix isEqualToString:@"EXIO"])
        {
            NSString *subKey =@"";
            if (nState >0)
            {
                subKey = [NSString stringWithFormat:@"%@_DISCONNECT",identifier];
            }
            else
            {
                subKey = [NSString stringWithFormat:@"%@_CONNECT",identifier];
            }
            if ([[cmdList valueForKey:@"EXIO"] valueForKey:subKey])
            {
                cmdSend = [[cmdList valueForKey:@"EXIO"] valueForKey:subKey];
            }
            
        }
        else if([sPrefix isEqualToString:@"LED"])
        {
            NSString *subKey =@"";
            if (nState >0)
            {
                subKey = [NSString stringWithFormat:@"%@_DISCONNECT",identifier];
            }
            else
            {
                subKey = [NSString stringWithFormat:@"%@_CONNECT",identifier];
            }
            if ([[cmdList valueForKey:@"LED"] valueForKey:subKey])
            {
                cmdSend = [[cmdList valueForKey:@"LED"] valueForKey:subKey];
            }
            
            
        }
        else if ([sPrefix isEqualToString:@"ORION_SET"])
        {
            if ([[cmdList valueForKey:@"ORION_SET"] valueForKey:identifier])
            {
                if (buttonText &&[buttonText isNotEqualTo:@"N/A"])
                {
                    NSString *str = [[cmdList valueForKey:@"ORION_SET"] valueForKey:identifier];
                    buttonText = [buttonText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    if ([buttonText isNotEqualTo:@"0"])
                    {
                        cmdSend = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                    }
                    else
                    {
                        str = [str stringByReplacingOccurrencesOfString:@"xxxx" withString:buttonText];
                        cmdSend = [str stringByReplacingOccurrencesOfString:@"eload enable" withString:@"eload disable"];
                    }
                    
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"krefreshTab" object:nil];
                }
            }
            
        }
        
        else if ([sPrefix isEqualToString:@"ORION_BTN"])
        {
            if ([[cmdList valueForKey:@"ORION_BTN"] valueForKey:identifier])
            {
                
                NSString *str = [[cmdList valueForKey:@"ORION_BTN"] valueForKey:identifier];
                cmdSend = str;
            }
        }
        
        else
        {
            
        }
        
        
        NSLog(@"===sendCmd: %@",cmdSend);
        NSString *mutex_identifier = nil;
        if (cmdSend)
        {
            NSArray *cmdArray = [cmdSend componentsSeparatedByString:@"#"];
            if ([cmdArray count]>0)
            {
                cmdSend = cmdArray[0];
            }
            if ([cmdArray count]>1)
            {
                mutex_identifier = cmdArray[1];
            }
            
        }
        
        NSMutableDictionary* dicCmd = [NSMutableDictionary dictionary];
        [dicCmd setValue:cmdSend forKey:@"send_XavierCmd"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Send_To_StimCmd" object
                                                                  :nil userInfo
                                                                  :dicCmd] ;
        
    }
    
    

    return cmdSend;
}


+(NSDictionary *)getSitmDatas{
    NSString *filecmd = [[NSBundle mainBundle] pathForResource:@"StimCmdList" ofType:@"plist"];
    NSDictionary *cmdList =[NSDictionary dictionaryWithContentsOfFile:filecmd];
    return cmdList;
}

+(void)FixtureReset{
    NSDictionary *cmdList = [self getSitmDatas];
    if ([[cmdList valueForKey:@"RESET_ALL"] valueForKey:@"FIXTURERESET"])
    {
        NSMutableDictionary* dicCmd = [NSMutableDictionary dictionary];
        NSString *resetCmds=[[cmdList valueForKey:@"RESET_ALL"] valueForKey:@"FIXTURERESET"];
        [dicCmd setValue:resetCmds forKey:@"send_XavierCmd"];
      
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Send_To_StimCmd" object
                                                                  :nil userInfo
                                                                  :dicCmd] ;
    }
}



@end
