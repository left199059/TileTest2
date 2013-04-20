//
//  MenuViewController.m
//  test
//
//  Created by left199059 on 4/20/13.
//  Copyright (c) 2013 Zhan Cao. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   // [self.view setAlpha:0.8f];
    
    [self.btnCancel addTarget:self
                       action:@selector(btnCancel_Clicked:)
             forControlEvents:UIControlEventTouchUpInside ];
 
    
    
    
}

-(void) btnCancel_Clicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
