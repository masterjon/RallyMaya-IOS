//
//  ResultadosViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 4/12/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultadosViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
