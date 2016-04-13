//
//  PGSideDrawerController.m
// SideDrawerExample
//
//  Created by Pulkit Goyal on 18/09/14.
//  Copyright (c) 2014 Pulkit Goyal. All rights reserved.
//

#import "PGSideDrawerController.h"
#import "UIViewController+MMDrawerController.h"

@interface PGSideDrawerController ()

@property(nonatomic) int currentIndex;
@end

@implementation PGSideDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentIndex = 0;
}


#pragma mark - Table View Delegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    UIImage *pattern = [UIImage imageNamed:@"fondo_row.png"];
    [cell setBackgroundColor:[UIColor colorWithPatternImage:pattern]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.currentIndex == indexPath.row) {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        
        return;
    }
    
    UIViewController *centerViewController;
    switch (indexPath.row) {
        case 0:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InicioViewNavigation"];
            break;
        case 1:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RallyViewNavigation"];
            break;
        case 2:{
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSString *key = [defaults stringForKey:@"token"];
            NSLog(@"%@",key);
            if (key==NULL) {
                centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewNavigation"];
            }
            else{
                centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PerfilViewNavigation"];
            }
            
            break;
        }
        case 3:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ProgramaViewNavigation"];
            break;
        case 4:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RutaViewNavigation"];
            break;
        case 5:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ParticipantesViewNavigation"];
            break;
        case 6:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PatrocinadoresViewNavigation"];
            break;
        case 7:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PatrocinadoresViewNavigation"];
            break;
        case 8:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PostalesViewNavigation"];
            break;
        case 9: {
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PreguntasViewNavigation"];
            break;
        }
        case 10:{
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NoticiasViewNavigation"];
            break;
        }
        case 11:{
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SocialHubViewNavigation"];
            break;
        }
        default:
            break;
            
    }
    
    if (centerViewController) {
        self.currentIndex = indexPath.row;
        [self.mm_drawerController setCenterViewController:centerViewController withCloseAnimation:YES completion:nil];
    } else {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
    }
}


@end