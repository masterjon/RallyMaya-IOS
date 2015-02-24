//
//  ParticipantesViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/23/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "ParticipantesViewController.h"
#import "ParticipanteViewController.h"
@interface ParticipantesViewController ()

@end

@implementation ParticipantesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuItems = [[NSMutableArray alloc] init];
    NSArray *menu = @[
                      @{
                          @"image":@"ALFA-ROMEO-TOURING-SPIDER-1960",
                          @"bigImg":@"1",
                          },
                      @{
                          @"image":@"AUSTIN-COOPER-1964",
                          @"bigImg":@"2",
                          },
                      @{
                          @"image":@"CHRYSLER-DODGE-PLYMOUTH-BELVEREDE-1966",
                          @"bigImg":@"3",
                          },
                      @{
                          @"image":@"CHRYSLER-IMPERIAL-AIRFLOW-1936",
                          @"bigImg":@"4",
                          },
                      @{
                          @"image":@"CORVAIR-1963",
                          @"bigImg":@"5",
                          },
                      
                      @{
                          @"image":@"FAIRLINE--1957",
                          @"bigImg":@"6",
                          },
                      @{
                          @"image":@"FERRARI-308-GTS-1972",
                          @"bigImg":@"7",
                          },
                      @{
                          @"image":@"FORD-ROADSTER-1931",
                          @"bigImg":@"8",
                          },
                      @{
                          @"image":@"JAGUAR-E-TYPE-1961",
                          @"bigImg":@"9",
                          },
                      
                      ];
    
    for (NSArray *dataDictionary in menu){
        [self.menuItems addObject:dataDictionary];
        
    }
    // Do any additional setup after loading the view.
}
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.menuItems count];
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"menuCell" forIndexPath:indexPath];
    
    UIImageView *menuImage = (UIImageView *) [cell viewWithTag:10];
    if([self.menuItems count] >0){
        NSDictionary *cellDictionary = [self.menuItems objectAtIndex:indexPath.row];
        NSString *imageItem =[cellDictionary objectForKey:@"image"];
        menuImage.image = [UIImage imageNamed:imageItem];
        
    }
    return cell;
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ParticipanteViewController *View = [[ParticipanteViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.menuCollectionView  indexPathsForSelectedItems];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *itemdictionary = [self.menuItems objectAtIndex:path.row];
    View.imagenUrl = itemdictionary[@"bigImg"];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    int top = 10;
    int left = 10;
    int bottom = 10;
    int right = 10;
    NSLog(@"%i",(int)screenBounds.size.width);
    switch ((int) screenBounds.size.width) {
        case 768:
            NSLog(@"--Ipad Portrait");
            left = 50;
            right = 50;
            
            break;
        case 1024:
            NSLog(@"--Ipad Landscape");
            left = 50;
            right = 50;
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
