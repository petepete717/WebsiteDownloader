//
//  WebsiteDownloader.h
//  Download
//
//  Created by Peter Grutter on 6/6/13.
//  Copyright (c) 2013 A. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebsiteDownloader : NSObject

{
    NSURLConnection *connection;
}

@property (nonatomic, strong) NSMutableData *articleData;

- (void)downloadWebsite:(NSString *)websiteName;
- (NSString *)data;


@end
