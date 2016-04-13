//
//  PGViewController.m
// SideDrawerExample
//
//  Created by Pulkit Goyal on 11/12/13.
//  Copyright (c) 2013 Pulkit Goyal. All rights reserved.
//

#import "PGViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import <float.h>

@interface PGViewController ()

@end

@implementation PGViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self performSegueWithIdentifier:@"DRAWER_SEGUE" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DRAWER_SEGUE"]) {
        MMDrawerController *destinationViewController = (MMDrawerController *) segue.destinationViewController;

        // Instantitate and set the center view controller.
        UIViewController *centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InicioViewNavigation"];
        destinationViewController.maximumLeftDrawerWidth = 154;
        [destinationViewController setCenterViewController:centerViewController];

        // Instantiate and set the left drawer controller.
        UIViewController *leftDrawerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SIDE_DRAWER_CONTROLLER"];
        [destinationViewController setLeftDrawerViewController:leftDrawerViewController];
        [destinationViewController setDrawerVisualStateBlock:[MMDrawerVisualState slideAndScaleVisualStateBlock]];
        

    }
}
@end
