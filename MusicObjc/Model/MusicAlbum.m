//
//  MusicAlbum.m
//  MusicObjc
//
//  Created by Ghassan  albakuaa  on 10/25/20.
//

#import "MusicAlbum.h"

@implementation MusicAlbum

- (instancetype) initWithEmail:(NSString *)title {
   //main init
    if (self = [super init]){
        _title = title;
    }
    return self;
}

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    NSString *title = dictionary[@"title"];
    return [self initWithEmail:title];
}


@end
