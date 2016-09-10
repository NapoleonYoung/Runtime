//
//  Car.m
//  Runtime
//
//  Created by NapoleonYoung on 16/9/9.
//  Copyright © 2016年 DoubleWood. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)run {
    NSLog(@"%@跑", self.name);
}

- (void)stop {
    NSLog(@"%@停车", self.name);
}

@end
