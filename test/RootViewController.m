//
//  ViewController.m
//  test
//
//  Created by left199059 on 4/20/13.
//  Copyright (c) 2013 Zhan Cao. All rights reserved.
//

#import "CardViewController.h"

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  
    if([[segue identifier] isEqualToString:@"goCard"])
    {
        CardViewController* target = [segue destinationViewController];
       
        
        target.detail = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi .";
        target.word = @"Body";

        NSLog(@"going to card");
        
 
    }
}

@end
