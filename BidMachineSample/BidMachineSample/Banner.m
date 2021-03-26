//
//  Banner.m
//  Copyright © 2019 bidmachine. All rights reserved.
//

#import "Banner.h"


@interface Banner ()<BDMBannerDelegate>

@property (weak, nonatomic) IBOutlet BDMBannerView *bannerView;

@end

@implementation Banner

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bannerView.delegate = self;
}

- (void)loadAd:(id)sender {
    [self.bannerView populateWithRequest:({
        BDMBannerRequest *request = BDMBannerRequest.new;
        request.adSize = BDMBannerAdSize320x50;
        request;
    })];
}

#pragma mark - BDMBannerDelegate

- (void)bannerViewReadyToPresent:(nonnull BDMBannerView *)bannerView {
    
}

- (void)bannerView:(nonnull BDMBannerView *)bannerView failedWithError:(nonnull NSError *)error {
    
}

- (void)bannerViewRecieveUserInteraction:(nonnull BDMBannerView *)bannerView {
    
}

@end
