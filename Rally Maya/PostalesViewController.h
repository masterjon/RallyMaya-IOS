//
//  PostalesViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 3/23/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostalesViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong,nonatomic) NSMutableArray *collectionItems;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
