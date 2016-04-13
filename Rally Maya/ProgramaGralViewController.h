//
//  ProgramaGralViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 3/31/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramaGralViewController : UIViewController
@property (strong,nonatomic) NSMutableArray *collectionItemsDay1;
@property (strong,nonatomic) NSMutableArray *collectionItemsDay2;
@property (strong,nonatomic) NSMutableArray *collectionItemsDay3;
@property (strong,nonatomic) NSMutableArray *collectionItemsDay4;
@property (strong,nonatomic) NSMutableArray *collectionItemsDay5;
@property (strong,nonatomic) NSMutableArray *collectionItemsDay6;
@property (strong,nonatomic) NSMutableArray *collectionItemsDay7;
@property (strong,nonatomic) NSMutableArray *collectionItemsDay8;
@property (strong,nonatomic) NSMutableArray *collectionItemsDay9;

@property (strong, nonatomic) IBOutlet UITableView *itemsTable;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;

@end
