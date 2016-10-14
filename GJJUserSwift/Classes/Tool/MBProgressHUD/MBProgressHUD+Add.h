//
//  MBProgressHUD+Add.h
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)
/**
 *  带图片
 *
 *  @param error 错误描述
 *  @param view  展示的图层
 */
- (void)showError:(NSString *)error toView:(UIView *)view;
/**
 *  带图片
 *
 *  @param success 正确描述
 *  @param view    展示的图层
 */
- (void)showSuccess:(NSString *)success toView:(UIView *)view;

- (void)showMessag:(NSString *)message;

- (void)showMessag:(NSString *)message toView:(UIView *)view;
@end
