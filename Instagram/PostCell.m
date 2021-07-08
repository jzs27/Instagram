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
    // Configure the input format to parse the date string
    formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
    // Convert String to Date
    //NSDate *date = [formatter dateFromString:createdAtOriginalString];
    // Configure output format
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    // Convert Date to String
    

    //self.createdAtString = [formatter stringFromDate:date];
    self.timeAgoLabel.text = date.shortTimeAgoSinceNow;
    
    NSLog(@"%@",self.timeAgoLabel.text );
    
}

@end
