//
//  SocialHubViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/28/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "SocialHubViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "Utils.h"
@interface SocialHubViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation SocialHubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [Utils getNavLabel:@"REDES SOCIALES"];
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    [self.spinner setHidesWhenStopped:TRUE];
    [self.spinner startAnimating];
    
    NSString *fullURL = @"http://rallymaya.punklabs.ninja/socialhub";
    NSURL *url = [NSURL URLWithString:fullURL];
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

    
    [_webView loadRequest:request];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
    
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
-(IBAction) openFacebook{
    NSString *fbLink = @"fb://profile/132058193656387";
        if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:fbLink]]) {
            fbLink = @"https://www.facebook.com/RallyMayaMexico";
        }
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:fbLink]];

}
-(IBAction) openTwitter{
        NSString *twLink = @"twitter://user?screen_name=rallymayamexico";
        if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:twLink]]) {
            twLink = @"https://twitter.com/rallymayamexico";
        }
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:twLink]];
}

-(IBAction) openInstagram{
    
    NSString *instagramURL = @"instagram://user?username=rallymayamexico";
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:instagramURL]]) {
        instagramURL = @"https://www.instagram.com/rallymayamexico/";
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:instagramURL]];
    
}
-(IBAction) openPeriscope{
    NSString *periscopeLink = @"pscp://user/RallyMAyaMexico";
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:periscopeLink]]) {
        periscopeLink = @"https://www.periscope.tv/RallyMayaMexico";
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:periscopeLink]];
}
-(IBAction) openYoutube{
    NSString *ytLink = @"youtube://user/RallyMayaMexico";
    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:ytLink]]) {
        ytLink = @"https://www.youtube.com/user/RallyMayaMexico";
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:ytLink]];
}

@end
