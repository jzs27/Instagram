//
//  PostCell.m
//  Instagram
//
//  Created by jessicasyl on 7/7/21.
//

#import "PostCell.h"
#import "PostObject.h"
#import <Parse/Parse.h>
#import "UIImageView+AFNetworking.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    [self updateCellWithPost:self.post];
}
-(void) updateCellWithPost:(PostObject *)post{
    self.captionLabel.text = self.post.caption;
    PFFileObject *image = self.post.image;
    NSURL *imageURL = [NSURL URLWithString:image.url];
    [self.postView setImageWithURL:imageURL];
}

@end
