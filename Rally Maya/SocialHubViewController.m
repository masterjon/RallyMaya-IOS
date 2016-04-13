//
//  SocialHubViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/28/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "SocialHubViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"

@interface SocialHubViewController ()

@end

@implementation SocialHubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1];/*#ffdb7b*/
    label.text = @"REDES SOCIALES";
    self.navigationItem.titleView = label;
    [label sizeToFit];
    NSArray *viewControllers = self.navigationController.viewControllers;
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    
    NSString *fullURL = @"http://rallymaya.punklabs.ninja/socialhub";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:requestObj];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupLeftMenuButton {
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton];
}
- (void)leftDrawerButtonPress:(id)leftDrawerButtonPress {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
-(IBAction) openFacebook{
    NSString *fbLink = @"fb://profile/132058193656387";
        if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:fbLink]]) {
            fbLink = @"https://www.facebook.com/RallyMayaMexico";
        }
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:fbLink]];

}
-(IBAction) openTwitter{
        NSString *twLink = @"twitter://user?screen_name=rallymayamexico";
        if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:twLink]]) {
            twLink = @"https://twitter.com/rallymayamexico";
    
        }
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:twLink]];
}

-(IBAction) openInstagram{
    NSString *twLink = @"twitter://user?screen_name=rallymayamexico";
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:twLink]]) {
        twLink = @"https://twitter.com/rallymayamexico";
        
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:twLink]];
}
-(IBAction) openPeriscope{
    NSString *twLink = @"twitter://user?screen_name=rallymayamexico";
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:twLink]]) {
        twLink = @"https://twitter.com/rallymayamexico";
        
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:twLink]];
}
-(IBAction) openYoutube{
    NSString *twLink = @"twitter://user?screen_name=rallymayamexico";
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:twLink]]) {
        twLink = @"https://twitter.com/rallymayamexico";
        
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:twLink]];
}

@end
