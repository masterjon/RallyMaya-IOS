//
//  PostalesViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/23/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "PostalesViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "PostalDetalleViewController.h"

@interface PostalesViewController ()

@end

@implementation PostalesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1];/*#ffdb7b*/
    label.text = @"POSTALES";
    self.navigationItem.titleView = label;
    [label sizeToFit];
    NSArray *viewControllers = self.navigationController.viewControllers;
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    self.collectionItems = [[NSMutableArray alloc] init];
    NSArray *ecardsMenu  = @[
                             @{
                                 @"image":@"postal-merida.jpg",
                                 @"imageDetail":@"postal-merida-bg",
                                 @"hashtag":@"#---"
                                 },
                             @{
                                 @"image":@"postal-izamal.jpg",
                                 @"imageDetail":@"postal-izamal-bg",
                                 @"hashtag":@"#---"
                                 },
                             @{
                                 @"image":@"postal-chichen-itza.jpg",
                                 @"imageDetail":@"postal-chichen-itza-bg",
                                 @"hashtag":@"---"
                                 },
                             @{
                                 @"image":@"postal-valladolid.jpg",
                                 @"imageDetail":@"postal-valladolid-bg",
                                 @"hashtag":@"---"
                                 },
                             @{
                                 @"image":@"postal-tihosuco.jpg",
                                 @"imageDetail":@"postal-tihosuco-bg",
                                 @"hashtag":@"---"
                                 },
                             @{
                                 @"image":@"postal-chetumal.jpg",
                                 @"imageDetail":@"postal-chetumal-bg",
                                 @"hashtag":@"---",
                                 },
                             @{
                                 @"image":@"postal-bacalar.jpg",
                                 @"imageDetail":@"postal-bacalar-bg",
                                 @"hashtag":@"#---"
                                 },
                             @{
                                 @"image":@"postal-kohunlich.jpg",
                                 @"imageDetail":@"postal-kohunlich-bg",
                                 @"hashtag":@"---"
                                 },
                             @{
                                 @"image":@"postal-tulum.jpg",
                                 @"imageDetail":@"postal-tulum-bg",
                                 @"hashtag":@"---"
                                 },
                             @{
                                 @"image":@"postal-playa.jpg",
                                 @"imageDetail":@"postal-playa-bg",
                                 @"hashtag":@"---"
                                 },
                             
                             ];
    for (NSDictionary *dataDict  in ecardsMenu){
        [self.collectionItems addObject:dataDict];
    }
    // Do any additional setup after loading the view.
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.collectionItems count];
}
-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImageView *itemImage = (UIImageView *) [cell viewWithTag:10];
    if ([self.collectionItems count] > 0) {
        NSDictionary *cellDictionary = [ self.collectionItems objectAtIndex:indexPath.row];
        NSString *image = [cellDictionary objectForKey:@"image"];
        itemImage.image = [UIImage imageNamed:image];
    }
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    PostalDetalleViewController *View = [[PostalDetalleViewController alloc] init];
    View = [segue destinationViewController];
    NSArray *arrayOfIndexPaths = [self.collectionView  indexPathsForSelectedItems];
    NSIndexPath *path = [arrayOfIndexPaths firstObject];
    NSDictionary *itemdictionary = [self.collectionItems objectAtIndex:path.row];
    View.selectedImg = itemdictionary[@"imageDetail"];
    View.hashtag = itemdictionary[@"hashtag"];
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
