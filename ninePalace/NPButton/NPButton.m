//
//  NPButton.m
//  ninePalace
//
//  Created by QZmac on 12-4-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NPButton.h"

static struct NPSetting setting = {
    .columnCount = 3,
    .leftCapWidth = 5,
    .buttonHGap = 5,
    .buttonVGap = 5,
    
    .originX = 0,
    .originY = 0,
    .sizeWidth = 100,
    .sizeHeight = 100,
    
    .titleLabelHeight = 20
};

// 图文混排的按钮
@interface ITButton:UIButton
{
    
}
@end

@implementation ITButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, setting.sizeWidth, setting.sizeHeight - setting.titleLabelHeight);
    self.titleLabel.frame = CGRectMake(0, setting.sizeHeight - setting.titleLabelHeight, setting.sizeWidth, setting.titleLabelHeight);
}

@end


@implementation NPButton

+(void)setInfo:(const struct NPSetting)s
{
    setting = s;
}


+(UIButton *)buttonWithTitle:(NSString *)title normalImage:(UIImage *)nimage pressImage:(UIImage *)pimage tag:(NSInteger)tag
{
    UIButton* button = nil;
    if (nimage) {
        button = [ITButton buttonWithType:UIButtonTypeCustom];
        [button setImage:nimage forState:UIControlStateNormal];
        [button setImage:pimage forState:UIControlStateHighlighted];
        button.titleLabel.textAlignment = UITextAlignmentCenter;
    }
    else 
    {
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    }
        
    
    [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;
    // 计算rect
    
    float x = setting.originX + setting.leftCapWidth + (tag%setting.columnCount)*(setting.sizeWidth + setting.buttonHGap);
    float y = setting.originY + (tag/setting.columnCount)*(setting.sizeHeight + setting.buttonVGap);
    
    button.frame = CGRectMake(x, y, setting.sizeWidth, setting.sizeHeight);
    
    return button;
}
@end
