//
//  DEAddContactViewController.m
//  DummyEnterprise
//
//  Created by Chakrit Wichian on 8/3/13.
//  Copyright (c) 2013 Ent. All rights reserved.
//

#import "DEAddContactViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@implementation DEAddContactViewController

- (void)loadView {
    UIScreen *screen = [UIScreen mainScreen];
    CGRect screenFrame = [screen bounds];

    UIView *container = [[UIView alloc] init];
    [container setFrame:[screen bounds]];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect frame = CGRectInset(screenFrame, 5.0, 10.0);
    frame.origin = CGPointMake(0, 0);

    [button setFrame:frame];
    [button addTarget:self
               action:@selector(userDidTapAdd)
     forControlEvents:UIControlEventTouchUpInside];
    [container addSubview:button];
    [button setTitle:@"HELLO" forState:UIControlStateNormal];

    [self setView:container];
}

- (void)userDidTapAdd {
    NSString *firstName = @"Chakrit";
    NSString *lastName = @"Wichian";

    ABRecordRef person = ABPersonCreate();
    ABRecordSetValue(person, kABPersonFirstNameProperty,
                     (__bridge CFTypeRef) firstName,
                     NULL);
    ABRecordSetValue(person, kABPersonLastNameProperty,
                     (__bridge CFTypeRef) lastName,
                     NULL);

    ABUnknownPersonViewController *ctr;
    ctr = [[ABUnknownPersonViewController alloc] init];

    [ctr setDisplayedPerson:person];
    [ctr setAllowsAddingToAddressBook:YES];
    [[self navigationController] pushViewController:ctr animated:YES];
}

@end
