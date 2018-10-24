//
//  WKWebViewController.h
//  Translator
//
//  Created by a on 23/10/18.
//  Copyright © 2018 TMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentViewController.h"
#import <WebKit/WebKit.h>

@interface WKWebViewController : ParentViewController

@property(strong,nonatomic) WKWebView *webView;
@property (strong, nonatomic) NSString *productURL;

@end
