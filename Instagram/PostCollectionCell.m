//
//  PostCollectionCell.m
//  Instagram
//
//  Created by jessicasyl on 7/9/21.
//

#import "PostCollectionCell.h"
#import "PostObject.h"
#import "UIImageView+AFNetworking.h"
#import <Parse/Parse.h>

@implementation PostCollectionCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    //[super setSelected:selected animated:animated];
    //[self updateCellWithPost:self.post];
}

-(void)setPost:(PostObject *)post{
    _post=post;
    PFFileObject *image = self.post.image;
    NSURL *imageURL = [NSURL URLWithString:image.url];
    [self.postView setImageWithURL:imageURL];
}


@end
