//
//  CCPScrollView.m
//  lunbo
//
//  Created by CCP on 16/9/27.
//  Copyright © 2016年 CCP. All rights reserved.
//

#import "CCPScrollView.h"

@interface CCPScrollView ()<UIScrollViewDelegate>
/**
 *  滚动视图
 */
@property (nonatomic,strong) UIScrollView *ccpScrollView;
/**
 *  label的宽度
 */
@property (nonatomic,assign) CGFloat labelW;
/**
 *  label的高度
 */
@property (nonatomic,assign) CGFloat labelH;
/**
 *  定时器
 */
@property (nonatomic,strong) NSTimer *timer;
/**
 *  记录滚动的页码
 */
@property (nonatomic,assign) int page;

@end

@implementation CCPScrollView

- (UIScrollView *)ccpScrollView {
    
    if (_ccpScrollView == nil) {
        
        _ccpScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _ccpScrollView.showsHorizontalScrollIndicator = NO;
        _ccpScrollView.showsVerticalScrollIndicator = NO;
        _ccpScrollView.scrollEnabled = NO;
        [self addSubview:_ccpScrollView];
        
        [_ccpScrollView setContentOffset:CGPointMake(0 , self.labelH) animated:YES];
    }
    
    return _ccpScrollView;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.labelW = frame.size.width;
        
        self.labelH = frame.size.height;
        
        self.ccpScrollView.delegate = self;
        
        [self addTimer];
        
    }
    
    return self;
}

//重写set方法 创建对应的label
- (void)setTitleArray:(NSArray *)titleArray {
    
    _titleArray = titleArray;
    
    if (titleArray == nil) {
        [self removeTimer];
        return;
    }
    
    if (titleArray.count == 1) {
        [self removeTimer];
    }
    
    id lastObj = [titleArray lastObject];
    
    NSMutableArray *objArray = [[NSMutableArray alloc] init];
    
    [objArray addObject:lastObj];
    [objArray addObjectsFromArray:titleArray];
    
    self.titleNewArray = objArray;
    
    //CGFloat contentW = 0;
    CGFloat contentH = self.labelH *objArray.count;
    
    self.ccpScrollView.contentSize = CGSizeMake(0, contentH);
    
    CGFloat labelW = self.ccpScrollView.frame.size.width;
    self.labelW = labelW;
    CGFloat labelH = self.ccpScrollView.frame.size.height;
    self.labelH = labelH;
    CGFloat labelX = 0;
    
    //防止重复赋值数据叠加
    for (id label in self.ccpScrollView.subviews) {
        
        [label removeFromSuperview];
        
    }
    
    for (int i = 0; i < objArray.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        
        titleLabel.userInteractionEnabled = YES;
        
        titleLabel.tag = 100 + i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTheLabel:)];
        
        [titleLabel addGestureRecognizer:tap];
        
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        CGFloat labelY = i * labelH;
        
        titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
        titleLabel.text = objArray[i];
        
        [self.ccpScrollView addSubview:titleLabel];
    }
}

- (void)clickTheLabel:(UITapGestureRecognizer *)tap {
    
    if (self.clickLabelBlock) {
        
        self.clickLabelBlock(tap.view.tag);
        
    }
}

- (void) clickTitleLabel:(clickLabelBlock) clickLabelBlock {
    
    self.clickLabelBlock = clickLabelBlock;
    
}

- (void)setIsCanScroll:(BOOL)isCanScroll {
    
    if (isCanScroll) {
        
        self.ccpScrollView.scrollEnabled = YES;
        
    } else {
        
        self.ccpScrollView.scrollEnabled = NO;
        
    }
}

- (void)setTitleColor:(UIColor *)titleColor {
    
    _titleColor = titleColor;
    
    for (UILabel *label in self.ccpScrollView.subviews) {
        
        label.textColor = titleColor;
        
    }
}

- (void)setTitleFont:(CGFloat )titleFont {
    
    _titleFont = titleFont;
    
    for (UILabel *label in self.ccpScrollView.subviews) {
        
        label.font = [UIFont systemFontOfSize: titleFont];;
        
    }
    
}

- (void)setBGColor:(UIColor *)BGColor {
    
    _BGColor = BGColor;
    
    self.backgroundColor = BGColor;
    
}



- (void)nextLabel {
    self.page ++;
    
    if (self.page == self.titleNewArray.count) {
        
        [self.ccpScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        
        self.page = 1;
        
    }
    //  滚动scrollview
    CGFloat x = self.page  * self.ccpScrollView.frame.size.height;
    
    [self.ccpScrollView setContentOffset:CGPointMake(0, x) animated:YES];
    
}

// scrollview滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    self.page = scrollView.contentOffset.y / self.labelH;
    
}

// 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //开启定时器
    [self addTimer];
}

- (void)addTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextLabel) userInfo:nil repeats:YES];
}

- (void)removeTimer {
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)dealloc {
    
    [self.timer invalidate];
    self.timer = nil;
    
}

@end
