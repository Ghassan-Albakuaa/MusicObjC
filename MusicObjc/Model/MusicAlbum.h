//
//  MusicAlbum.h
//  MusicObjc
//
//  Created by Ghassan  albakuaa  on 10/25/20.
//

#import <Foundation/Foundation.h>



@interface MusicAlbum : NSObject

@property NSString *title;

//init email
- (instancetype) initWithTitle:(NSString *)title;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end


