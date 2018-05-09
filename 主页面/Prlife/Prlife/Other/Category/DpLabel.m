//
//  DpLabel.m
//  Prlife
//
//  Created by ijldxyygy on 15/11/5.
//  Copyright (c) 2015年 LinkXin. All rights reserved.
//

#import "DpLabel.h"

@implementation DpLabel
@synthesize verticalAlignment;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        verticalAlignment = VerticalAlignmentTop;
    }
    return self;
}

- (VerticalAlignment)verticalAlignment
{
    return verticalAlignment;
}

- (void)setVerticalAlignment:(VerticalAlignment)align
{
    verticalAlignment = align;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect rc = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (verticalAlignment) {
        case VerticalAlignmentTop:
            rc.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            rc.origin.y = bounds.origin.y + bounds.size.height - rc.size.height;
            break;
        default:
            rc.origin.y = bounds.origin.y + (bounds.size.height - rc.size.height)/2;
            break;
    }
    
    return rc;
}

- (void)drawTextInRect:(CGRect)rect
{
    CGRect rc = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:rc];
}

//调整文本中的行距的方法

/*使用方法
 *
 *text参数 ：文本内容
 *
 *height参数：行距
 *
 *name 参数：你使用的 UIlable 对象
 */
- (void) getlable_height :(NSString *) text uiheight:(NSInteger) height uilable:(UILabel*) name
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:height];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    name.attributedText = attributedString;
    
}

@end
