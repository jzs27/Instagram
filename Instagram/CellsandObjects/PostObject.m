//
//  PostObject.m
//  Instagram
//
//  Created by jessicasyl on 7/6/21.
//

#import "PostObject.h"
#import "UserObject.h"

@implementation PostObject
    
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
//@dynamic username;
@dynamic commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    PostObject *newPost = [PostObject new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
 
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.png"  data:imageData];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self){
    //self.author = dictionary[@"author"];
    self.caption = dictionary[@"caption"];
    self.postID = dictionary[@"objectID"];
    self.userID = dictionary[@"author"][@"objectID"];
    self.image = dictionary[@"image"];
    self.likeCount = dictionary[@"likecount"];
    self.commentCount = dictionary[@"commmentCount"];

    NSDictionary *user = dictionary[@"author"];
    self.author = [[UserObject alloc] initWithDictionary:user];
     }
     return self;
 }

+ (NSMutableArray *)postsWithArray:(NSArray *)dictionaries{
    NSMutableArray *posts = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        PostObject *post = [[PostObject alloc] initWithDictionary:dictionary];
        [posts addObject:post];
    }
    return posts;
}

@end
