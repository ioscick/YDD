//
//  MessageView.m
//  YDD
//
//  Created by shenliping on 16/1/6.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "MessageView.h"

@implementation MessageView

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title
{
    if (self == [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor grayColor];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 200, 20)];
        self.messageLabel.text = title;
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.messageLabel];
        
        [self.layer masksToBounds];
        [self.layer setCornerRadius:5.0f];
        
        [UIView animateWithDuration:2 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
