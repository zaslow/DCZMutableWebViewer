//
//  DetailViewController.h
//  DCZMutableWebViewer
//
//  Created by Zaslow, Dean Clayton on 4/21/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCZWebPage.h"

@interface DCZURLViewController : UIViewController

@property (strong, nonatomic) DCZWebPage *webPage;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

