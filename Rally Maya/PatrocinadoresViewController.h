//
//  PatrocinadoresViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 2/24/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatrocinadoresViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *menuCollectionView;
@property (strong,nonatomic) NSMutableArray *menuItems;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;
@end
