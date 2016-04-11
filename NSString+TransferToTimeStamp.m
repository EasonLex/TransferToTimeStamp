//
//  NSString+TransferToTimeStamp.m
//  EasonLex
//
//  Created by Eason Lin on 2016/4/8.
//

#import "NSString+TransferToTimeStamp.h"

@implementation NSString (TransferToTimeStamp)
- (NSString *)stringTransferToTimeStampWithStyle:(TransferStyle)style
{
    switch (style) {
        case TransferTimeStyle:
            return [self transferWithTimeStyle];
        case TransferDateSecondStyle:
            return [self transferWithDateSecondStyle];
        case TransferDateMinSecondStyle:
            return [self transferWithDateMinSecondStyle];
        default:
            return 0;
    }
}

- (NSString *)transferWithTimeStyle
{
    float returnTimeStamp = 0;
    
    NSArray *spareTime = [self componentsSeparatedByString:@":"];
    
    if (spareTime.count != 2) {
        return nil;
    }
    
    for (int i = 1; i <= 2; i++) {
        NSString *timePart = [spareTime objectAtIndex:i-1];
        int timeBase = pow(60, 3-i);
        returnTimeStamp += timeBase*[timePart intValue];
    }
    
    return [NSString stringWithFormat:@"%f", returnTimeStamp];
}

- (NSString *)transferWithDateSecondStyle
{
    if (self.length == 13) {
        NSString *msString = [self stringByReplacingCharactersInRange:NSMakeRange(10, 3) withString:@""];
        return msString;
    }
    return self;
}

- (NSString *)transferWithDateMinSecondStyle
{
    if (self.length == 10) {
        NSString *msString = [self stringByAppendingString:@"000"];
        return msString;
    }
    return self;
}

@end
