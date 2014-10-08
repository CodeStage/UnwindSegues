//
//  CViewController.m
//  UnwindSegues
//
//  Created by Christian König on 13.08.14.
//  Copyright (c) 2014 Star Finanz. All rights reserved.
//

#import "CViewController.h"


static NSString *const kAvailableCookiesKeyPath = @"availableCookies";


@interface CViewController ()

@property IBOutlet UILabel *availableCookies;

@end


@implementation CViewController

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


- (IBAction)refillCookiesAction:(id)sender
{
    [self.cookieStore refillCookies];
}


- (void)updateAvailableCookiesLabel
{
    self.availableCookies.text = [NSString stringWithFormat:@"Cookies: %d",  self.cookieStore.availableCookies];
}


@end
