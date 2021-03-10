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
    __weak typeof(self) weakSelf = self;
    [AppDelegate prepareBiddingParamsForFormat:BDMAdUnitFormatBanner320x50
                                        slotId:@"88e6293b-0bf0-43fc-947b-925babe7bf3f"
                                    completion:^(NSDictionary<NSString *,NSString *> *biddingParams, NSError *error) {
        if (error) {
            return;
        }
        weakSelf.bannerView = [BDMBannerView new];
        weakSelf.bannerView.delegate = weakSelf;
        [weakSelf.bannerView populateWithRequest:({
            BDMBannerRequest *request = BDMBannerRequest.new;
            request.adSize = BDMBannerAdSize320x50;
            request.networkConfigurations = @[[BDMAdNetworkConfiguration buildWithBuilder:^(BDMAdNetworkConfigurationBuilder *builder) {
                builder.appendName(@"amazon");
                builder.appendNetworkClass(BDMAmazonNetwork.class);
                builder.appendAdUnit(BDMAdUnitFormatBanner320x50, biddingParams, nil);
            }]];
            request;
        })];
    }];
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
