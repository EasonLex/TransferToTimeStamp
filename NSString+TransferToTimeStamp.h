//
//  NSString+TransferToTimeStamp.h
//  EasonLex
//
//  Created by Eason Lin on 2016/4/8.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TransferStyle) {
    TransferTimeStyle = 0,
    TransferDateSecondStyle,
    TransferDateMinSecondStyle
};


@interface NSString (TransferToTimeStamp)
- (NSString *)stringTransferToTimeStampWithStyle:(TransferStyle)style;
@end
