/*****************************************
 *作者: 丁业林
 *日期: 2016-06-30
 *描述: 快递相关操作
 ******************************************/
#import <Foundation/Foundation.h>

@interface RRBExpress : NSObject

/**
 *  查询快递历程
 *
 *  @param shipper 快递公司
 *  @param orderCode 快递单号
 *
 */
+ (void)queryExpressList:(NSString *)shipper
               orderCode:(NSString *)orderCode;

@end
