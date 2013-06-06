//
//  ViewController.m
//  WSD
//
//  Created by Peter Grutter on 6/6/13.
//  Copyright (c) 2013 A. All rights reserved.
//

#import "ViewController.h"
#import "WebsiteDownloader.h"

@interface ViewController ()

@property (nonatomic, strong) WebsiteDownloader *wsd;

@end

@implementation ViewController
@synthesize wsd;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    wsd = [[WebsiteDownloader alloc] init];
    [wsd downloadWebsite:@"http://www.tagesanzeiger.ch"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(text)
                                                 name:@"finishedDownloading"
                                               object:nil];
}

- (void)text
{
        NSLog(@"%@", [wsd data]);
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
