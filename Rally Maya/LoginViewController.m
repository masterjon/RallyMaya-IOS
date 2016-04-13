//
//  LoginViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/7/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "LoginViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "SocialHubViewController.h"
#import "MBProgressHUD.h"
#import "Utils.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {

    
    
    self.navigationItem.titleView = [Utils getNavLabel:@"LOGIN"];
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)dismissKeyboard {
    [self.txtUsername resignFirstResponder];
    [self.txtPassword resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnLogin:(id)sender {
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Por favor, intenta de nuevo"
                                                      message:NSLocalizedString(@"Este nombre de usuario y contraseña no coinciden",nil)
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    UIAlertView *message2 = [[UIAlertView alloc] initWithTitle:@"Error"
                                                       message:NSLocalizedString(@"Debes de ingresar usuario y contraseña",nil)
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    
    UIAlertView *message3 = [[UIAlertView alloc] initWithTitle:@"Error"
                                                       message:NSLocalizedString(@"Hubo un error en la conexión intenta de nuevo",nil)
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    
    if (self.txtUsername.text.length>0 && self.txtPassword.text.length>0 ){
        
      [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//     NSString *authStr = [NSString stringWithFormat:@"%@:%@",username,password];
        
   
        NSDictionary *post = @{@"username":[self.txtUsername text],@"password":[self.txtPassword text]};
        
        
        NSURL *url=[NSURL URLWithString:@"http://rallymaya.punklabs.ninja/api/auth/rest-auth/login/"];
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:post options:0 error:nil];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        NSLog(@"JSS: %@",postData);
        //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
        
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSLog(@"Response code: %ld", (long)[response statusCode]);
        
        if ([response statusCode] >= 200 && [response statusCode] < 300)
        {
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            NSLog(@"Response ==> %@", responseData);
            
            NSError *error = nil;
            NSDictionary *jsonData = [NSJSONSerialization
                                      JSONObjectWithData:urlData
                                      options:NSJSONReadingMutableContainers
                                      error:&error];
            
            
            
            NSString *key = jsonData[@"key"];
            NSLog(@"%@",key);
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:[NSString stringWithString:key] forKey:@"token"];
            [defaults synchronize];
            
            
            UINavigationController *centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PerfilViewNavigation"];
            [self.mm_drawerController setCenterViewController:centerViewController withCloseAnimation:YES completion:nil];
           
                       
//
        } else if([response statusCode]>300){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [message show];
            
        }
        else{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [message3 show];
        }
        
        
        
    }
    else{
        [message2 show];
    }
}


- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}


-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)setupLeftMenuButton {
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton];
}

- (void)leftDrawerButtonPress:(id)leftDrawerButtonPress {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
