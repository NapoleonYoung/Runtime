//
//  Car+Category.m
//  Runtime
//
//  Created by NapoleonYoung on 16/9/10.
//  Copyright © 2016年 DoubleWood. All rights reserved.
//

#import "Car+Category.h"
#import <objc/runtime.h>

@implementation Car (Category)

const char c_color;

- (void)setColor:(NSString *)color {
    objc_setAssociatedObject(self, &c_color, color, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)color {
    return objc_getAssociatedObject(self, &c_color);
}

@end
