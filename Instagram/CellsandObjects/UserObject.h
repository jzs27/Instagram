//
//  UserObject.h
//  Instagram
//
//  Created by jessicasyl on 7/8/21.
//

#import <Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserObject : PFUser<PFSubclassing>
@property (nonatomic, strong) NSString *username;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end



NS_ASSUME_NONNULL_END
