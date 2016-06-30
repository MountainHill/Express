//
//  RRBExpress.m
//  CBClient
//
//  Created by dingyl on 16/6/30.
//  Copyright © 2016年 Nanjing Renrenbao Network Technology Co.,Ltd. All rights reserved.
//

#import "RRBExpress.h"
#import "NSString+MD5.h"

@implementation RRBExpress

+ (void)queryExpressList:(NSString *)shipper orderCode:(NSString *)orderCode {
    /* 使用快递鸟的快递查询服务 */
    static NSString const *EBusinessID = @"1260138";
    static NSString const *EBusinessKEY = @"1ab6add2-d52a-4357-b300-ee9e5baf951e";
    NSString *url = @"http://api.kdniao.cc/Ebusiness/EbusinessOrderHandle.aspx";
    
    NSString *json = [NSString stringWithFormat:@"{'OrderCode':'','ShipperCode':'YTO','LogisticCode':'%@'}",orderCode];
    
    NSString *utf8Json = [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    
    NSString *encryptStr = [NSString stringWithFormat:@"%@%@",json,EBusinessKEY];
    NSString *md5 = [encryptStr generateMD5:encryptStr].lowercaseString;
    NSString *base64Str = [[md5 dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:kNilOptions];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    NSString *bodyStr = [NSString stringWithFormat:@"RequestData=%@&EBusinessID=%@&RequestType=1002&DataSign=%@&DataType=2",utf8Json,EBusinessID,base64Str];
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    [task resume];
}

@end
