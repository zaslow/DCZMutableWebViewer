//
//  DetailViewController.m
//  DCZMutableWebViewer
//
//  Created by Zaslow, Dean Clayton on 4/21/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZURLViewController.h"
#import "DCZWebPage.h"

@interface DCZURLViewController ()

@end

@implementation DCZURLViewController

#pragma mark - Managing the detail item

- (void)configureView {
    
    // Set the name & url of the webpage to load
    [_webPage setPageName: @"Google"];
    [_webPage setUrl: @"http://www.google.com"];
    
    // Initiate a connection to the webpage
    NSURL *URL = [NSURL URLWithString:_webPage.url];
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:URL];
    [_webView loadRequest:urlReq];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
