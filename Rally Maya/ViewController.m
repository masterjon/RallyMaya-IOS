//
//  ViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/23/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "ViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "Utils.h"

@interface ViewController ()

@end
int days,hours, minutes, seconds;
int secondsLeft;
NSDate *endTime;

@implementation ViewController
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLeftMenuButton];
    self.navigationItem.titleView = [Utils getNavLabel:@"INICIO"];
    
    
    NSString *dateString = @"13-5-2016 16:00:00";
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [self parseDate:dateString format:@"dd-MM-yyyy HH:mm:ss"];
    
    endTime = dateFromString;
    secondsLeft = roundf(dateFromString.timeIntervalSinceNow);
    
    
    [self countdownTimer];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSDate*)parseDate:(NSString*)inStrDate format:(NSString*)inFormat {
    NSDateFormatter* dtFormatter = [[NSDateFormatter alloc] init];
    [dtFormatter setLocale:[NSLocale systemLocale]];
    [dtFormatter setDateFormat:inFormat];
    NSDate* dateOutput = [dtFormatter dateFromString:inStrDate];
    return dateOutput;
}

- (void)updateCounter:(NSTimer *)theTimer {
    if(secondsLeft > 0 ) {
        secondsLeft -- ;
        //        days = secondsLeft /
        days = secondsLeft / 86400;
        hours = (secondsLeft / 3600) % 24;
        minutes = (secondsLeft / 60) % 60;
        seconds = secondsLeft % 60;
        self.myCounterLabel.text = [NSString stringWithFormat:@"%02d   %02d   %02d   %02d",days, hours, minutes, seconds];
        // NSLog(@"%@ SECONDS",self.myCounterLabel.text);
    } else {
        secondsLeft = 0;
    }
}

-(void)countdownTimer {
    hours = minutes = seconds = 0;
    
    if([timer isValid]) {
        [timer invalidate];
        timer=nil;
    }
    //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
    
    // [pool release];
}
- (void)setupLeftMenuButton {
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton];
}

- (void)leftDrawerButtonPress:(id)leftDrawerButtonPress {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeBezelPanningCenterView];
    [self.mm_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end