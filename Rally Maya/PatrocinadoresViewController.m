//
//  PatrocinadoresViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/24/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "PatrocinadoresViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "Utils.h"
//#import "MBProgressHUD.h"

@interface PatrocinadoresViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation PatrocinadoresViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //NavigatrionDrawer
    self.navigationItem.titleView = [Utils getNavLabel:@"PATROCINADORES"];

    
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    
    
    self.menuItems = [[NSMutableArray alloc] init];
    
//    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                      message:NSLocalizedString(@"Necesitas activar tu conexión a internet.",nil)
//                                                     delegate:self
//                                            cancelButtonTitle:@"OK"
//                                            otherButtonTitles:nil];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.spinner setHidesWhenStopped:TRUE];
    [self.spinner startAnimating];
    
    NSURL *url = [NSURL URLWithString:@"http://rallymaya.punklabs.ninja/api/elrally/patrocinadores"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    NSURLSessionDataTask * task = [self.session dataTaskWithRequest:request  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if(urlResponse.statusCode==200){
            NSLog(@"It Came to 200 status");
            
            //este metodo llena el arreglo con los datos obtenidos de nuestro request
            [self handleResults:data];
        }
        else{
            [self.spinner stopAnimating];
            [self.alertLabel setHidden:FALSE];
//            [message show];
        }
    }];
    [task resume];

  
    

    // Do any additional setup after loading the view.
}
- (void)setupLeftMenuButton {
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton];
}

- (void)leftDrawerButtonPress:(id)leftDrawerButtonPress {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
//- (void)alertView:(UIAlertView *)alertView
//clickedButtonAtIndex:(NSInteger)buttonIndex{
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}
- (void) handleResults:(NSData *)data{
    
    //la respuesta viene serializada en json por lo tanto lo tenemos que deserializar
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        for (NSDictionary *dataDictionary in response[@"results"]){
            
            [self.menuItems addObject:dataDictionary];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.spinner stopAnimating];
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            [self.menuCollectionView reloadData];
        });
    }
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.menuItems count];
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"menuCell" forIndexPath:indexPath];
    
    UIImageView *menuImage = (UIImageView *) [cell viewWithTag:10];
    if([self.menuItems count] >0){
        NSDictionary *cellDictionary = [self.menuItems objectAtIndex:indexPath.row];
        NSString *imageItem =[cellDictionary objectForKey:@"picture"];
        NSURL *imageUrl = [NSURL URLWithString:imageItem];
        NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
        menuImage.image = [UIImage imageNamed:imageItem];
        
        NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
            if(urlResponse.statusCode==200){
                dispatch_async(dispatch_get_main_queue(), ^{
                    UICollectionViewCell *updateCell = (id)[collectionView cellForItemAtIndexPath:indexPath];
                    if (updateCell){
                         menuImage.image=[UIImage imageWithData:data];
                    }
                   
                    
                });
            }
            else{
                //NSLog(@"Error fetching remote data");
            }
            
            
        }];
        [task resume];
    }
    return cell;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *menuItemDictionary = [self.menuItems objectAtIndex:indexPath.row];

    NSLog(@"%@",menuItemDictionary[@"link"]);
    if ([menuItemDictionary[@"link"] length] != 0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:menuItemDictionary[@"link"]]];
    }
    
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    int top = 10;
    int left = 10;
    int bottom = 10;
    int right = 10;
    NSLog(@"%i",(int)screenBounds.size.width);
    switch ((int) screenBounds.size.width) {
        case 320:
            NSLog(@"--5--");
            left = 25;
            right = 25;
            break;
        case 768:
            NSLog(@"--Ipad Portrait");
            left = 50;
            right = 50;
            top = 50;
            break;
        case 1024:
            NSLog(@"--Ipad Landscape");
            left = 50;
            right = 50;
            top = 50;
            break;
        default:
            break;
            
    }
    return UIEdgeInsetsMake(top, left, bottom, right);
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
