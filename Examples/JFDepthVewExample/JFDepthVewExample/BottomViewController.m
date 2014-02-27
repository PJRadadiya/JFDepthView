//
//  BottomViewController.m
//  JFDepthVewExample
//
//  Created by Jeremy Fox on 10/17/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "BottomViewController.h"
#import "TopViewController.h"

@interface BottomViewController ()
@property (nonatomic, strong) JFDepthView* depthView;
@property (nonatomic, strong) TopViewController* topViewController;
@end

@implementation BottomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topViewController = [[TopViewController alloc] init];
    UITapGestureRecognizer* tapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    self.depthView = [[JFDepthView alloc] init];
    self.depthView.delegate = self;
    
    // Optional properties, use these to customize your presentations
//    self.depthView.presentedViewWidth = 700;
//    self.depthView.presentedViewOriginY = 200;
//    self.depthView.blurAmount = JFDepthViewBlurAmountLight;
    self.depthView.recognizer = tapRec;
    self.depthView.animationOption = JFDepthViewAnimationOptionPerspectiveTransform;
    
    self.topViewController.depthViewReference = self.depthView;
    self.topViewController.presentedInView = self.view;
    
}

- (void)dismiss {
    [self.depthView dismissPresentedViewInView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presentView:(id)sender {
    
    [self.depthView presentViewController:self.topViewController inView:self.view animated:YES];
}

#pragma mark - JFDepthView Rotation Support

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [self.depthView didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self.depthView willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

#pragma mark - iOS 5 Rotation Support

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - iOS 6 Rotation Support

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationMaskAll;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (void)willPresentDepthView:(JFDepthView*)depthView {
    NSLog(@"willPresentDepthView called!!!");
}

- (void)didPresentDepthView:(JFDepthView*)depthView {
    NSLog(@"didPresentDepthView called!!!");
}

- (void)willDismissDepthView:(JFDepthView*)depthView {
    NSLog(@"willDismissDepthView called!!!");
}

- (void)didDismissDepthView:(JFDepthView*)depthView {
    NSLog(@"didDismissDepthView called!!!");
}

@end
