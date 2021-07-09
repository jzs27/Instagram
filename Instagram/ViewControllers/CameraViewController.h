//
//  CameraViewController.h
//  Instagram
//
//  Created by jessicasyl on 7/9/21.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CameraViewController :UIViewController <AVCapturePhotoCaptureDelegate>
@property (weak, nonatomic) IBOutlet UIView *previewView;
@property (weak, nonatomic) IBOutlet UIImageView *captureImageView;

@end

NS_ASSUME_NONNULL_END
