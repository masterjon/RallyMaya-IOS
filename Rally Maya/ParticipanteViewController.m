//
//  ParticipanteViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/23/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "ParticipanteViewController.h"
//#import "MBProgressHUD.h"
#import "Utils.h"
@interface ParticipanteViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation ParticipanteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.titleView = [Utils getNavLabel:@"PARTICIPANTES"];
 
    
//    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                      message:NSLocalizedString(@"Necesitas activar tu conexión a internet.",nil)
//                                                     delegate:self
//                                            cancelButtonTitle:@"OK"
//                                            otherButtonTitles:nil];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//
    [self.spinner setHidesWhenStopped:TRUE];
    [self.spinner startAnimating];
    

    
    [self.nameLbl setText:[self.name uppercaseString]];
    [self.brandLbl setText:self.brand];
    [self.modelLbl setText:self.model];
    [self.countryLbl setText:self.country];
    if (![self.year isKindOfClass:[NSNull class]]){
        [self.yearLbl setText:self.year.stringValue];
    }
    
    if (![self.position isKindOfClass:[NSNull class]]){
        [self.positionLbl setText:self.position.stringValue];
    }
    
    NSString *imageUrlString = self.imagenUrl;
    if (imageUrlString != (id)[NSNull null]){
        NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
        NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];

        self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
        self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
        NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
            if(urlResponse.statusCode==200){
                dispatch_async(dispatch_get_main_queue(), ^{
                    //NSLog(@"image width: %f",image.size.width);
                    //NSLog(@"image height: %f",image.size.height);
                    
                    [_imageView setImage:[UIImage imageWithData:data]];
                    [self.spinner stopAnimating];
                    //[MBProgressHUD hideHUDForView:self.view animated:YES];
                    
                });
            }
            else{
                [self.spinner stopAnimating];
                [self.alertLabel setHidden:FALSE];
                //[message show];
            }
            
            
        }];
        [task resume];
    }
    //_imageView.image = [UIImage imageNamed:self.imagenUrl];
    
    // Do any additional setup after loading the view.
}
//- (void)alertView:(UIAlertView *)alertView
//clickedButtonAtIndex:(NSInteger)buttonIndex{
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}
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
