//
//  PostalDetalleViewController.m
//  Rally Maya
//
//  Created by Jonathan Horta on 3/24/16.
//  Copyright © 2016 Jonathan Horta. All rights reserved.
//

#import "PostalDetalleViewController.h"

@interface PostalDetalleViewController ()

@end

@implementation PostalDetalleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:1 green:0.859 blue:0.482 alpha:1];/*#ffdb7b*/
    label.text = @"POSTALES";
    self.navigationItem.titleView = label;
    [label sizeToFit];
    
    NSLog(@"%@",self.selectedImg);
    UIImage *img = [UIImage imageNamed:self.selectedImg];
    [self.cardImg setImage:img];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.userImage = info[UIImagePickerControllerOriginalImage];
    [_userImg setImage:self.userImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    NSLog(@"..........");
    [self.shareButton setHidden:false];
    [self.saveButton setHidden:false];

    
}


- (UIImage *)mergeImages{
    
    int width = 750;
    int height = 1000;
    NSString *imgURL= self.selectedImg;
    UIImage *bottomImage = self.userImage; //background image
    UIImage *image  = [UIImage imageNamed:imgURL]; //foreground image
    
    CGSize newSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContext( newSize );
    
    // Use existing opacity as is
    [bottomImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Apply supplied opacity if applicable
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeNormal alpha:1];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (void)thisImage:(UIImage *)image hasBeenSavedInPhotoAlbumWithError:(NSError *)error usingContextInfo:(void*)ctxInfo {
    NSString *alertTitle = @"";
    NSString *alertMessage = @"";
    if (error) {
        alertTitle =@"Error";
        alertMessage = @"Intenta nuevamente";
    } else {
        alertTitle = @"";
        alertMessage = @"Foto guardada";
    }
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:alertTitle message:alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [message show];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)takePicBtn:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPicBtn:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];

}

- (IBAction)savePicBtn:(UIButton *)sender {
    UIImage *mergedImage = [self mergeImages];
    UIImageWriteToSavedPhotosAlbum(mergedImage,self,@selector(thisImage:hasBeenSavedInPhotoAlbumWithError:usingContextInfo:),NULL);
}

- (IBAction)shareBtn:(UIButton *)sender {
    NSString *hashtag = [NSString stringWithFormat:@" %@",self.hashtag];
    NSString *shareText = @"En *** disfrutando el #RALLYMAYAMEXICO";
    NSString *finalText = [shareText stringByAppendingString:hashtag];
    UIImage *mergedImage = [self mergeImages];
    NSArray *items2Share= @[finalText,mergedImage];
    UIActivityViewController *activityViewC = [[UIActivityViewController alloc] initWithActivityItems:items2Share applicationActivities:nil];
    activityViewC.excludedActivityTypes = @[UIActivityTypePostToWeibo,
                                            UIActivityTypePrint,
                                            UIActivityTypeCopyToPasteboard,
                                            UIActivityTypeAssignToContact,
                                            UIActivityTypeSaveToCameraRoll,
                                            UIActivityTypeAddToReadingList,
                                            UIActivityTypePostToFlickr,
                                            UIActivityTypePostToVimeo,
                                            UIActivityTypePostToTencentWeibo,
                                            UIActivityTypeAirDrop];
    
    [self presentViewController:activityViewC animated:YES completion:nil];
}
@end
