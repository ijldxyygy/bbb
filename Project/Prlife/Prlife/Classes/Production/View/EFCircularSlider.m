//
//  EFCircularSlider.m
//  Awake
//
//  Created by Eliot Fowler on 12/3/13.
//  Copyright (c) 2013 Eliot Fowler. All rights reserved.
//

#import "EFCircularSlider.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>

#define ToRad(deg) 		( (M_PI * (deg)) / 180.0 )
#define ToDeg(rad)		( (180.0 * (rad)) / M_PI )
#define SQR(x)			( (x) * (x) )
#define SHOWVALUE_WIDTH 80
#define SHOWVALUE_HEIGHT 40

@implementation EFCircularSlider {
    CGFloat radius;
    int angle;
    int fixedAngle;
    NSMutableDictionary* labelsWithPercents;
    NSArray* labelsEvenSpacing;
    
    float pointX;
    int testAngle;
    NSTimeInterval oldTime;
    float oldX;
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Defaults
        _maximumValue = 100.0f;
        _minimumValue = 0.0f;
        _currentValue = 0.0f;
        //线宽
        _lineWidth = 20 * SCREENRATE;
        //未读条的色
        _unfilledColor = [UIColor whiteColor];
        //已读的色
        _filledColor = [UIColor blueColor];
        _handleColor = _filledColor;
        _labelFont = [UIFont systemFontOfSize:10.0f];
        _snapToLabels = NO;
        _handleType = semiTransparentWhiteCircle;
        _labelColor = [UIColor redColor];
        
        angle = 0;
        oldX = 100;
        radius = (self.frame.size.width-30 * SCREENRATE - _lineWidth/2)/2;
        //圆的背景色
        self.backgroundColor = [UIColor whiteColor];
//        _showValue =[[UILabel alloc]initWithFrame:CGRectMake((frame.size.width-SHOWVALUE_WIDTH)/2, (frame.size.height-SHOWVALUE_HEIGHT)/2, SHOWVALUE_WIDTH, SHOWVALUE_HEIGHT)];
//        _showValue.backgroundColor = [UIColor blackColor];
//        UITapGestureRecognizer *tapRecognizerWeibo=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeValue)];
//         _showValue.userInteractionEnabled=YES;
//         [_showValue addGestureRecognizer:tapRecognizerWeibo];
//        _editValue  = [[UITextField alloc]initWithFrame:CGRectMake((frame.size.width-SHOWVALUE_WIDTH)/2, (frame.size.height-SHOWVALUE_HEIGHT)/2, SHOWVALUE_WIDTH, SHOWVALUE_HEIGHT)];
//        _editValue.hidden = YES;
//        _editValue.backgroundColor = [UIColor greenColor];
//        [self addSubview:_editValue];
//        [self addSubview:_showValue];
        
        
        
    }
    
    angle = 90;
    [self setNeedsDisplay];
    
    return self;
}

#pragma mark - drawing methods

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //Draw the unfilled circle
    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius, 0, M_PI *2, 0);
    [_unfilledColor setStroke];
    CGContextSetLineWidth(ctx, _lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    //Draw the circle
    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius+15 * SCREENRATE, 0, M_PI *2, 0);
    CGContextSetLineWidth(ctx, 1);
    [[UIColor grayColor] setStroke];
    CGContextSetLineCap(ctx, kCGLineCapButt);

    CGContextStrokePath(ctx);

    //Draw the filled circle
    if((_handleType == doubleCircleWithClosedCenter || _handleType == doubleCircleWithOpenCenter) && fixedAngle > 5) {
        CGContextAddArc(ctx, self.frame.size.width/2  , self.frame.size.height/2, radius, 3*M_PI/2, 3*M_PI/2-ToRad(angle+3), 0);
    } else {
        CGContextAddArc(ctx, self.frame.size.width/2  , self.frame.size.height/2, radius, 3*M_PI/2, 3*M_PI/2-ToRad(angle), 0);
    }
    [_filledColor setStroke];
    CGContextSetLineWidth(ctx, _lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    //Add the labels (if necessary)
    if(labelsEvenSpacing != nil) {
        [self drawLabels:ctx];
    }
    
    //The draggable part
    [self drawHandle:ctx];
}

