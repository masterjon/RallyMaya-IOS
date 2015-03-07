//
//  PatrocinadoresViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/24/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "PatrocinadoresViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"

@interface PatrocinadoresViewController ()

@end

@implementation PatrocinadoresViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //NavigatrionDrawer
    self.navigationItem.title = @"PATROCINADORES";
    NSArray *viewControllers = self.navigationController.viewControllers;
    UIViewController *vc = [viewControllers objectAtIndex:0];
    NSLog(@"%@",vc.title);
    //If there are not other views it show the menu button, else the defalut back button is shown
    if([viewControllers count] <= 1){
        
        [self setupLeftMenuButton];
    }
    
    
    self.menuItems = [[NSMutableArray alloc] init];
    NSArray *menu = @[
                      
                      
                      @{
                          @"image":@"asur",
                          },
                      @{
                          @"image":@"aicm",
                          },
                      @{
                          @"image":@"hertz",
                          },
                      @{
                          @"image":@"interjet",
                          },
                      @{
                          @"image":@"infinitum",
                          },
                      @{
                          @"image":@"clarovideo",
                          },
                      @{
                          @"image":@"fullgas",
                          },
                      @{
                          @"image":@"5m2",
                          },
                      @{
                          @"image":@"mayaland",
                          },
                      @{
                          @"image":@"oasis",
                          },
                      
                      @{
                          @"image":@"scappino",
                          },
                      @{
                          @"image":@"ultramar",
                          },
                      @{
                          @"image":@"donm",
                          },
                      @{
                          @"image":@"cancun",
                          },
                      @{
                          @"image":@"deiman",
                          },
                      @{
                          @"image":@"sct",
                          },
                      @{
                          @"image":@"mediacorp",
                          },
                      @{
                          @"image":@"campeche",
                          },
                      
                      @{
                          @"image":@"yucatan",
                          },
                      
                      ];
    
    for (NSArray *dataDictionary in menu){
        [self.menuItems addObject:dataDictionary];
        
    }
    // Do any additional setup after loading the view.
}
- (void)setupLeftMenuButton {
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton];
}

- (void)leftDrawerButtonPress:(id)leftDrawerButtonPress {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    int top = 10;
    int left = 10;
    int bottom = 10;
    int right = 10;
    NSLog(@"%i",(int)screenBounds.size.width);
    switch ((int) screenBounds.size.width) {
        case 320:
            NSLog(@"--5--");
            left = 25;
            right = 25;
            break;
        case 768:
            NSLog(@"--Ipad Portrait");
            left = 50;
            right = 50;
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
