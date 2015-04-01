//
//  RallyViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/23/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "RallyViewController.h"
#import "WebViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#define MAX_HEIGHT 2000
@interface RallyViewController ()

@end

@implementation RallyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Inside another ViewController
    
    //NavigatrionDrawer
    self.navigationItem.title = @"RALLY MAYA";
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
    
        [self setupLeftMenuButton];
    }
    
    _scrollView.contentSize = CGSizeMake(_scrollView.contentSize.width,_scrollView.frame.size.height);
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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([segue.identifier isEqualToString:@"pdfSegue"]) {
        [segue.destinationViewController setTitle:NSLocalizedString(@"REGLAMENTO",nil)];
        [segue.destinationViewController setUrl: @"http://punklabs.ninja/rallymaya/static/REGLAMENTO-OFICIAL-DEFINITIVO-RALLY-MAYA-2015.pdf"];
    }
}


//- (IBAction)ReglamentoButton:(id)sender {
//    NSString *pdfLink = @"";
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:pdfLink]];
//    
//}
@end
