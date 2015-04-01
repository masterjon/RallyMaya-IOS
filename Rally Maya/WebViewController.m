//
//  WebViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/31/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "WebViewController.h"
#import "MBProgressHUD.h"
@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:self.viewTitle];
    NSString *fullURL = self.url;
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_WebView loadRequest:requestObj];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    // Do any additional setup after loading the view.
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUrl:(NSString *)url
{
    _url=url;
}
-(void)setTitle:(NSString *)title{
    _viewTitle =title;
    UILabel *viewTitle = [[UILabel alloc] init];
    viewTitle.textColor = [UIColor whiteColor];
    viewTitle.text=title;
    self.navigationItem.titleView=viewTitle;
    [viewTitle sizeToFit];
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
