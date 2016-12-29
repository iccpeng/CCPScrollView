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

#define CCPRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

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
     
     */
    
    CCPScrollView *ccpView = [[CCPScrollView alloc] initWithFrame:CGRectMake(65, 0, self.testView.frame.size.width - 80, self.testView.frame.size.height)];
    
    ccpView.titleArray = [NSArray arrayWithObjects:@"iPhone6s上线32G内存手机你怎么看？",@"亲爱的朋友们2016年还有100天就要过去了,2017年您准备好了吗?",@"今年双11您预算了几个月的工资？",@"高德与百度互掐，你更看好哪方？", nil];
    
    ccpView.titleFont = 18;
    
    ccpView.titleColor = [UIColor blackColor];
    
    ccpView.BGColor = CCPRGBColor(221, 221, 221);
    
    [ccpView clickTitleLabel:^(NSInteger index,NSString *titleString) {
        
        NSLog(@"%ld-----%@",index,titleString);
        
        //自定义的弹出view
        UIView *alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 15 * 2, 250)];
        
        alertView.backgroundColor = [UIColor whiteColor];
        
        alertView.layer.cornerRadius = 8;
        
        alertView.layer.masksToBounds = YES;
        
        UILabel *alertLabel = [[UILabel alloc] init];
        
        alertLabel.textAlignment = NSTextAlignmentCenter;
        
        alertLabel.text = titleString;
        
        alertLabel.font = [UIFont systemFontOfSize:20];
        
        alertLabel.numberOfLines = 0;
        
        alertLabel.width =  [UIScreen mainScreen].bounds.size.width - 15 * 2;
        [alertLabel sizeToFit];
        alertLabel.centerX = alertView.centerX;
        alertLabel.centerY = alertView.centerY;
        [alertView addSubview:alertLabel];
        //弹出自定义弹窗
        CCPActionSheetView *actionSheetView = [[CCPActionSheetView alloc] initWithAlertView:alertView];
         actionSheetView.viewAnimateStyle = ViewAnimateScale;

    }];
    
    [self.testView addSubview:ccpView];
}

@end
