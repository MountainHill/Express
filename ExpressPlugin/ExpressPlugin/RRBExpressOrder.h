//
//  RRBExpressOrder.h
//  ExpressPlugin
//
//  Created by dingyl on 16/7/22.
//  Copyright © 2016年 丁业林. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RRBExpressTrace;

@interface RRBExpressOrder : NSObject

- (instancetype) initWithDictionary:(NSDictionary *)dict;

/* 订单编号 */
@property (copy, nonatomic) NSString *orderCode;

/* 快递公司编码 */
@property (copy, nonatomic) NSString *shipperCode;

/* 物流运单号 */
@property (copy, nonatomic) NSString *logisticCode;

/* 成功与否 */
@property (nonatomic) BOOL success;

/* 失败原因 */
@property (copy, nonatomic) NSString *reason;

/* 物流状态：2-在途中,3-签收,4-问题件 */
@property (copy, nonatomic) NSString *state;

/* 轨迹集 */
@property (copy, nonatomic) NSArray<__kindof RRBExpressTrace*> *traces;

@end

@interface RRBExpressTrace : NSObject

- (instancetype) initWithDictionary:(NSDictionary *)dict;

/* 时间 */
@property (copy, nonatomic) NSString *acceptTime;

/* 描述 */
@property (copy, nonatomic) NSString *acceptStation;

/* 备注,可nil */
@property (copy, nonatomic) NSString *remark;

@end
