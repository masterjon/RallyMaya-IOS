//
//  NoticiasViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/4/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "NoticiasViewController.h"
#import "NoticiaViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "Utils.h"
@interface NoticiasViewController ()
    @property (strong, nonatomic) NSURLSession *session;
    @property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation NoticiasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [Utils getNavLabel:@"NOTICIAS"];

    NSArray *viewControllers = self.navigationController.viewControllers;
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    
    NSURL *url = [NSURL URLWithString:@"http://rallymaya.punklabs.ninja/api/elrally/noticias"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    
    [self.spinner setHidesWhenStopped:TRUE];
    [self.spinner startAnimating];

    
    self.collectionItems = [[NSMutableArray alloc] init];
    
    NSURLSessionDataTask * task = [self.session dataTaskWithRequest:request  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        // NSLog(@"%i",urlResponse.statusCode);
        if(urlResponse.statusCode==200){
            NSLog(@"It Came to 200 status");
            [self handleResults:data];
        }
        else{
            [self.spinner stopAnimating];
            [self.alertLabel setHidden:FALSE];
        }
    }];
    
    
    NSURL *urlFeatured = [NSURL URLWithString:@"http://rallymaya.punklabs.ninja/api/elrally/noticias_featured"];
    NSURLRequest *requestFeatured = [NSURLRequest requestWithURL:urlFeatured];
    
    NSURLSessionDataTask * task2 = [self.session dataTaskWithRequest:requestFeatured  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if(urlResponse.statusCode==200){
            NSLog(@"It Came to 200 status");
            
            //este metodo llena el arreglo con los datos obtenidos de nuestro request
            [self handleResultsFeatured:data];
        }
    }];
    
    
    [task resume];
    [task2 resume];
    
    // Do any additional setup after loading the view.
}
- (void) handleResultsFeatured:(NSData *)data{
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        NSLog(@"%@",response[@"count"]);
        if(response[@"count"]>0){
            self.fTitle = response[@"results"][0][@"title"];
            self.fText = response[@"results"][0][@"short_description"];
            self.fImgDes = response[@"results"][0][@"picture_featured"];
            self.fImg = response[@"results"][0][@"picture"];
            self.fFullText = response[@"results"][0][@"description"];
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            
            self.fDate = response[@"results"][0][@"date"];
            NSDate *yourDate = [dateFormatter dateFromString:@"2012-11-22 10:19:04"];
            dateFormatter.dateFormat = @"dd-MMM-yyyy";
            NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
        }

        if (self.fImgDes != (id)[NSNull null]){

            NSURL *imageUrl = [NSURL URLWithString:self.fImgDes];
            NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
            self.featuredImage.image = [UIImage imageNamed:@"placeholder"];
            NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
                if(urlResponse.statusCode==200){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.featuredImage.image=[UIImage imageWithData:data];
                        [self.featuredText setText:self.fText];
                    });
                }
                else{
                    //NSLog(@"Error fetching remote data");
                }
                
                
            }];
            [task resume];
        }

    }

}
- (void) handleResults:(NSData *)data{
    //la respuesta viene serializada en json por lo tanto lo tenemos que deserializar
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        // ahora si agregamos los items al arreglo
        for (NSDictionary *dataDictionary in response[@"results"]){
            
            [self.collectionItems addObject:dataDictionary];
        }

        //lo que consume tiempo lo manejamos en un hilo diferente de manera asincrona
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.spinner stopAnimating];
            [self.itemsTable reloadData];
            
        });
    }
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.collectionItems count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    static NSString *simpleTableIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    UIImageView *bgImage;
    bgImage = (UIImageView *)[cell viewWithTag:1];
    UILabel *titulo = (UILabel *)[cell viewWithTag:2];
    UILabel *description = (UILabel *)[cell viewWithTag:3];
    
    if ([self.collectionItems count] >0 ){
        NSDictionary *mydict;
        mydict=[self.collectionItems objectAtIndex:indexPath.row];
        [titulo setText:[mydict[@"title"] uppercaseString]];
        [description setText:mydict[@"description"]];
        NSString *imageItem =[mydict objectForKey:@"thumbnail"];
        NSURL *imageUrl = [NSURL URLWithString:imageItem];
        NSURLRequest *imageUrlRequest = [NSURLRequest requestWithURL:imageUrl];
        bgImage.image = [UIImage imageNamed:@"placeholder"];
        NSURLSessionDataTask *task = [self.session dataTaskWithRequest:imageUrlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
            if(urlResponse.statusCode==200){
                dispatch_async(dispatch_get_main_queue(), ^{
                    UITableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath:indexPath];
                    if (updateCell){
                        bgImage.image=[UIImage imageWithData:data];
                    }
                });
            }
            else{
                //NSLog(@"Error fetching remote data");
            }
            
            
        }];
        [task resume];
        
        
    }
    
    
    
    
    
    
    
    //[label.layer setCornerRadius:10];
    //label.clipsToBounds=YES;
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NoticiaViewController *View = [[NoticiaViewController alloc] init];
    NSString * segueIdentifier = [segue identifier];
    View = [segue destinationViewController];
    
    if([segueIdentifier isEqualToString:@"noticias"]){
    
        NSArray *arrayOfIndexPaths = [self.itemsTable  indexPathsForSelectedRows];
        NSIndexPath *path = [arrayOfIndexPaths firstObject];
        NSDictionary *itemdictionary = [self.collectionItems objectAtIndex:path.row];
        View.imageUrl = itemdictionary[@"picture"];
        View.titulo = itemdictionary[@"title"];
        View.fecha = self.fDate;
        View.noticiaBody = itemdictionary[@"description"];
        
    }
    else if ([segueIdentifier isEqualToString:@"noticia_destacada"]){
    
        View.imageUrl = self.fImg;
        View.noticiaBody = self.fFullText;
        View.fecha = self.fDate;
        View.titulo = self.fTitle;
    }
    
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    
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
-(void)viewWillAppear:(BOOL)animated{
    [self.mm_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeBezelPanningCenterView];
    [self.mm_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
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
