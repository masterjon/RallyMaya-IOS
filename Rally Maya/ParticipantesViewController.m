//
//  ParticipantesViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/23/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "ParticipantesViewController.h"
#import "ParticipanteViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "MBProgressHUD.h"

@interface ParticipantesViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation ParticipantesViewController
//-(BOOL)prefersStatusBarHidden{
//    return YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NavigatrionDrawer
    self.navigationItem.title = @"PARTICIPANTES";
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    
    self.menuItems = [[NSMutableArray alloc] init];
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                      message:NSLocalizedString(@"Necesitas activar tu conexión a internet.",nil)
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSURL *url = [NSURL URLWithString:@"http://punklabs.ninja/rallymaya/api/v1/cars/"];
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
            [message show];
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
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void) handleResults:(NSData *)data{
    
    //la respuesta viene serializada en json por lo tanto lo tenemos que deserializar
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        for (NSDictionary *dataDictionary in response[@"objects"]){
            
            [self.menuItems addObject:dataDictionary];
        }
        NSLog(@"%lu************",(unsigned long)[self.menuItems count]);
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
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
    menuImage.image = [UIImage imageNamed:@"fondofotos"];
    if([self.menuItems count] >0){
        NSDictionary *cellDictionary = [self.menuItems objectAtIndex:indexPath.row];
        NSString *imageItem =[cellDictionary objectForKey:@"thumbnail"];
        NSURL *imageUrl = [NSURL URLWithString:imageItem];
        NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
        
        
        //menuImage.image = [UIImage imageNamed:imageItem];
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

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    int top = 10;
    int left = 0;
    int bottom = 10;
    int right = 0;
    NSLog(@"%i",(int)screenBounds.size.width);
    switch ((int) screenBounds.size.width) {
        case 320:
            NSLog(@"--5--");
            left = 5;
            right = 5;
            break;
        case 375:
            NSLog(@"--6--");
            left = 20;
            right = 20;
            break;
        case 414:
            NSLog(@"--6+--");
            left = 30;
            right = 30;
            break;
        case 768:
            NSLog(@"--Ipad Portrait");
            left = 60;
            right = 60;
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
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    // Adjust cell size for orientation
    int screenSize = (int) screenBounds.size.width;
    //Size of cells for ipad
    if(screenSize == 768 || screenSize == 1024){
        return CGSizeMake(282.f, 282.f);
    }
    
    //Size of cells for iphones
    return CGSizeMake(150.f,150.f);
    
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
