//
//  TipsLugaresViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 2/24/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "KMAccordionTableViewController.h"

@interface TipsLugaresViewController : KMAccordionTableViewController
@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic,strong) NSMutableArray *items;
@property (nonatomic,strong)  UIColor *rowColor;
@end
