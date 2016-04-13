//
//  PerfilTabController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/11/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "PerfilTabController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "Utils.h"

@interface PerfilTabController ()

@end

@implementation PerfilTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLeftMenuButton];
    //[self setupLeftMenuButton];
    self.navigationItem.titleView = [Utils getNavLabel:@"MI CUENTA"];
    
    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    
    
    // Change StateSelected
    UIColor *titleHighlightedColor = [UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1]; /*#ffdb7b*/
    
    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : titleHighlightedColor} forState:UIControlStateSelected];
    
    [[UITabBar appearance] setTintColor:titleHighlightedColor];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:249.0/255 green:249.0/255 blue:249.0/255 alpha:1]]; /*#e9e7e7*/

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

@end
