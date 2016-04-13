//
//  DirectorioCatViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/10/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "DirectorioCatViewController.h"
#import "DirectorioItemViewController.h"
#import "Utils.h"

@interface DirectorioCatViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation DirectorioCatViewController
{
    BOOL color;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [Utils getNavLabel:@"DIRECTORIO"];
    color = NO;
    
    [self.lblTitle setText:[NSString stringWithFormat:@"DIRECTORIO %@",[self.titulo uppercaseString]]];
    
    
    self.collectionItems = [[NSMutableArray alloc] init];
    self.sYellow = [UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1];
    self.lYellow = [UIColor colorWithRed:0.976 green:0.961 blue:0.718 alpha:1];
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/",@"http://rallymaya.punklabs.ninja/api/elrally/directorio",self.cityId];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    
    [self.spinner setHidesWhenStopped:TRUE];
    [self.spinner startAnimating];
    
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
    [task resume];
    
    // Do any additional setup after loading the view.
}

- (void) handleResults:(NSData *)data{
    //la respuesta viene serializada en json por lo tanto lo tenemos que deserializar
    NSError *jsonError;
    NSArray *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        // ahora si agregamos los items al arreglo
        for (NSDictionary *dataDictionary in response){
            
            [self.collectionItems addObject:dataDictionary];
        }
        
        //lo que consume tiempo lo manejamos en un hilo diferente de manera asincrona
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            [self.spinner stopAnimating];
//            [self.itemsTable reloadData];
            
        });
    }
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.collectionItems count];
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    
    if (color==NO) {
        [cell setBackgroundColor:self.sYellow];
    }
    else{
        [cell setBackgroundColor:self.lYellow];
    }
    
    if (indexPath.row % 2 ==0){
        color=!color;
    }

    UIImageView *menuImage = (UIImageView *) [cell viewWithTag:1];
    UILabel *lblItem = (UILabel *) [cell viewWithTag:2];
    if([self.collectionItems count] >0){
        NSDictionary *cellDictionary = [self.collectionItems objectAtIndex:indexPath.row];
        [lblItem setText:[cellDictionary objectForKey:@"name"]];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DirectorioItemViewController *View = [[DirectorioItemViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.collectionView  indexPathsForSelectedItems];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *itemdictionary = [self.collectionItems objectAtIndex:path.row];
    View.titulo = itemdictionary[@"name"];
    View.itemId = itemdictionary[@"id"];
    View.cityId = self.cityId;
    View.cityName = self.titulo;
}


@end
