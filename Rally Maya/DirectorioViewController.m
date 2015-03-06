//
//  DirectorioViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/2/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "DirectorioViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"

@interface DirectorioViewController ()

@end

@implementation DirectorioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NavigatrionDrawer
    self.navigationItem.title = @"DIRECTORIO";
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
    
    
    // Change StateSelected
    UIColor *titleHighlightedColor = [UIColor colorWithRed:0.855 green:0.694 blue:0.502 alpha:1];
    
    [UITabBarItem.appearance setTitleTextAttributes: @{NSForegroundColorAttributeName : titleHighlightedColor} forState:UIControlStateSelected];
    
    [[UITabBar appearance] setTintColor:titleHighlightedColor];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:12.0/255.0 green:12.0/255.0 blue:10.0/255.0 alpha:1]];
    //[[UITabBar appearance] setBarTintColor:[UIColor yellowColor]];
    // Do any additional setup after loading the view.
}
- (void)setupLeftMenuButton {
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton];
}

- (void)leftDrawerButtonPress:(id)leftDrawerButtonPress {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
