//
//  ServerNameInputPickerView.h
//  Union
//
//  Created by HarrisHan on 15/7/18.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ServerNameInputPickerViewDelegate <NSObject>

//选中的选择器的值

- (void)selectedPickerValue:(NSString *)value;

@end

@interface ServerNameInputPickerView : UIView

@property (nonatomic , assign ) id<ServerNameInputPickerViewDelegate> delegate;//代理对象

@end
