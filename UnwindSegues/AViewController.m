//
//  AViewController.m
//  UnwindSegues
//
//  Created by Christian König on 13.08.14.
//  Copyright (c) 2014 Star Finanz. All rights reserved.
//

#import "AViewController.h"
#import "CookieStore.h"


@interface AViewController ()

@property CookieStore *cookieStore;
@property IBOutlet UILabel *availableCookies;

@end


@implementation AViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        _cookieStore = [CookieStore new];
        [_cookieStore refillCookies];
    }
    return self;
}


- (IBAction)unwindToA:(UIStoryboardSegue *)segue
{
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController conformsToProtocol:@protocol(CookieStoreClient)])
    {
        [segue.destinationViewController setCookieStore:self.cookieStore];
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.availableCookies.text = [NSString stringWithFormat:@"Cookies: %d",  self.cookieStore.availableCookies];
}


@end
