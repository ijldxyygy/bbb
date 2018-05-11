//
//  YQNSLog.h
//  yslf
//
//  Created by Arvin on 16/11/1.
//  Copyright © 2016年 yiqing. All rights reserved.
//

#ifndef YQNSLog_h
#define YQNSLog_h

#import <Foundation/Foundation.h>
#import <asl.h>

#ifdef DEBUG
    #define YQLog(...) NSLog(__VA_ARGS__)
    #define THIS_FILE [(@"" __FILE__) lastPathComponent]
    #define NSLog(fmt,...) _NSLog((@"%@:第 %d 行 %s " fmt), THIS_FILE, __LINE__, __FUNCTION__, ##__VA_ARGS__)
#else
    #define YQLog(...)
    #define NSLog(fmt,...)
#endif

#define _NSLog(fmt,...) {                                               \
    do {                                                                \
        NSString *str = [NSString stringWithFormat:fmt, ##__VA_ARGS__]; \
        printf("%s\n",[str UTF8String]);                                \
        asl_log(NULL, NULL, ASL_LEVEL_NOTICE, "%s", [str UTF8String]);  \
    } while(0);                                                         \
}

#endif /* YQNSLog_h */
