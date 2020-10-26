//
//  MusicAlbumController.h
//  MusicObjc
//
//  Created by Ghassan  albakuaa  on 10/25/20.
//

#import <Foundation/Foundation.h>



@interface MusicAlbumController : NSObject
//


@property (nonatomic) NSArray *album;


- (void)searchForAlbum:(void (^)(NSError *error))completion;

@end


