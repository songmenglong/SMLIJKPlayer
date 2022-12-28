/*
 * Copyright (C) 2015 Gdier
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "IJKDemoHistoryItem.h"

//@interface IJKDemoHistoryItem : NSObject <NSCoding>
//
//@property(nonatomic,strong) NSString *title;
//@property(nonatomic,strong) NSURL *url;
//
//@end

@interface IJKDemoHistory : NSObject

+ (instancetype)instance;

@property(nonatomic,strong,readonly) NSArray *list;

- (void)removeAtIndex:(NSUInteger)index;
- (void)add:(IJKDemoHistoryItem *)item;

@end