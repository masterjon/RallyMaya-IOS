//
//  ResultadosViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/12/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "ResultadosViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "Utils.h"

@interface ResultadosViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation ResultadosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [Utils getNavLabel:@"RESULTADOS"];
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    [self.spinner setHidesWhenStopped:TRUE];
    [self.spinner startAnimating];
    NSURL *url = [NSURL URLWithString:@"http://www.harcon.ie/"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    
    NSURLSessionDataTask * task = [self.session dataTaskWithRequest:request  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        
        if(urlResponse.statusCode==200){
            NSLog(@"It Came to 200 status");
            
            
        }else{
            [self.alertLabel setHidden:NO];
        }
    }];
    [task resume];
    
    [self.webView loadRequest:request ];
    // Do any additional setup after loading the view.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
        
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
