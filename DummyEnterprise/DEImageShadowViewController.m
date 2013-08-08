//
//  DEImageShadowViewController.h
//  DummyEnterprise
//
//  Created by Chakrit Wichian on 8/3/13.
//  Copyright (c) 2013 Ent. All rights reserved.
//

#import "DEImageShadowViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation DEImageShadowViewController {
    UIImageView *_imageView;
}

- (void)loadView {
    UIScreen *screen = [UIScreen mainScreen];
    CGRect screenFrame = [screen bounds];

    UIView *container = [[UIView alloc] init];
    [container setFrame:[screen bounds]];

    UIImageView *imageView = [[UIImageView alloc] init];
    CGRect frame = CGRectInset(screenFrame, 5.0, 10.0);
    [imageView setFrame:frame];
    [imageView setUserInteractionEnabled:YES];
    [imageView setOpaque:YES];
    [imageView setBackgroundColor:[UIColor grayColor]];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [container addSubview:imageView];
    _imageView = imageView;

    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
    [recognizer addTarget:self action:@selector(userDidTapImage:)];
    [imageView addGestureRecognizer:recognizer];

    [self setView:container];
}

- (void)userDidTapImage:(id)sender {
    UIImage *src = [UIImage imageNamed:@"test_img.jpg"];
    CGImageRef image = [src CGImage];

    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = NULL;
    context = CGBitmapContextCreate(NULL, [src size].width + 100.0f,
                                    [src size].height + 100.0f,
                                    CGImageGetBitsPerComponent(image), 0, space,
                                    kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(space);

    CGRect target = CGRectMake(50.0f, 50.0f, [src size].width, [src size].height);
    CGContextSetShadowWithColor(context, CGSizeZero, 30.0f, [[UIColor orangeColor] CGColor]);
    CGContextDrawImage(context, target, image);

    CGImageRef result = CGBitmapContextCreateImage(context);
    CGContextRelease(context);

    [_imageView setImage:[UIImage imageWithCGImage:result]];
    CGImageRelease(result);
}

@end
