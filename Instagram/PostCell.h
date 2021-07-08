//
//  PostCell.h
//  Instagram
//
//  Created by jessicasyl on 7/7/21.
//

#import <UIKit/UIKit.h>
#import "PostObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property PostObject *post;
@property (weak, nonatomic) IBOutlet UIImageView *postView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeAgoLabel;

@end

NS_ASSUME_NONNULL_END
