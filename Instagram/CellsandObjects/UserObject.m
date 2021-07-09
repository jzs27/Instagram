//
//  UserObject.m
//  Instagram
//
//  Created by jessicasyl on 7/8/21.
//

#import "UserObject.h"

@implementation UserObject

@dynamic username;



- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.username = dictionary[@"username"];
                
    // Initialize any other properties
    }
    return self;
}

@end
