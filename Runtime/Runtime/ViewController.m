//
//  ViewController.m
//  Runtime
//
//  Created by NapoleonYoung on 16/9/9.
//  Copyright © 2016年 DoubleWood. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import <objc/runtime.h>

#import "Car+Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self changeVariable];
    [self addAMethod];
    [self addExtentProperty];
    [self exchangeMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeVariable {
    Car *myLancrusier = [[Car alloc] init];
    myLancrusier.name = @"陆地巡洋舰";
    NSLog(@"我的车：%@", myLancrusier.name);
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList([myLancrusier class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        const  char *varName = ivar_getName(ivar);
        NSString *ivarNameString = [NSString stringWithCString:varName encoding:NSUTF8StringEncoding];
        if ([ivarNameString isEqualToString:@"_name"]) {
            object_setIvar(myLancrusier, ivar, @"路上苍龙");
            break;
        }
    }
    NSLog(@"我的车：%@", myLancrusier.name);
}

void happyNewCar (id self, SEL _cmd) {
    NSLog(@"我新买了一辆丰田陆地巡洋舰最新款");
}

- (void)addAMethod {
    Car *myCar = [Car new];
    myCar.name = @"陆地巡洋舰新款";
    
    class_addMethod([myCar class], @selector(newMyCar), (IMP)happyNewCar, "v@:");
    [myCar performSelector:@selector(newMyCar)];
}

- (void)addExtentProperty {
    Car *myCar = [Car new];
    myCar.color = @"red";
    NSLog(@"myCar添加的颜色为%@", myCar.color);
}

- (void)exchangeMethod {
    Car *myCar = [Car new];
    myCar.name = @"陆上苍龙";
    [myCar run];
    [myCar stop];
    
    NSLog(@"--------交换方法------------");
    Method m1 = class_getInstanceMethod([myCar class], @selector(run));
    Method m2 = class_getInstanceMethod([myCar class], @selector(stop));
    method_exchangeImplementations(m1, m2);
    [myCar run];
    [myCar stop];
}


@end
