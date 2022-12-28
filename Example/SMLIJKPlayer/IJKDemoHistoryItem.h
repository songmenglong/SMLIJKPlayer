//
//  IJKDemoHistoryItem.h
//  SMLIJKPlayer_Example
//
//  Created by SongMengLong on 2022/12/28.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN
//
//@interface IJKDemoHistoryItem : NSObject
//
//@end
//
//NS_ASSUME_NONNULL_END

@interface IJKDemoHistoryItem : NSObject <NSCoding>

@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSURL *url;

@end
