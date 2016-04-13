//
//  NoticiaViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/4/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "NoticiaViewController.h"

@interface NoticiaViewController ()
    @property (strong, nonatomic) NSURLSession *session;
    @property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;

@end

@implementation NoticiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1];/*#ffdb7b*/
    label.text = @"NOTICIAS";
    self.navigationItem.titleView = label;
    [label sizeToFit];
    
    [self.tituloLabel setText: [self.titulo uppercaseString]];
    [self.fechaLabel setText:self.fecha];
    [self.bodyText setHidden:YES];
    [self.bodyText setText:self.noticiaBody];
    NSString *imageUrlString = self.imageUrl;
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
                
                [self.mainImage setImage:[UIImage imageWithData:data]];
                
            });
        }
        else{
            //[message show];
        }
        
        
    }];
    
    
    [task resume];
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
