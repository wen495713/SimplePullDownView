//
//  MainViewController.m
//  PullCurtain
//
//  Created by 慢吞吞 on 12-8-14.
//  Copyright (c) 2012年 慢吞吞. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)pullcurtainCustomerButton:(UIButton *)button
                      buttonIndex:(NSInteger)index{
    NSInteger c = index%3;
    switch (c) {
        case 0:
            button.backgroundColor = [UIColor yellowColor];
            break;
        case 1:
            button.backgroundColor = [UIColor redColor];
            break;
        case 2:
            button.backgroundColor = [UIColor greenColor];
            break;
    }
}

- (void)pullcurtainButtonDidPressAt:(NSInteger)index{
    NSLog(@"you press button %d",index);
}

- (void)pullflagSetting:(UIView *)flag{
    flag.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PullCurtainView *pview = [[PullCurtainView alloc] initWithFrame:CGRectZero];
    pview.buttonSize = CGSizeMake(60, 60);
    pview.buttonNum = 20;
    pview.delegate = self;
    [self.view addSubview:pview];
    [pview release];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
