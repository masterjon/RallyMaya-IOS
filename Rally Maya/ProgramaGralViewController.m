//
//  ProgramaGralViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/31/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "ProgramaGralViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "Utils.h"
@interface ProgramaGralViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong,nonatomic) NSURLSessionConfiguration *sessionConfiguration;
@end

@implementation ProgramaGralViewController

- (void)viewDidLoad {
 
    self.navigationItem.titleView = [Utils getNavLabel:@"PROGRAMA GENERAL"];
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    self.collectionItemsDay1 = [[NSMutableArray alloc] init];
    self.collectionItemsDay2 = [[NSMutableArray alloc] init];
    self.collectionItemsDay3 = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:@"http://rallymaya.punklabs.ninja/api/elrally/programa/"];
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
    // Do any additional setup after loading the view.
}

- (void) handleResults:(NSData *)data{
    //la respuesta viene serializada en json por lo tanto lo tenemos que deserializar
    NSError *jsonError;
    NSDictionary *response= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (response){
        NSString *iniciaTitle=@"Inicia";
        NSString *finalizaTitle=@"Finaliza";
        NSLog(@"%@",response[@"results"][0][@"id"]);
        // ahora si agregamos los items al arreglo
//        if ([response[@"results"] count]>0) {
//            NSDictionary *day1Title = @{@"name":response[@"results"][0][@"title"],@"time_start":iniciaTitle,@"time_end":finalizaTitle};
//            [self.collectionItemsDay1 addObject:day1Title];
//            for (NSDictionary *item in response[@"results"][0][@"eventos"]) {
//                [self.collectionItemsDay1 addObject:item];
//            }
//        }
//        
//        if ([response[@"results"] count]>1) {
//            
//            NSDictionary *day2Title = @{@"name":response[@"results"][1][@"title"],@"time_start":iniciaTitle,@"time_end":finalizaTitle};
//            [self.collectionItemsDay2 addObject:day2Title];
//            for (NSDictionary *item in response[@"results"][1][@"eventos"]) {
//                [self.collectionItemsDay2 addObject:item];
//            }
//        }
        int count = [[response objectForKey:@"count"] intValue];
        for (int i=0; i<count; i++) {
            NSLog(@"%i",i);
            if ([response[@"results"] count]>i) {
                NSDictionary *day1Title = @{@"name":response[@"results"][i][@"title"],@"time_start":iniciaTitle,@"time_end":finalizaTitle};
                
                NSMutableArray *cool =[[NSMutableArray alloc] init];
                [cool addObject:day1Title];
                
                for (NSDictionary *item in response[@"results"][i][@"eventos"]) {
                    [cool addObject:item];
                }
                
                self.collectionItemsDay3[i]=cool;
            }
            
            
        }
        
//        for( response["@results"] )
//        NSLog(@"%@",self.collectionItemsDay2[1]);
//
//        if ([response[@"results"] count]>2) {
//            
//            NSDictionary *day3Title = @{@"nombre":response[@"results"][2][@"nombre"],@"hora_inicio":iniciaTitle,@"hora_fin":finalizaTitle};
//            [self.collectionItemsDay3 addObject:day3Title];
//            for (NSDictionary *item in response[@"results"][2][@"eventos"]) {
//                [self.collectionItemsDay3 addObject:item];
//            }
//        }
//        
//        if ([response[@"results"] count]>3) {
//            
//            NSDictionary *day4Title = @{@"nombre":response[@"results"][3][@"nombre"],@"hora_inicio":iniciaTitle,@"hora_fin":finalizaTitle};
//            [self.collectionItemsDay4 addObject:day4Title];
//            for (NSDictionary *item in response[@"results"][3][@"eventos"]) {
//                [self.collectionItemsDay4 addObject:item];
//            }
//        }
//        
//        if ([response[@"results"] count]>4) {
//            
//            NSDictionary *day5Title = @{@"nombre":response[@"results"][4][@"nombre"],@"hora_inicio":iniciaTitle,@"hora_fin":finalizaTitle};
//            [self.collectionItemsDay5 addObject:day5Title];
//            for (NSDictionary *item in response[@"results"][4][@"eventos"]) {
//                [self.collectionItemsDay5 addObject:item];
//            }
//        }
//        
//        if ([response[@"results"] count]>5) {
//            
//            NSDictionary *day6Title = @{@"nombre":response[@"results"][5][@"nombre"],@"hora_inicio":iniciaTitle,@"hora_fin":finalizaTitle};
//            [self.collectionItemsDay6 addObject:day6Title];
//            for (NSDictionary *item in response[@"results"][5][@"eventos"]) {
//                [self.collectionItemsDay6 addObject:item];
//            }
//        }
//        
//        if ([response[@"results"] count]>6) {
//            
//            NSDictionary *day7Title = @{@"nombre":response[@"results"][6][@"nombre"],@"hora_inicio":iniciaTitle,@"hora_fin":finalizaTitle};
//            [self.collectionItemsDay7 addObject:day7Title];
//            for (NSDictionary *item in response[@"results"][6][@"eventos"]) {
//                [self.collectionItemsDay7 addObject:item];
//            }
//        }
//        
//        if ([response[@"results"] count]>7) {
//            
//            NSDictionary *day8Title = @{@"nombre":response[@"results"][7][@"nombre"],@"hora_inicio":iniciaTitle,@"hora_fin":finalizaTitle};
//            [self.collectionItemsDay8 addObject:day8Title];
//            for (NSDictionary *item in response[@"results"][7][@"eventos"]) {
//                [self.collectionItemsDay8 addObject:item];
//            }
//        }
//        
//        if ([response[@"results"] count]>8) {
//            
//            NSDictionary *day9Title = @{@"nombre":response[@"results"][8][@"nombre"],@"hora_inicio":iniciaTitle,@"hora_fin":finalizaTitle};
//            [self.collectionItemsDay9 addObject:day9Title];
//            for (NSDictionary *item in response[@"results"][8][@"eventos"]) {
//                [self.collectionItemsDay9 addObject:item];
//            }
//        }

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.spinner stopAnimating];
            [self.itemsTable reloadData];
           
        });
    }
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.collectionItemsDay3 count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    long count = [self.collectionItemsDay3 count];
    for (int i=0; i<count; i++) {
        if (section==i) {
            return [self.collectionItemsDay3[i] count];
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
    UILabel *itemInicia = (UILabel *)[cell viewWithTag:2];
    UILabel *itemFin = (UILabel *)[cell viewWithTag:3];
//    UILabel *itemZona = (UILabel *)[cell viewWithTag:4];
//    UILabel *itemTipo = (UILabel *)[cell viewWithTag:10];
//    
//    NSLog(@"num:%f",itemTitle.frame.size.width);
    NSDictionary *mydict;
    long count = [self.collectionItemsDay3 count];
    for (int i=0; i<count; i++) {
        if (indexPath.  section==i) {
            mydict=[self.collectionItemsDay3[i] objectAtIndex:indexPath.row];
        }
    }
//    if (indexPath.section==0){
//        if ([self.collectionItemsDay3[0] count] >0 ){
//            mydict=[self.collectionItemsDay3[0] objectAtIndex:indexPath.row];
//        }
//    }
//    if (indexPath.section==1){
//        if ([self.collectionItemsDay3[1] count] >0 ){
//            mydict=[self.collectionItemsDay3[1] objectAtIndex:indexPath.row];
//        }
//    }
//    if (indexPath.section==2){
//        if ([self.collectionItemsDay3 count] >0 ){
//            mydict=[self.collectionItemsDay3 objectAtIndex:indexPath.row];
//        }
//    }
    
    
//    NSLog(@"section: %i",indexPath.section);
//    NSLog(@"row: %i",indexPath.row);
//    itemTitle.frame = CGRectMake(itemTitle.frame.origin.x, itemTitle.frame.origin.y, 400, itemTitle.frame.size.height);
//    // itemTitle.hidden= TRUE;
    if (indexPath.row==0){
        [cell setBackgroundColor:[UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1]];
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 10000, 0, 0)];
        [itemTitle setTextColor:[UIColor blackColor]];
        [itemTitle setFont: [UIFont fontWithName:@"TrebuchetMS-Bold" size:14]];
        [itemInicia setTextColor:[UIColor blackColor]];
        [itemInicia setFont: [UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        [itemFin setTextColor:[UIColor blackColor]];
        [itemFin setFont: [UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        
    }
    else{
        [cell setBackgroundColor:[UIColor whiteColor]];
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        [itemTitle setTextColor:[UIColor colorWithRed:0.545 green:0.545 blue:0.545 alpha:1]];
        [itemTitle setFont: [UIFont fontWithName:@"TrebuchetMS" size:12]];
        [itemInicia setTextColor:[UIColor blackColor]];
        [itemInicia setFont: [UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        [itemFin setTextColor:[UIColor blackColor]];
        [itemFin setFont: [UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        
        
    }
//    if(mydict[@"etapa_dia_carrera_set"]){
//        [cell setBackgroundColor:[UIColor blackColor]];
//        [cell setSeparatorInset:UIEdgeInsetsMake(0, 10000, 0, 0)];
//        [itemTitle setText:@""];
//        [itemTipo setText:[[NSString stringWithString:mydict[@"nombre"]] uppercaseString]];
//    }
//    else{
//        [itemTipo setText:@""];
        if(mydict[@"name"]){
            [itemTitle setText:[NSString stringWithString:mydict[@"name"]]];
        }
        else{
            [itemTitle setText:@""];
        }
//    }

    if(mydict[@"time_start"]){
        [itemInicia setText:[NSString stringWithString:mydict[@"time_start"]]];
    }
    else{
        [itemInicia setText:@""];
    }
    if(mydict[@"time_end"]){
        [itemFin setText:[NSString stringWithString:mydict[@"time_end"]]];
    }
    else{
        [itemFin setText:@""];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
