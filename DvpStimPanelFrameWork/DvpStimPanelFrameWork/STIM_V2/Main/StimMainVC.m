//
//  StimMainVC
//  STIM_Pannel
//
//  Created by ciwei luo on 2019/10/17.
//  Copyright © 2019 macdev. All rights reserved.
//

#import "StimMainVC.h"
#import "ExtensionConst.h"
#import "StimTabViewController.h"


@interface StimMainVC ()

//@property (assign) IBOutlet NSComboBox *comboBox;
@property (strong,nonatomic)StimTabViewController *tabVC;
@property(nonatomic,strong)NSViewController *currentController;
//@property (assign) IBOutlet NSTextField *cr_load1;
//@property (assign) IBOutlet NSTextField *cc_load1;
//@property (assign) IBOutlet NSTextField *cr_load2;
//@property (assign) IBOutlet NSTextField *cc_load2;
//@property (assign) IBOutlet NSTextField *vbatt;
//@property (assign) IBOutlet NSTextField *vbus;
@end


@implementation StimMainVC

- (void)showWindowWithViewControllers:(NSArray <STIMBaseViewController *>*)viewControllers {
    self.window.alphaValue = 0.0;
    [self showWindow:self];
    [self.window makeKeyAndOrderFront:self];
    [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
    
    //    [self activateViewController:self.viewControllers[0] animate:NO];
    //    if (self.window.toolbar) {
    //        if (self.showToolbarItemsAsSegmentedControl) {
    //            [self.segmentedControl selectSegmentWithTag:0];
    //        }
    //        else {
    //            [self.window.toolbar setSelectedItemIdentifier:self.toolbarDefaultItemIdentifiers[(self.centerToolbarItems ? 1 : 0)]];
    //        }
    //    }
    self.window.alphaValue = 1.0;
    
    [self addViewControllers:viewControllers];
    
    
    
}
//- (id)init {
//    return [super initWithWindowNibName:@"WindowController"];
//}

//+(instancetype)allocInit{
//    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
////    /Versions/A/Resources/StimMainVC.nib
//    NSString *path = [bundle.bundlePath stringByAppendingPathComponent:@"Versions/A/Resources/StimMainVC.nib"];
//    StimMainVC *vc = [[StimMainVC alloc] initWithWindowNibPath:path owner:self];
//
//
//    return vc;
//
//}


//- (IBAction)selectionChanged:(NSComboBox *)comboBox {
//
//    NSInteger selectedIndex = comboBox.indexOfSelectedItem;
//    self.tabVC.selectedTabViewItemIndex=selectedIndex;
//   // [self changeViewController:selectedIndex];
//}

-(void)addViewControllers:(NSArray <STIMBaseViewController *>*)viewControllers{

    NSInteger vcCounts = viewControllers.count;
    if (vcCounts) {
        for (int i =0; i<vcCounts; i++) {
            STIMBaseViewController *vc = viewControllers[i];
            [self setUpChildsViewCtroller:vc];
        }
    }

    
}
//[[MyWindowController alloc] initWithWindowNibName:@"MyWindowController"];

- (void)windowDidLoad {
    [super windowDidLoad];
   
    StimTabViewController *tabViewController =[[StimTabViewController alloc]init];
    tabViewController.view.frame= NSMakeRect(0, 0, 1000, 700);
    self.window.contentViewController = tabViewController;
    self.tabVC = tabViewController;
    //[CommandHandler FixtureReset];
    
//    if (self.comboBox.hidden) {
//        self.tabVC.selectedTabViewItemIndex = 0;
//    }else{
//        [self.comboBox removeAllItems];
//        for (NSViewController *subVC in tabViewController.childViewControllers) {
//            [self.comboBox addItemWithObjectValue:subVC.title];
//        }
//        [self.comboBox selectItemAtIndex:0];
//
////        self.tabVC.tabStyle = NSTabViewControllerTabStyleUnspecified;
//    }
    
//    
//      [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refleshFromChildsVC:) name:StimSetNotification object:nil];
    
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(resetAll) name:@"stimPanelResetAll" object:nil];
}


