//
//  PostCollectionCell.h
//  Instagram
//
//  Created by jessicasyl on 7/9/21.
//

#import <UIKit/UIKit.h>
#import "PostObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *postView;
@property PostObject *post;

@end

NS_ASSUME_NONNULL_END
