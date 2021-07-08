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
    self.didTap = NO;
    
    
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
    
    
    self.captionDetailsLabel.text = self.captionLabel.text;
    self.timeAgoDetailsLabel.text = self.timeAgoLabel.text;
    self.dateDetailsLabel.text = [formatter stringFromDate:date];

    
}

-(void)handleSingleTap:(UITapGestureRecognizer *)sender{
    if (self.didTap == NO){
        self.didTap = YES;
        self.postView.alpha = 0.5;
        
        
        self.captionDetailsLabel.alpha = 1;
        self.dateDetailsLabel.alpha = 1;
        self.timeAgoDetailsLabel.alpha = 1;
    }
    else{
        self.didTap = NO;
        self.postView.alpha = 1;
        
        self.captionDetailsLabel.alpha = 0;
        self.dateDetailsLabel.alpha = 0;
        self.timeAgoDetailsLabel.alpha =0;
    }
    
    
    
}
//- (IBAction)didTapLikeButton:(id)sender {
//    NSString *postID = self.post.postID;
//    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
//    [query getObjectInBackgroundWithId:postID block:^(PFObject *post, NSError *error) {
//            post[@"likeCount"] +=1;
//        [post saveInBackground];
//
//    }];
//}




@end
