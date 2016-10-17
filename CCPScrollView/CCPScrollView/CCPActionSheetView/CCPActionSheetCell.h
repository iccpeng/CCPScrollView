//
//  CCPActionSheetCell.h
//  CCPActionSheetDemo
//
//  Created by C CP on 16/7/22.
//  Copyright © 2016年 C CP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCPActionSheetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toTopCconstraint;

@end