-(void) drawHandle:(CGContextRef)ctx{
    CGContextSaveGState(ctx);
    CGPoint handleCenter =  [self pointFromAngle: angle];
    if(_handleType == semiTransparentWhiteCircle) {
//        [[UIColor colorWithWhite:1.0 alpha:0.7] set];
        [_handleColor set];
        CGContextFillEllipseInRect(ctx, CGRectMake(handleCenter.x, handleCenter.y, _lineWidth, _lineWidth));
    } else if(_handleType == semiTransparentBlackCircle) {
        [[UIColor colorWithWhite:0.0 alpha:0.7] set];
        [_handleColor set];
        CGContextFillEllipseInRect(ctx, CGRectMake(handleCenter.x, handleCenter.y, _lineWidth, _lineWidth));
    } else if(_handleType == doubleCircleWithClosedCenter) {
        [_handleColor set];
        CGContextAddArc(ctx, handleCenter.x + (_lineWidth)/2, handleCenter.y + (_lineWidth)/2, _lineWidth, 0, M_PI *2, 0);
        CGContextSetLineWidth(ctx, 7);
        CGContextSetLineCap(ctx, kCGLineCapButt);
        CGContextDrawPath(ctx, kCGPathStroke);
        CGContextFillEllipseInRect(ctx, CGRectMake(handleCenter.x, handleCenter.y, _lineWidth-1, _lineWidth-1));
    } else if(_handleType == doubleCircleWithOpenCenter) {
        [_handleColor set];
        CGContextAddArc(ctx, handleCenter.x + (_lineWidth)/2, handleCenter.y + (_lineWidth)/2, 8, 0, M_PI *2, 0);
        CGContextSetLineWidth(ctx, 4);
        CGContextSetLineCap(ctx, kCGLineCapButt);
        CGContextDrawPath(ctx, kCGPathStroke);
        
        CGContextAddArc(ctx, handleCenter.x + _lineWidth/2, handleCenter.y + _lineWidth/2, _lineWidth/2, 0, M_PI *2, 0);
        CGContextSetLineWidth(ctx, 2);
        CGContextSetLineCap(ctx, kCGLineCapButt);
        CGContextDrawPath(ctx, kCGPathStroke);
    } else if(_handleType == bigCircle) {
        [_handleColor set];
        CGContextFillEllipseInRect(ctx, CGRectMake(handleCenter.x-2.5, handleCenter.y-2.5, _lineWidth+5, _lineWidth+5));
    }
    
    CGContextRestoreGState(ctx);
}

-(void) drawLabels:(CGContextRef)ctx {
    if(labelsEvenSpacing == nil || [labelsEvenSpacing count] == 0) {
        return;
    } else {
        //富文本
        NSDictionary *attributes = @{ NSFontAttributeName: _labelFont,
                                      NSForegroundColorAttributeName: _labelColor};
        int distanceToMove = -15;
        
        for (int i=0; i<[labelsEvenSpacing count]; i++) {
            NSString* label = [labelsEvenSpacing objectAtIndex:[labelsEvenSpacing count] - i - 1];
            CGFloat percentageAlongCircle = i/(float)[labelsEvenSpacing count];
            CGFloat degreesForLabel = percentageAlongCircle * 360;
            CGPoint closestPointOnCircleToLabel = [self pointFromAngle:degreesForLabel];
            
            CGRect labelLocation = CGRectMake(closestPointOnCircleToLabel.x, closestPointOnCircleToLabel.y, [self widthOfString:label withFont:_labelFont], [self heightOfString:label withFont:_labelFont]);
//            CGRect labelLocation = CGRectMake(self.frame.size.width/2, self.frame.size.height/2, [self widthOfString:label withFont:_labelFont], [self heightOfString:label withFont:_labelFont]);

            CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
            float radiansTowardsCenter = ToRad(AngleFromNorth(centerPoint, closestPointOnCircleToLabel, NO));
            labelLocation.origin.x =  (labelLocation.origin.x + distanceToMove * cos(radiansTowardsCenter)) - labelLocation.size.width/4;
            labelLocation.origin.y = (labelLocation.origin.y + distanceToMove * sin(radiansTowardsCenter))- labelLocation.size.height/4;
            [label drawInRect:labelLocation withAttributes:attributes];
        }
    }
}

#pragma mark - UIControl functions

-(BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super beginTrackingWithTouch:touch withEvent:event];
    
    return YES;
}





-(BOOL) continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super continueTrackingWithTouch:touch withEvent:event];
    
//    if(event.type!=UIEventTypeMotion){
    
    
    CGPoint lastPoint = [touch locationInView:self];
