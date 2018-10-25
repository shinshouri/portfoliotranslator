//
//  MainViewController.h
//  Translator
//
//  Created by a on 22/10/18.
//  Copyright © 2018 TMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "ParentViewController.h"

@interface MainViewController : ParentViewController <UITextViewDelegate, UITableViewDelegate, UITableViewDataSource, SKPaymentTransactionObserver, SKProductsRequestDelegate>

@end
