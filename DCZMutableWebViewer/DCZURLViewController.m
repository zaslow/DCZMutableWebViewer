//
//  DetailViewController.m
//  DCZMutableWebViewer
//
//  Created by Zaslow, Dean Clayton on 4/21/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import "DCZURLViewController.h"

@interface DCZURLViewController ()

@end

@implementation DCZURLViewController

#pragma mark - Managing the detail item

- (void)setWebPage:(id)newWebPage {
    if (_webPage != newWebPage) {
        _webPage = newWebPage;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.webPage) {
        self.webPageLabel.text = [self.webPage description];
    }
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
