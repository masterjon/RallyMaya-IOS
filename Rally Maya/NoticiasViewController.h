//
//  NoticiasViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 4/4/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticiasViewController : UIViewController
@property (strong,nonatomic) NSMutableArray *collectionItems;
@property (strong, nonatomic) IBOutlet UITableView *itemsTable;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;

@property (strong, nonatomic) IBOutlet UIImageView *featuredImage;
@property (strong, nonatomic) IBOutlet UILabel *featuredText;

@property (strong,nonatomic) NSString *fTitle;
@property (strong,nonatomic) NSString *fText;
@property (strong,nonatomic) NSString *fFullText;
@property (strong,nonatomic) NSString *fDate;
@property (strong,nonatomic) NSString *fImg;

@end
