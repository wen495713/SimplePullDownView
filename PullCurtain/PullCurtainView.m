//
//  PullCurtainView.m
//  PullCurtain
//
//  Created by 慢吞吞 on 12-8-15.
//  Copyright (c) 2012年 慢吞吞. All rights reserved.
//

#import "PullCurtainView.h"
#import <QuartzCore/QuartzCore.h>
#define DefaultLocationX 160
#define DefaultLocationY -130

#define OpenLocationY 115
#define GapWidth(num,width) ((280-(num*width))/(num-1))
@implementation PullCurtainView

@synthesize buttonNum,buttonSize,delegate;

- (NSInteger)numRowCount:(NSInteger)numCols{
    CGFloat fnumRow = (float)buttonNum/(float)numCols;
    NSInteger inumRow = buttonNum/numCols;
    if (fnumRow-(float)inumRow>0) {
        return inumRow+1;
    }else{
        return inumRow;
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 260)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 2.0f;
    }
    return self;
}

- (void)moveToDefaultLocation{
    [UIView transitionWithView:self duration:0.2 options:UIViewAnimationCurveEaseOut animations:^{
        self.center = CGPointMake(DefaultLocationX, DefaultLocationY);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)pullToOpenLocation{
    [UIView transitionWithView:self duration:0.2 options:UIViewAnimationCurveEaseOut animations:^{
        self.center = CGPointMake(DefaultLocationX, OpenLocationY);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)buttonPress:(UIButton *)sender{
    if ([delegate respondsToSelector:@selector(pullcurtainButtonDidPressAt:)]) {
        [delegate pullcurtainButtonDidPressAt:[buttons indexOfObject:sender]];
    }
}

- (void)pullflag:(PullFlag *)flag touchEnd:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self.center.y>-50) {
        if(self.center.y > 115){
            [self moveToDefaultLocation];
        }else{
            [self pullToOpenLocation];
        }
    }else{
        [self moveToDefaultLocation];
    }
}

- (void)pullFlag:(PullFlag *)flag touchMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches) {
        CGPoint l = [touch locationInView:self];
        CGPoint pl = [touch previousLocationInView:self];
        CGFloat yoffset =  l.y - pl.y;
        CGPoint pcenter = self.center;
        pcenter.y += yoffset;
        if (pcenter.y<145) {
            self.center = pcenter;
        }
    }
}

- (void)drawRect:(CGRect)rect
{
    
    
    self.frame = CGRectMake(0, -50, 320, 300);
    
    NSInteger numCols = 280/(int)buttonSize.width;
    
    NSInteger numRow = [self numRowCount:numCols];
    
    CGFloat gapwidth = (float)GapWidth(numCols, buttonSize.width);
    
    CGFloat contentHeight = 40+numRow*buttonSize.height+(numRow-1)*gapwidth;
    
    contentHeight = contentHeight>230?contentHeight:230;
    
    CGRect scRect = CGRectMake(0, 50, 320, 230);
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:scRect];
    scrollview.userInteractionEnabled = YES;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.showsVerticalScrollIndicator = NO;
    scrollview.backgroundColor = [UIColor whiteColor];
    scrollview.contentSize = CGSizeMake(320, contentHeight);
    [self addSubview:scrollview];
    
    rollView = scrollview;
    
    buttons = [[NSMutableArray alloc] init];
    for (int i = 0; i<buttonNum; i++) {
        CGRect btnRect = CGRectZero;
        btnRect.size = buttonSize;
        
        NSInteger rowIndex = i/numCols;
        NSInteger colsIndex = i%numCols;
        
        btnRect.origin.x = 20+colsIndex*(buttonSize.width+gapwidth);
        btnRect.origin.y = contentHeight - 20 - (rowIndex + 1)*buttonSize.height - 20*rowIndex;
        
        UIButton *btn = [[UIButton alloc] initWithFrame:btnRect];
        [btn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        if ([self.delegate respondsToSelector:@selector(pullcurtainCustomerButton:buttonIndex:)]) {
            [delegate pullcurtainCustomerButton:btn buttonIndex:i];
        }
        [rollView addSubview:btn];
        [btn release];
        [buttons addObject:btn];
        [btn release];
    }
    
    [rollView setContentOffset:CGPointMake(0, rollView.contentSize.height - rollView.frame.size.height)];
    
    PullFlag *flag = [[PullFlag alloc] initWithFrame:CGRectMake(0, 280, 30, 30)];
    flag.delegate = self;
    if ([self.delegate respondsToSelector:@selector(pullflagSetting:)]) {
        [self.delegate pullflagSetting:flag];
    }
    
    [self addSubview:flag];
    [flag release];
}


@end
