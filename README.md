# CCPScrollView

#### 文字无限轮播,适用于广播消息的上下无限轮播展示。

#### 首先感谢您的 Star，如果在使用中您有任何问题，可以在 github issue,我会尽自己能力给您答复。

### DEMO GIF：

![Image text](http://upload-images.jianshu.io/upload_images/1764698-5824042391011fb4.gif?imageMogr2/auto-orient/strip)

### DEMO 描述：
```
通过使用 UILabel 与 UIScrollView 来实现轮播效果。

实现的思路：如果需要展示5条数据，就在ScrollView上创建6个label,使得数据的显示顺序为5-1-2-3-4-5。首次显示1的位置，然后滑动，等滑动到最后一个

label即数据为5时，无动画（一定是无动画效果）切换到第一个label的位置也就是第一个数据为5的位置，就可以实现文字的无限轮播滚动了。详细的实现过程可以查

看DEMO。
```
### DEMO方法介绍：
```
/**
 *  文字数组
 */
@property (nonatomic,strong) NSArray *titleArray;
```
```
/**
 *  拼接后的文字数组
 */
@property (nonatomic,strong) NSMutableArray *titleNewArray;
```
```
/**
 *  是否可以拖拽
 */
@property (nonatomic,assign) BOOL isCanScroll;
```
```
/**
 *  block回调
 */
@property (nonatomic,copy)void(^clickLabelBlock)(NSInteger index,NSString *titleString);
```
```
/**
 *  字体颜色
 */
@property (nonatomic,strong) UIColor *titleColor;
```
```
/**
 *  背景颜色
 */
@property (nonatomic,strong) UIColor *BGColor;
```
```
/**
 *  字体大小
 */
@property (nonatomic,assign) CGFloat titleFont;
```
```
/**
 *  关闭定时器
 */
- (void)removeTimer;
```
```
/**
 *  添加定时器
 */
- (void)addTimer;
```
```
/**
 *  label的点击事件
 */

- (void) clickTitleLabel:(clickLabelBlock) clickLabelBlock;
```

### DEMO 使用示例

```
- (void)viewDidLoad {
    [super viewDidLoad];

    CCPScrollView *ccpView = [[CCPScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 44)];
    
    ccpView.titleArray = [NSArray arrayWithObjects:@"IMCCP",@"a iOS developer",@"GitHub:https://github.com/IMCCP", nil];
    
    ccpView.titleFont = 25;
    
    ccpView.titleColor = [UIColor greenColor];
    
    ccpView.BGColor = [UIColor purpleColor];
    
    [ccpView clickTitleLabel:^(NSInteger index,NSString *titleString) {
        
     NSLog(@"%ld---%@",index,titleString);

    }];
    
    [self.view addSubview:ccpView];
}
```
