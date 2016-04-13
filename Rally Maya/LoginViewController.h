//
//  LoginViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 4/7/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnLogin:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
