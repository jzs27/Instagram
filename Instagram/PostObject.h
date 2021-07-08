//
//  PostObject.h
//  Instagram
//
//  Created by jessicasyl on 7/6/21.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"
@interface PostObject : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFileObject *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSMutableArray *)postsWithArray:(NSArray *)dictionaries;

@end

//NS_ASSUME_NONNULL_END
