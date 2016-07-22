/*
 {
 "EBusinessID": "1260138",
 "ShipperCode": "YTO",
 "Success": true,
 "LogisticCode": "807138721139",
 "State": "3",
 "Traces": [{
 "AcceptTime": "2016-06-28 19:29:26",
 "AcceptStation": "xxx"
 }, {
 "AcceptTime": "2016-06-28 22:30:24",
 "AcceptStation": "xxx"
 }, {
 "AcceptTime": "2016-06-29 00:45:50",
 "AcceptStation": "xxx"
 }, {
 "AcceptTime": "2016-06-29 02:46:47",
 "AcceptStation": "xxx"
 }, {
 "AcceptTime": "2016-06-30 04:05:16",
 "AcceptStation": "xxx"
 }, {
 "AcceptTime": "2016-07-01 07:28:37",
 "AcceptStation": "xxx"
 }, {
 "AcceptTime": "2016-07-01 07:28:52",
 "AcceptStation": "xxx"
 }, {
 "AcceptTime": "2016-07-01 08:55:53",
 "AcceptStation": "xxx"
 }, {
 "AcceptTime": "2016-07-01 12:32:50",
 "AcceptStation": "xxx"
 }]
 }
 */

#import "RRBExpress.h"
#import <CommonCrypto/CommonDigest.h>

@interface RRBExpress ()

+ (instancetype)shareInstance;

@property (strong, nonatomic) NSURLSession *session;

@end

@implementation RRBExpress

+ (instancetype)shareInstance {
    static RRBExpress *_express;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _express = [[RRBExpress alloc] init];
    });
    return _express;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

+ (NSString *)generateMD5:(NSString *)string{
    const char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5( cStr, strlen(cStr), result );
    
    return [NSString
            stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1],
            result[2], result[3],
            result[4], result[5],
            result[6], result[7],
            result[8], result[9],
            result[10], result[11],
            result[12], result[13],
            result[14], result[15]
            ];
}

+ (void)queryByExpressCompanyCode:(NSString *)code expressNumber:(NSString *)number result:(void(^)(NSError *resultError,RRBExpressOrder *expressOrder))resultBlock{
    /* 使用快递鸟的快递查询服务 */
    static NSString const *EBusinessID = @"1260138";
    static NSString const *EBusinessKEY = @"1ab6add2-d52a-4357-b300-ee9e5baf951e";
    NSString *url = @"http://api.kdniao.cc/Ebusiness/EbusinessOrderHandle.aspx";
    
    NSString *json = [NSString stringWithFormat:@"{'OrderCode':'','ShipperCode':'%@','LogisticCode':'%@'}",code,number];
    
    NSString *utf8Json = [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    
    NSString *encryptStr = [NSString stringWithFormat:@"%@%@",json,EBusinessKEY];
    NSString *md5 = [self generateMD5:encryptStr].lowercaseString;
    NSString *base64Str = [[md5 dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:kNilOptions];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    NSString *bodyStr = [NSString stringWithFormat:@"RequestData=%@&EBusinessID=%@&RequestType=1002&DataSign=%@&DataType=2",utf8Json,EBusinessID,base64Str];
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *task = [[RRBExpress shareInstance].session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        RRBExpressOrder *order = nil;
        if (!error) {
            id obj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            if (!error && [obj isKindOfClass:[NSDictionary class]]) {
                order = [[RRBExpressOrder alloc] initWithDictionary:(NSDictionary *)obj];
            }
        }
        if (resultBlock) {
            resultBlock(error, order);
        }
    }];
    [task resume];
}

@end