-(void)refleshFromChildsVC:(NSNotification *)notifi{
    NSDictionary *userInfo = [notifi userInfo];
    if (!userInfo.count) {
        return;
    }
    NSString *key = userInfo.allKeys[0];
    NSString *vaule = userInfo[key];
//    if ([key isEqualToString:Set_ELoad1_CR]) {
//        self.cr_load1.stringValue = [NSString stringWithFormat:@"CR_Load_1:%@mA",vaule];
//    }else if ([key isEqualToString:Set_ELoad1_CC]){
//        self.cc_load1.stringValue = [NSString stringWithFormat:@"CC_Load_1:%@mA",vaule];
//    }else if ([key isEqualToString:Set_ELoad2_CR]){
//        self.cr_load2.stringValue = [NSString stringWithFormat:@"CR_Load_2:%@mA",vaule];
//    }else if ([key isEqualToString:Set_ELoad2_CC]){
//        self.cc_load2.stringValue = [NSString stringWithFormat:@"CC_Load_2:%@mA",vaule];
//    }else if ([key isEqualToString:Set_VBUS]){
//        self.vbus.stringValue = [NSString stringWithFormat:@"VBUS:%@mV",vaule];;
//    }else if ([key isEqualToString:Set_VBATT]){
//        self.vbatt.stringValue = [NSString stringWithFormat:@"VBATT:%@mV",vaule];;
//    }
}

-(void)changeViewController:(NSInteger)index {
    [[_currentController view] removeFromSuperview];
    _currentController = [[self.contentViewController childViewControllers]objectAtIndex:index];
    [self.contentViewController.view addSubview:[_currentController view]];
    
    [[_currentController view] setFrame:[self.contentViewController.view bounds]];
    [[_currentController view] setAutoresizingMask:NSViewWidthSizable|NSViewWidthSizable];
    
}

//- (IBAction)group_btn:(id)sender {
//    NSString *path = @"open /vault/MixDebugLog";
//    system(path.UTF8String);
//}
//- (IBAction)switch_test:(id)sender {
//    
//}
//
//- (IBAction)reset_all:(id)sender {
//    [self resetAll];
//}


-(void)resetAll{
    
//    NSString *vaule = @"";
//    self.cr_load1.stringValue = [NSString stringWithFormat:@"CR_Load_1:%@mA",vaule];
//
//    self.cc_load1.stringValue = [NSString stringWithFormat:@"CC_Load_1:%@mA",vaule];
//
//    self.cr_load2.stringValue = [NSString stringWithFormat:@"CR_Load_2:%@mA",vaule];
//
//    self.cc_load2.stringValue = [NSString stringWithFormat:@"CC_Load_2:%@mA",vaule];
//
//    self.vbus.stringValue = [NSString stringWithFormat:@"VBUS:%@mV",vaule];;
//
//    self.vbatt.stringValue = [NSString stringWithFormat:@"VBATT:%@mV",vaule];;
//
    
    NSString *fileCSV = [[NSBundle mainBundle] pathForResource:@"ChooseScript" ofType:@"plist"];
    NSMutableDictionary *listCsvName = [[NSMutableDictionary alloc]init];
    [listCsvName setDictionary:[NSDictionary dictionaryWithContentsOfFile:fileCSV]];
    
    if ([listCsvName valueForKey:@"ResetAll_TEST"])
    {
        
        NSString *csvName = [listCsvName valueForKey:@"ResetAll_TEST"];
        NSLog(@"%@",csvName);
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                             csvName,@"Load_Profile_Debug",nil];
        [[NSDistributedNotificationCenter defaultCenter] postNotificationName:kNotificationOnLoadProfile object:nil userInfo:dic deliverImmediately:YES];
        
        NSString *path = [[[NSBundle mainBundle] bundlePath] stringByDeletingLastPathComponent];
        path = [NSString stringWithFormat:@"%@/DutSocket.app",path];
        NSLog(@"===:::>>path : %@",path);
        [[NSWorkspace sharedWorkspace] launchApplication:path];
        
        [NSThread sleepForTimeInterval:10];
    }
    
    
    //    [CommandHandler FixtureReset];
    [self resetAllRelays];
}

-(void)setUpChildsViewCtroller:(STIMBaseViewController *)vc{
    
    NSString *title = NSStringFromClass([vc class]);
    vc.title = title;
//    __weak typeof(self) wSelf = self;
    vc.stimDelegate = self;
    if ([title containsString:@"ViewController"]) {
        NSRange range = [title rangeOfString:@"ViewController"];
        vc.title = [title substringToIndex:range.location];
    }
//    vc.view.frame = self.tabVC.view.bounds;
    [self.tabVC addChildViewController:vc];
    
}


-(void)resetAllRelays{
   
    for (STIMBaseViewController *vc in self.tabVC.childViewControllers) {
        [vc resetRelays];
    }
}

-(void)dealloc{
//    [super dealloc];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




@end
