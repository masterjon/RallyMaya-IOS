//
//  QRooViewController.h
//  Rally Maya
//
//  Created by Jonathan Horta on 2/26/15.
//  Copyright (c) 2015 Jonathan Horta. All rights reserved.
//

#import "KMAccordionTableViewController.h"

@interface QRooViewController : KMAccordionTableViewController
@property (strong, nonatomic) IBOutlet UITableView *myTable;
    @property (nonatomic,strong)  UIColor *rowColor;
    @property (nonatomic,strong) NSMutableArray *items;
@end
