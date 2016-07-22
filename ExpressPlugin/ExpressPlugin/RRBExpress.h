/*****************************************
 *作者: 丁业林
 *日期: 2016-06-30
 *描述: 快递相关操作
 ******************************************/
#import <Foundation/Foundation.h>
#import "RRBExpressCompanyCode.h"
#import "RRBExpressOrder.h"

@interface RRBExpress : NSObject

/**
 *  查询快递历程
 *
 *  @param code 快递公司编码,参见RRBExpressCompanyCode.h定义
 *  @param number 快递单号
 *  @param resultBlock 回调处理
 *
 */
+ (void)queryByExpressCompanyCode:(NSString *)code
                    expressNumber:(NSString *)number
                           result:(void(^)(NSError *resultError,RRBExpressOrder *expressOrder))resultBlock;

@end
