//
//  Banner.m
//  Copyright © 2019 bidmachine. All rights reserved.
//

#import "Banner.h"


@interface Banner ()<BDMBannerDelegate>

@property (weak, nonatomic) IBOutlet UIView *container;
@property (nonatomic, strong) BDMBannerView *bannerView;

@end

@implementation Banner

- (void)loadAd:(id)sender {
    self.bannerView = [BDMBannerView new];
    self.bannerView.delegate = self;
    [self.bannerView populateWithRequest:({
        BDMBannerRequest *request = BDMBannerRequest.new;
        request.adSize = BDMBannerAdSize320x50;
        request;
    })];
}

- (void)showAd:(id)sender {
    if (!self.bannerView) {
        return;
    }
    self.bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.container.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.container addSubview:self.bannerView];
    [NSLayoutConstraint activateConstraints:
    @[
      [self.bannerView.centerXAnchor constraintEqualToAnchor:self.container.centerXAnchor],
      [self.bannerView.centerYAnchor constraintEqualToAnchor:self.container.centerYAnchor],
      [self.bannerView.widthAnchor constraintEqualToAnchor:self.container.widthAnchor],
      [self.bannerView.heightAnchor constraintEqualToConstant:50]
      ]];
}

#pragma mark - BDMBannerDelegate

- (void)bannerViewReadyToPresent:(nonnull BDMBannerView *)bannerView {
    
}

- (void)bannerView:(nonnull BDMBannerView *)bannerView failedWithError:(nonnull NSError *)error {
    
}

- (void)bannerViewRecieveUserInteraction:(nonnull BDMBannerView *)bannerView {
    
}

@end
