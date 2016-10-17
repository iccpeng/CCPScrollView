//
//  ViewController.m
//  CCPScrollView
//
//  Created by C CP on 16/9/27.
//  Copyright © 2016年 C CP. All rights reserved.
//

#import "ViewController.h"
#import "CCPScrollView.h"
#import "CCPActionSheetView.h"
#import "UIView+CCPExtension.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];

    /**
     DEMO下载链接：https://github.com/IMCCP/CCPScrollView
     
     首先感谢您的 Star，如果在使用中您有任何问题，可以在 github issue,我会尽自己能力给您答复。
     */
    
    CCPScrollView *ccpView = [[CCPScrollView alloc] initWithFrame:CGRectMake(65, 0, self.testView.frame.size.width - 80, self.testView.frame.size.height)];
    
    ccpView.titleArray = [NSArray arrayWithObjects:@"iPhone6s上线32G内存手机你怎么看？",@"今年双11您预算了几个月的工资？",@"高德与百度互掐，你更看好哪方？", nil];
    
    ccpView.titleFont = 18;
    
    ccpView.titleColor = [UIColor blackColor];
    
    ccpView.BGColor = [UIColor grayColor];
    
    ccpView.isCanScroll = YES;
    
    [ccpView clickTitleLabel:^(NSInteger index,NSString *titleString) {
        
        NSLog(@"%ld-----%@",index,titleString);
        
        //自定义的弹出view
        UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 15 * 2, 250)];
        
        alertView.backgroundColor = [UIColor whiteColor];
        
        alertView.layer.cornerRadius = 8;
        
        alertView.layer.masksToBounds = YES;
        
        UILabel *alertLabel = [[UILabel alloc] init];
        
        alertLabel.backgroundColor = [UIColor redColor];
        
        alertLabel.textAlignment = NSTextAlignmentCenter;
        
        alertLabel.text = titleString;
        
        alertLabel.font = [UIFont systemFontOfSize:20];
        
        alertLabel.numberOfLines = 0;
        
        [alertLabel sizeToFit];
        
        alertLabel.width =  [UIScreen mainScreen].bounds.size.width - 15 * 2;
         alertLabel.centerX = alertView.centerX;
        alertLabel.centerY = alertView.centerY;
//        alertView.center = alertView.center;
       
        [alertView addSubview:alertLabel];
        
        CCPActionSheetView *actionSheetView = [[CCPActionSheetView alloc] initWithAlertView:alertView];
        
         actionSheetView.viewAnimateStyle = ViewAnimateScale;

    }];
    
    [self.testView addSubview:ccpView];
}

@end
