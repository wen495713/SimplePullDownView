//
//  PullCurtainView.h
//  PullCurtain
//
//  Created by 慢吞吞 on 12-8-15.
//  Copyright (c) 2012年 慢吞吞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullFlag.h"
@protocol PullCurtainDelegate <NSObject>
@optional
- (void)pullcurtainButtonDidPressAt:(NSInteger)index;

- (void)pullcurtainCustomerButton:(UIButton *)button buttonIndex:(NSInteger)index;

- (void)pullflagSetting:(UIView *)flag;
@end

@interface PullCurtainView : UIView<PullFlagDelegate>{
    NSMutableArray *buttons;
    UIScrollView *rollView;
}
@property (nonatomic, assign) NSInteger buttonNum;
@property (nonatomic, assign) CGSize buttonSize;
@property (nonatomic, assign) id<PullCurtainDelegate>delegate;
@end
