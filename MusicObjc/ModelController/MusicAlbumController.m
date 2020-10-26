//
//  MusicAlbumController.m
//  MusicObjc
//
//  Created by Ghassan  albakuaa  on 10/25/20.
//

#import "MusicAlbumController.h"
#import  "MusicAlbum.h"
@interface MusicAlbumController()

@property NSMutableArray *internalAlbum;


@end
@implementation MusicAlbumController

static NSString *const baseURLString = @"https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json" ;
//@"https://randomuser.me/api/?format=json&results=20";

- (NSArray *)album {
    return  self.internalAlbum;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalAlbum = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)searchForAlbum:(void (^)(NSError *error))completion{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //if network call
        if (error) {
            completion(error);
            return;
        }
        
        NSError *jsonError = nil;
        //bring all information
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        //if error with json data
        if(jsonError){
            completion(nil);
            return;        }
        
        if(![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"json is not dictionary as expected");
            completion([[NSError alloc] init]);
        }
        // to get result
        NSArray *fetchedData = json[@"feed"];
       //   NSLog(@fetchedData);
        NSLog(@"%@" , fetchedData);
        
        
        NSMutableArray *fetchdAlbum = [[NSMutableArray alloc] init];
        
        for(NSDictionary *songDictionaray in fetchedData){
            MusicAlbum *song = [[MusicAlbum alloc] initWithDictionary:songDictionaray];
            [fetchdAlbum addObject:song];
            NSLog(@"%@" , song);
            
            
        }
        self.internalAlbum = fetchdAlbum;
        
        completion(nil);
        
       }];
       [dataTask resume];
       //resume excute dataTask

       }

       @end

/*
 
 
 // to get result
 NSArray *fetchedData = json[@"feed"];
//   NSLog(@fetchedData);
 NSLog(@"%@" , fetchedData);
 
 
 NSMutableArray *fetchdAlbum = [[NSMutableArray alloc] init];
 
 for(NSDictionary *songDictionaray in fetchedData){
     MusicAlbum *song = [[MusicAlbum alloc] initWithDictionary:songDictionaray];
     [fetchdAlbum addObject:song];
     
 }
 self.internalAlbum = fetchdAlbum;
 
 completion(nil);
 
}];
[dataTask resume];
//resume excute dataTask

}

@end
 */
