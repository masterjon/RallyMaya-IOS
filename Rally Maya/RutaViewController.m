//
//  RutaViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/31/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "RutaViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import <AddressBook/AddressBook.h>
@import CoreLocation;
@interface RutaViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation RutaViewController
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)viewDidLoad {
    //NavigatrionDrawer
    [self.spinner setHidesWhenStopped:TRUE];
    [self.spinner1 setHidesWhenStopped:TRUE];
    [self.spinner2 setHidesWhenStopped:TRUE];
    [self.spinner3 setHidesWhenStopped:TRUE];
    [self.spinner4 setHidesWhenStopped:TRUE];
    [self.spinner5 setHidesWhenStopped:TRUE];
    
    [self.spinner startAnimating];
    [self.spinner1 startAnimating];
    [self.spinner2 startAnimating];
    [self.spinner3 startAnimating];
    [self.spinner4 startAnimating];
    [self.spinner5 startAnimating];
    
    
    NSString *fullURL = @"";
    if ([self.restorationIdentifier  isEqual: @"ruta_completa"]){
        fullURL = @"https://www.google.com/maps/d/embed?mid=zyVeoJOlaWyc.kiXL6nJXljeo";
    }
    else if ([self.restorationIdentifier  isEqual: @"ruta_1"]){
        fullURL = @"https://www.google.com/maps/d/embed?mid=zyVeoJOlaWyc.kVlXxgJeYxpE";
    }
    else if ([self.restorationIdentifier  isEqual: @"ruta_2"]){
        fullURL = @"https://www.google.com/maps/d/embed?mid=zyVeoJOlaWyc.kXkq0lerVBQo";
    }
    else if ([self.restorationIdentifier  isEqual: @"ruta_3"]){
        fullURL = @"https://www.google.com/maps/d/embed?mid=zyVeoJOlaWyc.k8BaFnPMlQ7k";
    }
    else if ([self.restorationIdentifier  isEqual: @"ruta_4"]){
        fullURL = @"https://www.google.com/maps/d/embed?mid=zyVeoJOlaWyc.kX3Gw4seuP7s";
    }
    else if ([self.restorationIdentifier  isEqual: @"ruta_5"]){
        fullURL = @"https://www.google.com/maps/d/embed?mid=zyVeoJOlaWyc.kOF71VVg_JKg";
    }
    
    
    

    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_WebView loadRequest:requestObj];

    NSLog(@"%@",self.restorationIdentifier);

    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
  

    
    
    
 
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
    [self.spinner1 stopAnimating];
    [self.spinner2 stopAnimating];
    [self.spinner3 stopAnimating];
    [self.spinner4 stopAnimating];
    [self.spinner5 stopAnimating];
    
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
