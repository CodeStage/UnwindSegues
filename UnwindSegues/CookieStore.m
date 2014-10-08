//
//  CookieStore.m
//  UnwindSegues
//
//  Created by Christian König on 08.10.14.
//  Copyright (c) 2014 Star Finanz. All rights reserved.
//

#import "CookieStore.h"


@interface CookieStore ()

@property NSUInteger availableCookies;

@end


@implementation CookieStore


- (void)eatCookie
{
    self.availableCookies--;
}


- (void)refillCookies
{
    self.availableCookies += 10;
}


@end
