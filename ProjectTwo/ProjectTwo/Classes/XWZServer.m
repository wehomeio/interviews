//
//  XWZServer.m
//  ProjectTwo
//
//  Created by XinWeizhou on 2018/6/23.
//  Copyright © 2018年 BeijingSuperbPetroleumTechnology. All rights reserved.
//

// 可以自定义 加速度/踏板力度
#define kPA  0.8
// 可以自定义 阻力/车速比例
#define kVF  0.9

#import "XWZServer.h"

@interface XWZServer()
// 启动时间
@property(nonatomic,assign) NSTimeInterval time;
@end

@implementation XWZServer

- (instancetype)initWithMass:(double)mass {
    if (self = [super init]) {
        _mass = mass;
    }
    return self;
}
- (void)setPadel:(NSInteger)padel {
    _padel = padel;
    _acceleratorValue = padel * kPA;
    
    [self stop];
    [self start];
}



- (double)reverseF {
    return self.speeds * kVF;
}

- (double)speed {
    _speeds = _speeds + [self getAccessRate] * [self getSeconds];
    self.time = [[NSDate date] timeIntervalSince1970];
    return _speeds;
}

- (void)start {
    self.time = [[NSDate date] timeIntervalSince1970];
}

- (void)stop {
    _time = 0.0;
    _speeds = 0.0;
    _acceleratorValue = 0.0;
    _reveF = 0.0;
    _padel = 0.0;
}
// 获取运行时长
- (NSTimeInterval)getSeconds {
    return [[NSDate date] timeIntervalSince1970] - self.time;
}

// 获取加速度
- (double)getAccessRate {
    return (self.acceleratorValue - self.reveF)/self.mass;
}
@end
