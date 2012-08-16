//
//  PullFlag.m
//  PullCurtain
//
//  Created by 慢吞吞 on 12-8-15.
//  Copyright (c) 2012年 慢吞吞. All rights reserved.
//

#import "PullFlag.h"

@implementation PullFlag

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"touch Began");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    for (UITouch *touch in touches) {
//        CGPoint l = [touch locationInView:self.superview];
//        CGPoint pl = [touch previousLocationInView:self.superview];
//        CGFloat yoffset =  l.y - pl.y;
//        CGPoint pc = self.center;
//        pc.y +=yoffset;
//        if (pc.y <self.superview.bounds.size.height) {
//            self.center = pc;
//        }
//        if ([self.delegate respondsToSelector:@selector(pullFlagMoveOffset:YOffset:flag:)]) {
//            [self.delegate pullFlagMoveOffset:0.0f YOffset:yoffset flag:self];
//        }
//    }
    if ([self.delegate respondsToSelector:@selector(pullFlag:touchMoved:withEvent:)]) {
        [self.delegate pullFlag:self touchMoved:touches withEvent:event];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    NSLog(@"touch Cancelled");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    [super touchesEnded:touches withEvent:event];
//    NSLog(@"touch Ended");
    if ([self.delegate respondsToSelector:@selector(pullflag:touchEnd:withEvent:)]) {
        [self.delegate pullflag:self touchEnd:touches withEvent:event];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
