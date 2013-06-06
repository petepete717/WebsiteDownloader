//
//  WebsiteDownloader.m
//  Download
//
//  Created by Peter Grutter on 6/6/13.
//  Copyright (c) 2013 A. All rights reserved.
//

#import "WebsiteDownloader.h"

@implementation WebsiteDownloader

@synthesize articleData;


- (void)downloadWebsite:(NSString *)websiteName
{
    articleData = [[NSMutableData alloc] init];
    // Construct URL
    NSURL *websiteURL = [NSURL URLWithString:websiteName];
    NSURLRequest *request = [NSURLRequest requestWithURL:websiteURL];
    connection = [[NSURLConnection alloc] initWithRequest:request
                                                 delegate:self
                                         startImmediately:YES];
}

- (void)connection:(NSURLConnection *)conn didReceiveData:(NSData *)data
{
    [articleData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)conn
{
    NSLog(@"Finished Downloading");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"finishedDownloading" object:nil];
}

- (void)connection:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    connection = nil;
    articleData = nil;
    NSString *errorString = [NSString stringWithFormat:@"Fetch failed: %@", [error localizedDescription]];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Download Error"
                                                 message:errorString
                                                delegate:nil
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil, nil];
    [av show];
}

- (NSString *)data
{
    NSString *text = [[NSString alloc] initWithData:articleData
                                           encoding:NSUTF8StringEncoding];
    NSLog(@"This is the text: %@", text);
    
    return text;
}

@end
