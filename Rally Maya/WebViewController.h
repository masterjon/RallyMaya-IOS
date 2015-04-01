//
//  WebViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 3/31/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *WebView;
@property (nonatomic,strong) NSString* url;
@property (nonatomic,strong) NSString* viewTitle;
@end
