//
//  CookieStore.h
//  UnwindSegues
//
//  Created by Christian König on 08.10.14.
//  Copyright (c) 2014 Star Finanz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CookieStoreClient;


@interface CookieStore : NSObject

@property (readonly) NSUInteger availableCookies;

- (void)eatCookie;
- (void)refillCookies;


@end


@protocol CookieStoreClient <NSObject>

@property (nonatomic) CookieStore *cookieStore;

@end
