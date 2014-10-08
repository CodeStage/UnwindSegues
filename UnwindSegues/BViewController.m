//
//  BViewController.m
//  UnwindSegues
//
//  Created by Christian König on 13.08.14.
//  Copyright (c) 2014 Star Finanz. All rights reserved.
//

#import "BViewController.h"


static NSString *const kAvailableCookiesKeyPath = @"availableCookies";


@interface BViewController ()

@property IBOutlet UILabel *availableCookies;

@end


@implementation BViewController

@synthesize cookieStore;


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.cookieStore addObserver:self forKeyPath:kAvailableCookiesKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial context:nil];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.cookieStore removeObserver:self forKeyPath:kAvailableCookiesKeyPath context:nil];
}


- (IBAction)eatCookieAction:(id)sender
{
    [self.cookieStore eatCookie];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController conformsToProtocol:@protocol(CookieStoreClient)])
    {
        [segue.destinationViewController setCookieStore:self.cookieStore];
    }
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kAvailableCookiesKeyPath])
    {
        [self updateAvailableCookiesLabel];
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


- (void)updateAvailableCookiesLabel
{
    self.availableCookies.text = [NSString stringWithFormat:@"Cookies: %d",  self.cookieStore.availableCookies];
}


@end
