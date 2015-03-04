//
//  TipsViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/24/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "TipsViewController.h"

@interface TipsViewController ()

@end

@implementation TipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    
    
    // Change StateSelected
    UIColor *titleHighlightedColor = [UIColor colorWithRed:0.855 green:0.694 blue:0.502 alpha:1];
    
    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : titleHighlightedColor} forState:UIControlStateSelected];
    
    [[UITabBar appearance] setTintColor:titleHighlightedColor];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:12.0/255.0 green:12.0/255.0 blue:10.0/255.0 alpha:1]];
    //[[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
