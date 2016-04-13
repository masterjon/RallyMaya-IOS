//
//  BoletinTableViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 4/11/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "BoletinViewController.h"
#import "BoletinDetalleViewController.h"
#import "Utils.h"

@interface BoletinViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation BoletinViewController

- (void)viewDidLoad {
    self.navigationItem.titleView = [Utils getNavLabel:@"BOLETÍN"];
    self.collectionItems = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://rallymaya.punklabs.ninja/api/elrally/boletin/"];
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
    [super viewDidLoad];


   
}
- (void) handleResults:(NSData *)data{
    //la respuesta viene serializada en json por lo tanto lo tenemos que deserializar
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
       // NSLog(@"%@",response);
        for (NSDictionary *dataDictionary in response[@"results"]){
            
            [self.collectionItems addObject:dataDictionary];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
             [self.itemsTable reloadData];
            [self.spinner stopAnimating];
            [self.itemsTable reloadData];
            
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows

    return [self.collectionItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *simpleTableIdentifier = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    UILabel *itemTitle = (UILabel *)[cell viewWithTag:1];
    
    NSDictionary *mydict;
    mydict=[self.collectionItems objectAtIndex:indexPath.row];
    
    
    [itemTitle setText:[NSString stringWithString:mydict[@"title"]]];
    NSLog(@"%@",itemTitle.text);
    
    return cell;
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BoletinDetalleViewController *View = [[BoletinDetalleViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.itemsTable  indexPathsForSelectedRows];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *mydict;
   
    mydict=[self.collectionItems objectAtIndex:path.row];
    
    View.titulo = mydict[@"title"];
    View.fecha = mydict[@"date"];
    View.noticiaBody = mydict[@"description"];
}


@end
