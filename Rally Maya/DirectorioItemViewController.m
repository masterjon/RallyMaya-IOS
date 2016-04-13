//
//  DirectorioItemViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/10/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "DirectorioItemViewController.h"
#import "Utils.h"

@interface DirectorioItemViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation DirectorioItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [Utils getNavLabel:@"DIRECTORIO"];
    [self.lblTitle setText:[NSString stringWithFormat:@"%@ - %@",[self.titulo uppercaseString],[self.cityName   uppercaseString]]];
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@/",@"http://rallymaya.punklabs.ninja/api/elrally/directorio",self.cityId,self.itemId];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
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
            [self.tableView reloadData];
                        [self.spinner stopAnimating];
//                        [self.itemsTable reloadData];
            
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    UILabel *itemTitle = (UILabel *)[cell viewWithTag:1];
    UILabel *itemText = (UILabel *)[cell viewWithTag:2];

    NSDictionary *mydict;
    mydict=[self.collectionItems objectAtIndex:indexPath.row];


    [itemTitle setText:[NSString stringWithString:mydict[@"name"]]];
    [itemText setText:[NSString stringWithString:mydict[@"address"]]];
    NSLog(@"%@",itemTitle.text);

    return cell;
    
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
