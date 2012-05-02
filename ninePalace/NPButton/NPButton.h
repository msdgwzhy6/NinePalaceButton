//
//  NPButton.h
//  ninePalace
//
//  Created by QZmac on 12-4-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

struct NPSetting
{
    // 每行按钮个数
    int columnCount;
    
    // 按钮间距
    float leftCapWidth;
    float buttonHGap; // 水平间距
    float buttonVGap; // 垂直间距
    
    // 初始位置 与 按钮 大小
    float originX;
    float originY;
    float sizeWidth;
    float sizeHeight;
    
    // 底部文本框高度
    float titleLabelHeight;
};

@interface NPButton : NSObject
{
    
}

+(void)setInfo:(const struct NPSetting)s;
// tag从0开始
+(UIButton*)buttonWithTitle:(NSString*)title normalImage:(UIImage*)nimage pressImage:(UIImage*)pimage tag:(NSInteger)tag;
@end
