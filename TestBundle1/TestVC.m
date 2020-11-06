//
//  TestVC.m
//  TestBundle1
//
//  Created by ciwei luo on 2020/11/3.
//  Copyright © 2020 ciwei luo. All rights reserved.
//

#import "TestVC.h"

@interface TestVC ()

@end

@implementation TestVC

+(instancetype)testVC{
    return [[TestVC alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}



- (IBAction)Click:(id)sender {
    
    NSLog(@"123312312");
}


@end
