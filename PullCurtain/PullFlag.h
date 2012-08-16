//
//  PullFlag.h
//  PullCurtain
//
//  Created by 慢吞吞 on 12-8-15.
//  Copyright (c) 2012年 慢吞吞. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PullFlagDelegate;
@interface PullFlag : UIView{
    
}
@property (nonatomic, assign) id<PullFlagDelegate>delegate;
@end

@protocol PullFlagDelegate <NSObject>
@optional
//- (void)pullFlagMoveOffset:(CGFloat)x YOffset:(CGFloat)y flag:(PullFlag *)flag;
- (void)pullFlag:(PullFlag *)flag touchMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)pullflag:(PullFlag *)flag touchEnd:(NSSet *)touches withEvent:(UIEvent *)event;
@end