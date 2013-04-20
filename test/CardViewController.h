//
//  CardViewController.h
//  test
//
//  Created by left199059 on 4/20/13.
//  Copyright (c) 2013 Zhan Cao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardViewController : UIViewController <UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnDone;
@property (weak, nonatomic) IBOutlet UILabel *lblWord;
@property (weak, nonatomic) IBOutlet UITextView *lblDetail;
@property (weak, nonatomic) IBOutlet UIButton *btnReveal;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnMenu;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segOptions;

@property  NSString* word;
@property  NSString* detail;


-(void) presentWord;

@end
