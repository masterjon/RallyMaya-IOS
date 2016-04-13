//
//  DirectorioViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/2/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "DirectorioViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "DirectorioCatViewController.h"

@interface DirectorioViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;

@end

@implementation DirectorioViewController

- (void)viewDidLoad {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1];/*#ffdb7b*/
    label.text = @"DIRECTORIO";
    self.navigationItem.titleView = label;
    [label sizeToFit];
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    
    self.collectionItems = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://rallymaya.punklabs.ninja/api/elrally/directorio/"];
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
        NSLog(@"%@",response[@"results"][0][@"id"]);
    
        int count = [[response objectForKey:@"count"] intValue];
        for (int i=0; i<count; i++) {
            NSLog(@"%i",i);
            if ([response[@"results"] count]>i) {
                NSDictionary *day1Title = @{@"name":response[@"results"][i][@"name"],@"cityId":response[@"results"][i][@"id"]};
                
                NSMutableArray *cool =[[NSMutableArray alloc] init];
                [cool addObject:day1Title];
                
                for (NSDictionary *item in response[@"results"][i][@"ciudades"]) {
                    [cool addObject:item];
                }
                
                self.collectionItems[i]=cool;
            }
            
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.spinner stopAnimating];
            [self.itemsTable reloadData];
            
        });
    }
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.collectionItems count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    long count = [self.collectionItems count];
    for (int i=0; i<count; i++) {
        if (section==i) {
            return [self.collectionItems[i] count];
        }
    }
    
    //    else if(section==2){
    //        return [self.collectionItemsDay3 count];
    //    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    UILabel *itemTitle = (UILabel *)[cell viewWithTag:1];
    UIImageView *arrow = (UIImageView *)[cell viewWithTag:2];
    
    NSDictionary *mydict;
    long count = [self.collectionItems count];
    for (int i=0; i<count; i++) {
        if (indexPath.section==i) {
            mydict=[self.collectionItems[i] objectAtIndex:indexPath.row];
        }
    }
    
    if (indexPath.row==0){
        [cell setBackgroundColor:[UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1]];
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 10000, 0, 0)];
        [itemTitle setTextColor:[UIColor blackColor]];
        [itemTitle setFont: [UIFont fontWithName:@"TrebuchetMS-Bold" size:14]];
        cell.userInteractionEnabled = NO;
        [arrow setHidden:TRUE];
        

        
        
    }
    else{
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        [itemTitle setTextColor:[UIColor colorWithRed:0.545 green:0.545 blue:0.545 alpha:1]];
        [itemTitle setFont: [UIFont fontWithName:@"TrebuchetMS" size:12]];
        
        
    }
    if(mydict[@"name"]){
        [itemTitle setText:[NSString stringWithString:mydict[@"name"]]];
    }
    else{
        [itemTitle setText:@""];
    }
    
    return cell;
    
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DirectorioCatViewController *View = [[DirectorioCatViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.itemsTable  indexPathsForSelectedRows];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *mydict;
    NSDictionary *mydict2;
    long count = [self.collectionItems count];
    for (int i=0; i<count; i++) {
        if (path.section==i) {
            mydict=[self.collectionItems[i] objectAtIndex:path.row];
            mydict2=[self.collectionItems[i] objectAtIndex:0];
            
        }
    }
    View.cityId = mydict2[@"cityId"];
    View.titulo = mydict[@"name"];
    
}


@end
