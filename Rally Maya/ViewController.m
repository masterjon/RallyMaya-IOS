//
//  ViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 2/23/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuItems = [[NSMutableArray alloc] init];
    NSArray *menu = @[
                      @{
                          @"image":@"rally-maya",
                          @"target":@"RallyView",
                        },
                      @{
                          @"image":@"participantes",
                          @"target":@"ParticipantesView",
                        },
                      @{
                          @"image":@"ruta",
                          @"target":@"",
                        },
                      @{
                          @"image":@"tips",
                          @"target":@"",
                        },
                      @{
                          @"image":@"patrocinadores",
                          @"target":@"",
                        },
                      
                      @{
                          @"image":@"directorio",
                          @"target":@"",
                        },
                      @{
                          @"image":@"diabetes",
                          @"target":@"",
                          },
                      @{
                          @"image":@"cronometro",
                          @"target":@"",
                          },
                      
                      ];
    
    for (NSArray *dataDictionary in menu){
        [self.menuItems addObject:dataDictionary];
        
    }
    // Do any additional setup after loading the view, typically from a nib.
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

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSDictionary *menuItemDictionary = [self.menuItems objectAtIndex:indexPath.row];
    
    ViewController *viewC = [self.storyboard instantiateViewControllerWithIdentifier:menuItemDictionary[@"target"]];
    [self.navigationController pushViewController:viewC animated:YES];


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

@end