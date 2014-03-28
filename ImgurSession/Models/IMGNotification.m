//
//  IMGNotification.m
//  ImgurSession
//
//  Created by Geoff MacDonald on 2014-03-15.
//  Copyright (c) 2014 GeoffMacDonald. All rights reserved.
//

#import "IMGNotification.h"

#import "IMGComment.h"
#import "IMGMessage.h"
#import "IMGConversation.h"

@implementation IMGNotification

- (instancetype)initReplyNotificationWithJSONObject:(NSDictionary *)jsonData error:(NSError *__autoreleasing *)error{
    
    if(self = [super init]) {
        
        _notificationId = jsonData[@"id"];
        _accountId = [jsonData[@"account_id"] integerValue];
        _isViewed = [jsonData[@"viewed"] boolValue];
        _isReply = YES;
        
        NSDictionary * content = jsonData[@"content"];
        
        IMGComment * comment = [[IMGComment alloc] initWithJSONObject:content error:error];
        _reply = comment;
    }
    return [self trackModels];
}

- (instancetype)initConversationNotificationWithJSONObject:(NSDictionary *)jsonData error:(NSError *__autoreleasing *)error{
    
    if(self = [super init]) {
        
        _notificationId = jsonData[@"id"];
        _accountId = [jsonData[@"account_id"] integerValue];
        _isViewed = [jsonData[@"viewed"] boolValue];
        _isReply = NO;
        
        NSDictionary * content = jsonData[@"content"];
        
        IMGConversation * convo = [[IMGConversation alloc] initWithJSONObjectFromNotification:content error:error];
        _conversation = convo;
    }
    return [self trackModels];
}

#pragma mark - Describe

- (NSString *)description{
    return [NSString stringWithFormat:@"%@ ; notifyId: \"%@\"; accountId: %ld; viewed: %@;", [super description], self.notificationId, (long)self.accountId, (self.isViewed ? @"YES" : @"NO")];
}

-(BOOL)isEqual:(id)object{
    
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[IMGNotification class]]) {
        return NO;
    }
    
    return ([[object notificationId] isEqualToString:self.notificationId]);
}


@end
