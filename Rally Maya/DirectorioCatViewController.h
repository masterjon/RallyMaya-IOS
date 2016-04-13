//
//  DirectorioCatViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 4/10/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectorioCatViewController : UIViewController
@property (strong, nonatomic) NSString *titulo;
@property (strong, nonatomic) NSNumber *cityId;
@property (strong,nonatomic) NSMutableArray *collectionItems;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) UIColor *sYellow;
@property (strong, nonatomic) UIColor *lYellow;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;

@end
