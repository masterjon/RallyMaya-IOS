//
//  BoletinDetalleViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/11/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "BoletinDetalleViewController.h"

@interface BoletinDetalleViewController ()

@end

@implementation BoletinDetalleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tituloLabel setText: [self.titulo uppercaseString]];
    [self.fechaLabel setText:self.fecha];
    [self.bodyText setHidden:YES];
    [self.bodyText setText:self.noticiaBody];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [self.bodyText scrollRectToVisible:CGRectMake(0,0,1, 1) animated:NO];
    [self.bodyText setHidden:NO];
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
