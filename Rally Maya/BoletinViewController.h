//
//  BoletinTableViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 4/11/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoletinViewController : UIViewController
@property (strong,nonatomic) NSMutableArray *collectionItems;
@property (strong, nonatomic) IBOutlet UITableView *itemsTable;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UILabel *alertLabel;

@end
