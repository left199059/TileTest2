//
//  CardViewController.m
//  test
//
//  Created by left199059 on 4/20/13.
//  Copyright (c) 2013 Zhan Cao. All rights reserved.
//

#import "CardViewController.h"
#import "WordListController.h"


@interface CardViewController ()

@end

@implementation CardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void) presentWord{
    self.lblDetail.text  = self.detail;
    self.lblDetail.alpha = 0.0f;
    self.lblWord.text = self.word;
    self.segOptions.alpha=0;
    self.btnReveal.alpha=1;
}

-(void) nextWord
{
    self.detail = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi .";
    self.word = @"Body2";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.btnDone.target = self;
    self.btnDone.action = @selector(btnDone_Clicked:);
    
    
    self.btnMenu.target = self;
    self.btnMenu.action = @selector(btnMenu_Clicked:);
    
    
    
    [self.btnReveal addTarget:self
                       action:@selector(btnReveal_Clicked:)
             forControlEvents:UIControlEventTouchUpInside ];


  
    self.segOptions.alpha=0;
    [self.segOptions addTarget:self action:@selector(segOptions_Clicked:) forControlEvents:UIControlEventValueChanged];
    
    
    [self presentWord];
    
}


-(void) segOptions_Clicked:(UISegmentedControl*)sender
{
    NSInteger index = sender.selectedSegmentIndex;
    NSLog(@"%i",index);
    
    [self nextWord];
    [self presentWord];
}

-(void) btnReveal_Clicked:(id)sender
{
    self.segOptions.alpha=1;
    self.btnReveal.alpha=0;

    
    [UIView beginAnimations:@"becomeTransparent" context:(__bridge void*)self.lblDetail];
    [UIView setAnimationDuration:0.5f];
    [self.lblDetail setAlpha:1];
    
    
    [UIView commitAnimations];
    

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString* title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"List"])
    {
        WordListController* listView  = [[WordListController alloc] init];
        [self.navigationController pushViewController:listView animated:YES];
    }
    else if([title isEqualToString:@"About"])
    {
        
    }
}


-(void) btnDone_Clicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void) btnMenu_Clicked:(id)sender
{
    
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"test"
                                                   message:@"msg"
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"List" ,@"About aefsad",nil];
    
    [alert show];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
