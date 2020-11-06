# DvpStimPanelFrameWork

### Overview

`StimMainVC` in the `DvpStimPanelFrameWork.framework`  is an Objective-C subclass of `NSWindowController` that automatically manages Stim Panel view controllers for handling app preferences. it contains some subviewcontrollers inherit from `STIMBaseViewController` class as `RigelViewController`、`ResAudioViewController`、`PowerViewController`、`PenroseViewController`、`ORIONViewController`、`LDCMViewController`、`DMICViewController`、`DischargeViewController`、`ButtonPressViewController`、`NTCViewController`... also you can add your viewcontrollers into `StimMainVC`.

Here is a shot of the included example application:
![DvpStimPanelFrameWork Example Application](<rdar://problem/xxxxxxx> DvpStimPanelFrameWork.framework Releases )


### Usage
1.Drag  `DvpStimPanelFrameWork.framework`  into the path `/Library/Frameworks` if app is unable to be opened.
2.Drag `CCNPreferencesWindowController.framework` into your Xcode project.
3.New create a  `DvpStimController`  class to inherit the `StimMainVC` 
4.Implement `StimMainVcProtocol` in the `DvpStimController` class.when switch button was clicked on stim panel.some infos will transfer into `-(void)StimControllerSwitchClick:(StimVcMode *)stimVcMode` method.
5.get the parameters of call-back as example below and set your command to control fixture...
`//--controllerName:PowerViewController--switchState:1--switchName:Set_VBATT--switchTag:3--switchTyte:VBATT--textVaule:4200`  

```Objective-C

AppDelegate.m

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
// Insert code here to initialize your application
self.stimVC = [[DvpStimController alloc] initWithWindowNibName:@"DvpStimController"];
}

- (IBAction)stimPanel:(NSButton *)btn {

[self.stimVC showWindowWithViewControllers:@[

                                           [CCELoadViewController allocInit],
                                           [DMICViewController allocInit],
                                           [ResAudioViewController allocInit],
                                           [ORIONViewController allocInit],
                                           [PowerViewController allocInit],
                                           [RigelViewController allocInit],
                                           [NTCViewController allocInit],
                                           [ButtonPressViewController allocInit],
                                           [DischargeViewController allocInit],
                                           [LDCMViewController allocInit],
                                           [PenroseViewController allocInit],
                                           [DemoStimController allocInit]

                                           ]];
}


DvpStimController.m (inherit the `StimMainVC` class)

#pragma mark - StimMainVcProtocol

//Implement StimMainVcProtocol
-(void)StimControllerSwitchClick:(StimVcMode *)stimVcMode{

    NSString *controllerTitle = stimVcMode.controllerTitle;
    StimSwitchState switchState = stimVcMode.switchState;
    NSString *switchName = stimVcMode.switchName;
    int switchTag = stimVcMode.switchTag;
    NSString *switchTyte = stimVcMode.switchTyte;
    NSString *textVaule = stimVcMode.textBoxVaule;
    NSString *log =[NSString stringWithFormat:@"--controllerName:%@--switchState:%lu--switchName:%@--switchTag:%d--switchTyte:%@--textVaule:%@",controllerTitle,(unsigned long)switchState,switchName,switchTag,switchTyte,textVaule];

    self.log.title =log;

    NSLog(@"%@", log);
    
    //--controllerName:PowerViewController--switchState:1--switchName:Set_VBATT--switchTag:3--switchTyte:VBATT--textVaule:4200

//   Insert code here....


//    if ([controllerTitle isEqualToString:@"CCELoadViewController"]) {
//
//    }else if ([controllerTitle isEqualToString:@"DMICViewController"]){
//
//    }else if ([controllerTitle isEqualToString:@"ResAudioViewController"]){
//
//    }


}


```
That's all.


### Requirements

`CCNPreferencesWindowController` was written using ARC and "modern" Objective-C 2. At the moment it has only support for OS X 10.12 Yosemite. OS X 10.1 Mavericks should work too, but it's untested yet.Just contact us at [ryan.gao@suncode-smart.com] [louis.luo@suncode-smart.com]


### Contribution

The code is provided as-is, and it is far from being complete or free of bugs. If you like this component feel free to support it. Make changes related to your needs, extend it or just use it in your own project. Pull-Requests and Feedbacks are very welcome.


