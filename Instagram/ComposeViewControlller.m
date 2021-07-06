//
//  ComposeViewControlller.m
//  Instagram
//
//  Created by jessicasyl on 7/6/21.
//

#import "ComposeViewControlller.h"

#import <UIKit/UIKit.h>
@interface ComposeViewControlller() <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *postView;


@end


@implementation ComposeViewControlller
- (IBAction)didCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)didTapImage:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    // The Xcode simulator does not support taking pictures, so let's first check that the camera is indeed supported on the device before trying to present it.
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    //UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    self.postView.image = originalImage;
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

//UIImagePickerController *imagePickerVC = [UIImagePickerController new];
//imagePickerVC.delegate = self;
//imagePickerVC.allowsEditing = YES;
//imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//
//[self presentViewController:imagePickerVC animated:YES completion:nil];




@end
