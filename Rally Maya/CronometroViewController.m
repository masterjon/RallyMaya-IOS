//
//  CronometroViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/26/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "CronometroViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"

@interface CronometroViewController ()

@end

@implementation CronometroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NavigatrionDrawer
    self.navigationItem.title = @"CRONOMETRO";
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    // Do any additional setup after loading the view.
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)downloadButton:(UIButton *)sender {
    NSString *iTunesLink = @"itms://itunes.apple.com/gb/app/id348836721";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}
@end
