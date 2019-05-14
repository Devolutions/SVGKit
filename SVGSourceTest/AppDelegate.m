//
//  AppDelegate.m
//  SVGSourceTest
//
//  Created by Xavier Fortin on 2019-05-14.
//  Copyright © 2019 na. All rights reserved.
//

#import "AppDelegate.h"
#include "SVGKImage.h"
#include "SVGKSourceString.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

@synthesize source;
@synthesize width;
@synthesize height;
@synthesize image;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self setWidth:16];
    [self setHeight:16];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)generate:(id)sender {
    SVGKImage *svgImage = [SVGKImage imageWithSource:[SVGKSourceString sourceFromContentsOfString:[self source]]];
    [svgImage setSize:CGSizeMake([self width], [self height])];
    NSImage *output = svgImage.NSImage;
    
    [self setImage:output];
}

@end
