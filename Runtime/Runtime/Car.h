//
//  Car.h
//  Runtime
//
//  Created by NapoleonYoung on 16/9/9.
//  Copyright © 2016年 DoubleWood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, copy) NSString *name;

- (void)run;

- (void)stop;

@end
