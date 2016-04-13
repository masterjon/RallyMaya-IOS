//
//  RallyViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/24/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "RallyViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "Utils.h"

@interface RallyViewController ()

@end

@implementation RallyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NavigatrionDrawer
    self.navigationItem.titleView = [Utils getNavLabel:@"RALLY MAYA MÉXICO"];
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    
    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    
    
    // Change StateSelected
    UIColor *titleHighlightedColor = [UIColor colorWithRed:0.906 green:0.714 blue:0.196 alpha:1];/*#e7b632*/
    
    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : titleHighlightedColor} forState:UIControlStateSelected];
    
    [[UITabBar appearance] setTintColor:titleHighlightedColor];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:249.0/255 green:249.0/255 blue:249.0/255 alpha:1]]; /*#e9e7e7*/

    //[[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
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
