//
//  ParticipanteViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/23/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "ParticipanteViewController.h"
#import "MBProgressHUD.h"
@interface ParticipanteViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation ParticipanteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    if (self.year == (id)[NSNull null]){
            viewTitle.text=[NSString stringWithFormat:@"%@",self.name] ;
    }
    else{
        viewTitle.text=[NSString stringWithFormat:@"%@-%@",self.name,self.year] ;
    }
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                      message:NSLocalizedString(@"Necesitas activar tu conexión a internet.",nil)
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSString *imageUrlString = self.imagenUrl;
    NSURL *imageUrl = [NSURL URLWithString:imageUrlString];
    NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
    NSLog(@"%@",self.name);
    NSLog(@"%@",self.year);
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if(urlResponse.statusCode==200){
            dispatch_async(dispatch_get_main_queue(), ^{
                //NSLog(@"image width: %f",image.size.width);
                //NSLog(@"image height: %f",image.size.height);
                
                [_imageView setImage:[UIImage imageWithData:data]];
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
            });
        }
        else{
            //[message show];
        }
        
        
    }];
    [task resume];
    //_imageView.image = [UIImage imageNamed:self.imagenUrl];
    
    // Do any additional setup after loading the view.
}
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
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
