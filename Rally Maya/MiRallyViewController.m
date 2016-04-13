//
//  MiRallyViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/8/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "MiRallyViewController.h"
#import "Utils.h"

@interface MiRallyViewController ()
    @property (strong, nonatomic) NSURLSession *session;
    @property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation MiRallyViewController

- (void)viewDidLoad {
    
    self.navigationItem.titleView = [Utils getNavLabel:@"MI CUENTA"];
    self.hotelItems = [[NSMutableArray alloc] init];
    
    UIEdgeInsets adjustForTabbarInsets = UIEdgeInsetsMake(0, 0, CGRectGetHeight(self.tabBarController.tabBar.frame), 0);
    self.tableV.contentInset = adjustForTabbarInsets;
    self.tableV.scrollIndicatorInsets = adjustForTabbarInsets;
    
    NSURL *url = [NSURL URLWithString:@"http://rallymaya.punklabs.ninja/api/auth/rest-auth/user/"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setValue:[Utils getAuthString] forHTTPHeaderField:@"Authorization"];
    
    self.sessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
    self.session=[NSURLSession sessionWithConfiguration:self.sessionConfiguration];
    
    NSURLSessionDataTask * task = [self.session dataTaskWithRequest:request  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        NSLog(@"%li",(long)urlResponse.statusCode);
        if(urlResponse.statusCode==200){
            NSLog(@"It Came to 200 status");
            [self handleResults:data];
        }
        else{
            //                    [self.spinner stopAnimating];
            //                    [self.alertLabel setHidden:FALSE];
        }
    }];
    
    [task resume];
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (void) handleResults:(NSData *)data{
    
    //la respuesta viene serializada en json por lo tanto lo tenemos que deserializar
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
       NSLog(@"%@",response[@"user_profile"][@"hotels"]);
        
        for (NSDictionary *dataDictionary in response[@"user_profile"][@"hotels"]){
            [self.hotelItems addObject:dataDictionary];
        }
        self.piloto = response[@"user_profile"][@"driver"];
        self.copiloto = response[@"user_profile"][@"codriver"];
        self.pais = response[@"user_profile"][@"country"];
        self.ciudad = response[@"user_profile"][@"state_city"];
        self.vehiculo = response[@"user_profile"][@"car"][@"name"];
        self.marca = response[@"user_profile"][@"car"][@"brand"];
        self.modelo = response[@"user_profile"][@"car"][@"model"];
        self.anio = response[@"user_profile"][@"car"][@"year"];
        self.img = response[@"user_profile"][@"car"][@"picture"];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //            [MBProgressHUD hideHUDForView:self.view animated:YES];
            //
            [self.tableView reloadData];
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

#define NUMBER_OF_STATIC_CELLS  12

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu",(unsigned long)[self.hotelItems count]);
    return NUMBER_OF_STATIC_CELLS+[self.hotelItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"";
    if (indexPath.row < NUMBER_OF_STATIC_CELLS) {
        // dequeue and configure my static cell for indexPath.row
        cellIdentifier = [NSString stringWithFormat:@"staticCell%li",(long)indexPath.row];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];// id for one of my static cells
        UILabel *itemPiloto = (UILabel *)[cell viewWithTag:8];
        UILabel *itemCopiloto = (UILabel *)[cell viewWithTag:9];
        UILabel *itemPais = (UILabel *)[cell viewWithTag:10];
        UILabel *itemCiudad = (UILabel *)[cell viewWithTag:11];
        UILabel *itemVehiculo = (UILabel *)[cell viewWithTag:12];
        UILabel *itemMarca = (UILabel *)[cell viewWithTag:13];
        UILabel *itemModelo = (UILabel *)[cell viewWithTag:14];
        UILabel *itemAnio = (UILabel *)[cell viewWithTag:15];
        UIImageView *bgImage = (UIImageView *)[cell viewWithTag:16];
        [itemPiloto setText:self.piloto];
        [itemCopiloto setText:self.copiloto];
        [itemPais setText:self.pais];
        [itemCiudad setText:self.ciudad];
        [itemVehiculo setText:self.vehiculo];
        [itemMarca setText:self.marca];
        [itemModelo setText:self.modelo];
        [itemAnio setText:self.anio.stringValue];
        
        NSString *imageItem = self.img;
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
        

        return cell;
    } else {
        // normal dynamic logic here
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dynamicCell" forIndexPath:indexPath];
        
        UILabel *itemSede = (UILabel *)[cell viewWithTag:1];
        UILabel *itemName = (UILabel *)[cell viewWithTag:2];
        UILabel *itemAddress = (UILabel *)[cell viewWithTag:3];
        UILabel *itemCheckin = (UILabel *)[cell viewWithTag:4];
        UILabel *itemCheckout = (UILabel *)[cell viewWithTag:5];
        UILabel *itemAssesor = (UILabel *)[cell viewWithTag:6];
        UILabel *itemPhone = (UILabel *)[cell viewWithTag:7];
        
        
        NSDictionary *mydict;
        mydict=[self.hotelItems objectAtIndex:indexPath.row-NUMBER_OF_STATIC_CELLS];
        [itemSede setText:mydict[@"sede"][@"name"]];
        [itemName setText:mydict[@"name"]];
        [itemAddress setText:mydict[@"address"]];
        [itemCheckin setText:mydict[@"checkin"]];
        [itemCheckout setText:mydict[@"checkout"]];
        [itemAssesor setText:mydict[@"assessor"]];
        [itemPhone setText:mydict[@"phone"]];
        
        return cell;
        // dequeue and configure for [self.myDynamicModel objectAtIndex:indexPath.row]
    }
    return nil;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        return 260;
    }
    else if(indexPath.row<NUMBER_OF_STATIC_CELLS){
        return 30;
    }
    else{
        return 210;
    }
    return 0;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
