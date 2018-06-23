//
//  XWZServer.h
//  ProjectTwo
//
//  Created by XinWeizhou on 2018/6/23.
//  Copyright © 2018年 BeijingSuperbPetroleumTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWZServer : NSObject

/**
 车辆质量(单位kg)
 */
@property(nonatomic,assign,readonly) double mass;

/**
 踏板力度，取值范围（0-50），默认为0
 */
@property(nonatomic,assign) NSInteger padel;

/**
 现有速度
 */
@property(nonatomic,assign,readonly) double speeds;


/**
 现有阻力
 */
@property(nonatomic,assign,readonly) double reveF;

/**
 现有油门值
 */
@property(nonatomic,assign,readonly) double acceleratorValue;


- (instancetype)initWithMass:(double)mass;

- (void)start;
- (void)stop;
@end