//    float ff = fabs(oldX - lastPoint.x);
//    
//    if((testAngle>268&&testAngle<272)&&ff>1){
//    
////        oldX = lastPoint.x-1;
//        return NO;
//    
//    
//    }
//    
//    oldX = lastPoint.x;
    
    int g = (int)_currentValue;
//    if(g==99&&lastPoint.x>98){
//    
//        return NO;
//    
//    }
    
    
    

    
    
    CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    float spaceNum =  (centerPoint.x - lastPoint.x)*(centerPoint.x - lastPoint.x)+(centerPoint.y - lastPoint.y)*(centerPoint.y - lastPoint.y);
    float space = sqrt(spaceNum);
    int currentAngle = floor(AngleFromNorth(centerPoint, lastPoint, NO));
    testAngle = currentAngle;
//    if(space<80||space>100){
//        
//        return NO;
//        
//    }
//    
//    float rate = touch.timestamp-oldTime;
////     NSLog(@"rate==%f",rate);
//    oldTime = touch.timestamp;
//    
//    if(rate<0.02&&(testAngle>265&&testAngle<275)){
//        
//        return NO;
//        
//    }
//    NSLog(@"testAngle==%d",testAngle);
    
    if(g>75&&lastPoint.x>99.5){
        
        return NO;
        
    }
    
    if(g<30&&lastPoint.x<101){
        
        return NO;
        
    }
    
     NSLog(@"rate==%f",lastPoint.x);
    [self moveHandle:lastPoint];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
//        }

    return YES;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    [super endTrackingWithTouch:touch withEvent:event];
    if(_snapToLabels && labelsEvenSpacing != nil) {
        CGPoint bestGuessPoint;
        float minDist = 360;
        for (int i=0; i<[labelsEvenSpacing count]; i++) {
            CGFloat percentageAlongCircle = i/(float)[labelsEvenSpacing count];
            CGFloat degreesForLabel = percentageAlongCircle * 360;
            if(abs(fixedAngle - degreesForLabel) < minDist) {
                minDist = abs(fixedAngle - degreesForLabel);
                bestGuessPoint = [self pointFromAngle:degreesForLabel + 90 + 180];
            }
        }
        CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        angle = floor(AngleFromNorth(centerPoint, bestGuessPoint, NO));
        _currentValue = [self valueFromAngle];
        [self setNeedsDisplay];
    }
}

-(void)moveHandle:(CGPoint)point {
//    NSLog(@"%f",point.x);
    
    
    CGPoint centerPoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);

    float currentAngle = floor(AngleFromNorth(centerPoint, point, NO));
//    float currentAngle = AngleFromNorth(centerPoint, point, NO);
//    testAngle = currentAngle;
    angle = 360 - 90 - currentAngle;
    int angleInt = floorf(currentAngle);
//    NSLog(@"%d",currentAngle);
    _currentValue = [self valueFromAngle];
    [self setNeedsDisplay];

}

#pragma mark - helper functions

-(CGPoint)pointFromAngle:(int)angleInt{
    
    //Define the Circle center
    CGPoint centerPoint = CGPointMake(self.frame.size.width/2 - _lineWidth/2, self.frame.size.height/2 - _lineWidth/2);
    
    //Define The point position on the circumference
    CGPoint result;
    result.y = round(centerPoint.y + radius * sin(ToRad(-angleInt-90))) ;
    result.x = round(centerPoint.x + radius * cos(ToRad(-angleInt-90)));
    
    return result;
}

static inline float AngleFromNorth(CGPoint p1, CGPoint p2, BOOL flipped) {
    CGPoint v = CGPointMake(p2.x-p1.x,p2.y-p1.y);
    float vmag = sqrt(SQR(v.x) + SQR(v.y)), result = 0;
    v.x /= vmag;
    v.y /= vmag;
    double radians = atan2(v.y,v.x);
    result = ToDeg(radians);
    return (result >=0  ? result : result + 360.0);
}

-(float) valueFromAngle {
    if(angle < 0) {
        _currentValue = -angle;
    } else {
        _currentValue = 270 - angle + 90;
    }
    fixedAngle = _currentValue;
    return (_currentValue*(_maximumValue - _minimumValue))/360.0f;
}

- (CGFloat) widthOfString:(NSString *)string withFont:(UIFont*)font {
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].width;
}

- (CGFloat) heightOfString:(NSString *)string withFont:(UIFont*)font {
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size].height;
}

#pragma mark - public methods
-(void)setInnerMarkingLabels:(NSArray*)labels{
    labelsEvenSpacing = labels;
    [self setNeedsDisplay];
}

@end
