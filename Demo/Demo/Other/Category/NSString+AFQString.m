//
//  NSString+AFQString.m
//  anfuquan
//
//  Created by lq on 2017/1/18.
//  Copyright © 2017年 jingfang. All rights reserved.
//

#import "NSString+AFQString.h"

@implementation NSString (AFQString)

+ (NSString *)stringWithbbb:(NSString *)str {
    
//    2017-02-17 23:59:59
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date = [fmt dateFromString:str];
    
    
    fmt.dateFormat = @"yyyy-MM-dd";

    
    return [fmt stringFromDate:date];
}


- (unsigned long long)fileSize {
    
    // 获得文件夹的大小 == 文件夹中所有文件的总大小
    
    // 总大小
    unsigned long long size = 0;
    
    // 文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 文件属性
    NSDictionary *attrs = [mgr attributesOfItemAtPath:self error:nil];
    
    if ([attrs.fileType isEqualToString:NSFileTypeDirectory]) {// 文件夹
        //Enumerator: 遍历器／迭代器
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        
        // 遍历
        for (NSString *subpath in enumerator) {
            
            // 全路径
            NSString *fullPath = [self stringByAppendingPathComponent:subpath];
            
            size += [mgr attributesOfItemAtPath:fullPath error:nil].fileSize;
        }
        
    } else {// 文件
        size = attrs.fileSize;
    }
    
    return size;
}



@end
