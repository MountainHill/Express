//
//  RRBExpressOrder.m
//  ExpressPlugin
//
//  Created by dingyl on 16/7/22.
//  Copyright © 2016年 丁业林. All rights reserved.
//

#import "RRBExpressOrder.h"

@implementation RRBExpressOrder

- (instancetype) initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _orderCode = dict[@"OrderCode"];
        _shipperCode = dict[@"ShipperCode"];
        _logisticCode = dict[@"LogisticCode"];
        _success = [dict[@"Success"] boolValue];
        _reason = dict[@"Reason"];
        _state = dict[@"State"];
        NSArray *traces = dict[@"Traces"];
        if (traces && traces.count) {
            traces = [traces reverseObjectEnumerator].allObjects;
            NSMutableArray *marray = [NSMutableArray arrayWithCapacity:traces.count];
            for (NSDictionary *dict0 in traces) {
                RRBExpressTrace *trace = [[RRBExpressTrace alloc] initWithDictionary:dict0];
                [marray addObject:trace];
            }
            _traces = [marray copy];
        }
    }
    return self;
}

@end

@implementation RRBExpressTrace

- (instancetype) initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _acceptTime = dict[@"AcceptTime"];
        _acceptStation = dict[@"AcceptStation"];
        _remark = dict[@"Remark"];
    }
    return self;
}

@end
