//
//  ComposeViewControlller.m
//  Instagram
//
//  Created by jessicasyl on 7/6/21.
//

#import "ComposeViewControlller.h"
#import "Parse/Parse.h"
#import "PostObject.h"

#import <UIKit/UIKit.h>
@interface ComposeViewControlller() <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *postView;
@property (weak, nonatomic) IBOutlet UITextField *captionTextField;
@property (nonatomic, strong) PostObject *post;
@end

@implementation ComposeViewControlller
- (void)viewDidLoad{
    [super viewDidLoad];
    //creating size
    CGSize size = CGSizeMake(1500, 1500);
    [self resizeImage:self.tempPostImage withSize:size];
    
    //setting temporary image in case custom camera is used
    //self.postView.image = self.tempPostImage;
}
- (IBAction)didCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)didPost:(id)sender {
    [PostObject postUserImage:self.postView.image withCaption:self.captionTextField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (error) {
            
        } else {
            NSLog(@"Yo it succeeded!");
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
    }];
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
    CGSize size = CGSizeMake(1500, 1500);
    self.postView.image = [self resizeImage:originalImage withSize:size];
    
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}





@end
