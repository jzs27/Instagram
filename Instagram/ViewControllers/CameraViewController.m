//
//  CameraViewController.m
//  Instagram
//
//  Created by jessicasyl on 7/9/21.
//

#import "CameraViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>


@interface CameraViewController ()
@property (nonatomic) AVCaptureSession *captureSession;
@property (nonatomic) AVCapturePhotoOutput *stillImageOutput;
@property (nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)didTakePhoto:(id)sender {
    AVCapturePhotoSettings *settings = [AVCapturePhotoSettings photoSettingsWithFormat:@{AVVideoCodecKey: AVVideoCodecTypeJPEG}];

        [self.stillImageOutput capturePhotoWithSettings:settings delegate:self];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.captureSession = [AVCaptureSession new];
    self.captureSession.sessionPreset = AVCaptureSessionPresetPhoto;
    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (!backCamera) {
        NSLog(@"Unable to access back camera!");
        return;
    }
    NSError *error;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:backCamera
                                                                        error:&error];
    if (!error) {
        //Step 9
    }
    else {
        NSLog(@"Error Unable to initialize back camera: %@", error.localizedDescription);
    }
    self.stillImageOutput = [AVCapturePhotoOutput new];
    if ([self.captureSession canAddInput:input] && [self.captureSession canAddOutput:self.stillImageOutput]) {
        
        [self.captureSession addInput:input];
        [self.captureSession addOutput:self.stillImageOutput];
        [self setupLivePreview];
    }
}

- (void)setupLivePreview {
    
    self.videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
        if (self.videoPreviewLayer) {
            
            self.videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
            self.videoPreviewLayer.connection.videoOrientation = AVCaptureVideoOrientationPortrait;
            [self.previewView.layer addSublayer:self.videoPreviewLayer];
            
            dispatch_queue_t globalQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
            dispatch_async(globalQueue, ^{
                [self.captureSession startRunning];
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.videoPreviewLayer.frame = self.previewView.bounds;
                });
            });
        }
}

- (void)captureOutput:(AVCapturePhotoOutput *)output didFinishProcessingPhoto:(AVCapturePhoto *)photo error:(nullable NSError *)error {
    
    NSData *imageData = photo.fileDataRepresentation;
    if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        // Add the image to captureImageView here...
        self.captureImageView.image = image;
        
    }
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.captureSession stopRunning];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
