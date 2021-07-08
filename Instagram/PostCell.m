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
#import "DateTools.h"

@implementation PostCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    [self updateCellWithPost:self.post];
    
    [self.postView setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
    
    [self.postView addGestureRecognizer:singleTap];
    self.captionDetailsLabel.alpha = 0;
    self.dateDetailsLabel.alpha = 0;
    self.timeAgoDetailsLabel.alpha = 0;
    
    //set both lables alpha's equal to 0
}
-(void) updateCellWithPost:(PostObject *)post{
    self.captionLabel.text = self.post.caption;
    PFFileObject *image = self.post.image;
    NSURL *imageURL = [NSURL URLWithString:image.url];
    [self.postView setImageWithURL:imageURL];

    PFUser *user = self.post.author;
    
    self.usernameLabel.text = user.username;
    self.likeCountLabel.text =[self.post.likeCount stringValue];
    
    
    
    NSDate *date= self.post.createdAt;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    self.timeAgoLabel.text = date.shortTimeAgoSinceNow;

    
}

-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    self.postView.alpha = 0.5;
    NSLog(@"Tapping a post!");
    self.captionDetailsLabel.text = self.captionLabel.text;
    self.timeAgoDetailsLabel.text = self.timeAgoLabel.text;
    
    self.captionDetailsLabel.alpha = 1;
    self.dateDetailsLabel.alpha = 1;
    self.timeAgoDetailsLabel.alpha = 1;
    
    //make outlets for the labels in the .h file
    //set alpha for both labels = 1
    // self.nameLabel.alpha = 1;
    //set the data for the text of the labels
    
}




@end
