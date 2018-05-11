// production
/**字体设置**/
#define FONT_FAMILY @"Heiti TC"
#define FONTSIZE11  11
#define FONTSIZE12  12
#define FONTSIZE13  12
#define FONTSIZE14  14
#define FONTSIZE15  15
#define FONTSIZE16  16
#define FONTSIZE20  20



#define LOGONAME @"logo_"

/**网路异常**/
#define ERR_NETWORK @"您的网络不给力，请检查网络"
#define ERROR_CONNECTION @"连接服务器失败"

//检测网络地址
#define REACHABILITY_SERVERURL @"www.baidu.com"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//UIlabel对齐方式
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
#define MBLabelAlignmentCenter NSTextAlignmentCenter
#define MBLabelAlignmentLeft NSTextAlignmentLeft
#define MBLabelAlignmentRight NSTextAlignmentRight
#else
#define MBLabelAlignmentCenter UITextAlignmentCenter
#define MBLabelAlignmentLeft  UITextAlignmentLeft
#define MBLabelAlignmentRight UITextAlignmentRight
#endif




