//
//  DetailViewController.h
//  DCZMutableWebViewer
//
//  Created by Zaslow, Dean Clayton on 4/21/15.
//  Copyright (c) 2015 Dean Zaslow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCZURLViewController : UIViewController

@property (strong, nonatomic) id webPage;
@property (weak, nonatomic) IBOutlet UILabel *webPageLabel;

@end

