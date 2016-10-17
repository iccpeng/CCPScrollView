//
//  CCPActionSheetView.h
//  CCPActionSheetDemo
//
//  Created by C CP on 16/7/20.
//  Copyright © 2016年 C CP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^cellDidSelectBlock)(NSString *indexString,NSInteger index);

typedef void(^closeAlertviewBlock)();

//动画样式
typedef enum viewAnimateDirection {
    ViewAnimateFromTop,
    ViewAnimateFromLeft,
    ViewAnimateFromRight,
    ViewAnimateFromBottom,
    ViewAnimateScale,
    ViewAnimateNone
} viewAnimateStyle;


@interface CCPActionSheetView : UIView

@property (nonatomic,copy)void(^cellDidSelectBlock)(NSString *indexString,NSInteger index);

@property (nonatomic,copy)void(^closeAlertviewBlock)();

@property (nonatomic,assign) viewAnimateStyle viewAnimateStyle;

@property (nonatomic,assign) BOOL isBGClose;

- (instancetype)initWithActionSheetArray:(NSArray *)indexTextArray;

- (void)cellDidSelectBlock:(cellDidSelectBlock) cellDidSelectBlock;

- (instancetype) initWithAlertView:(UIView *)alertView;

- (void) closeAlertView:(closeAlertviewBlock) closeAlertviewBlock;


@end
