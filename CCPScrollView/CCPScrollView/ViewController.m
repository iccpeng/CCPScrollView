//
//  ViewController.m
//  CCPScrollView
//
//  Created by C CP on 16/9/27.
//  Copyright © 2016年 C CP. All rights reserved.
//

#import "ViewController.h"
#import "CCPScrollView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];

    CCPScrollView *ccpView = [[CCPScrollView alloc] initWithFrame:CGRectMake(0, 0, self.testView.frame.size.width, self.testView.frame.size.height)];
    
    ccpView.titleArray = [NSArray arrayWithObjects:@"IMCCP",@"a iOS developer",@"GitHub:https://github.com/IMCCP", nil];
    
    ccpView.titleFont = 25;
    
    ccpView.titleColor = [UIColor greenColor];
    
    ccpView.BGColor = [UIColor purpleColor];
    
    
    [ccpView clickTitleLabel:^(NSInteger index) {
        
        self.showLabel.text = [NSString stringWithFormat:@"您点击了第%ld个Label",index - 100];
        
    }];
    
    [self.testView addSubview:ccpView];
}

@end
