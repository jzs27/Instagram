//
//  DetailsViewController.m
//  Instagram
//
//  Created by jessicasyl on 7/9/21.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *postView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPost:self.post];
    // Do any additional setup after loading the view.
}

- (void)setPost:(PostObject *)post{
    _post=post;
    self.captionLabel.text=post.caption;
    PFFileObject *image = self.post.image;
    NSURL *imageURL = [NSURL URLWithString:image.url];
    [self.postView setImageWithURL:imageURL];
    
    
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
