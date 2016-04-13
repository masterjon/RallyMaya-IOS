//
//  ViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 2/23/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>
NSTimer *timer;

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *myCounterLabel;


-(void)updateCounter:(NSTimer *)theTimer;
-(void)countdownTimer;
@end

