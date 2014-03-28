//
//  IMGAlbum.m
//  ImgurSession
//
//  Created by Johann Pardanaud on 11/07/13.
//  Distributed under the MIT license.
//

#import "IMGAlbum.h"
#import "IMGImage.h"

@implementation IMGAlbum;

#pragma mark - Init With Json

- (instancetype)initWithJSONObject:(NSDictionary *)jsonData error:(NSError *__autoreleasing *)error{
    self = [super initWithJSONObject:jsonData error:error];
    
    if(self && !*error) {
        
        _deletehash = jsonData[@"deletehash"];
    }
    return [self trackModels];
}


#pragma mark - Describe

- (NSString *)description{
    return [NSString stringWithFormat: @"%@ ; deletehash: %@",[super description], self.deletehash];
}

-(BOOL)isEqual:(id)object{
    
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[IMGAlbum class]]) {
        return NO;
    }
    
    return ([[object albumID] isEqualToString:self.albumID]);
}

@end
