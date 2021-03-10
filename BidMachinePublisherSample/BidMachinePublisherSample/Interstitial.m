//
//  Interstitial.m
//  Copyright © 2019 bidmachine. All rights reserved.
//

#import "Interstitial.h"

@interface Interstitial ()<BDMInterstitialDelegate>

@property (nonatomic, strong) BDMInterstitial *interstitial;

@end

@implementation Interstitial

- (void)loadAd:(id)sender {
    __weak typeof(self) weakSelf = self;
    [AppDelegate prepareBiddingParamsForFormat:BDMAdUnitFormatInterstitialStatic
                                        slotId:@"424c37b6-38e0-4076-94e6-0933a6213496"
                                    completion:^(NSDictionary<NSString *,NSString *> *biddingParams, NSError *error) {
        if (error) {
            return;
        }
        weakSelf.interstitial = [BDMInterstitial new];
        weakSelf.interstitial.delegate = weakSelf;
        [weakSelf.interstitial populateWithRequest:({
            BDMInterstitialRequest *request = BDMInterstitialRequest.new;
            request.type = BDMFullsreenAdTypeBanner;
            request.networkConfigurations = @[[BDMAdNetworkConfiguration buildWithBuilder:^(BDMAdNetworkConfigurationBuilder *builder) {
                builder.appendName(@"amazon");
                builder.appendNetworkClass(BDMAmazonNetwork.class);
                builder.appendAdUnit(BDMAdUnitFormatInterstitialStatic, biddingParams, nil);
            }]];
            request;
        })];
    }];
}

- (void)showAd:(id)sender {
    if ([self.interstitial canShow]) {
        [self.interstitial presentFromRootViewController:self];
    }
}

#pragma mark - BDMInterstitialDelegate

- (void)interstitialReadyToPresent:(nonnull BDMInterstitial *)interstitial {
    
}

- (void)interstitial:(nonnull BDMInterstitial *)interstitial failedWithError:(nonnull NSError *)error {
    
}

- (void)interstitial:(nonnull BDMInterstitial *)interstitial failedToPresentWithError:(nonnull NSError *)error {
    
}

- (void)interstitialWillPresent:(nonnull BDMInterstitial *)interstitial {
    
}

- (void)interstitialDidDismiss:(nonnull BDMInterstitial *)interstitial {
    
}

- (void)interstitialRecieveUserInteraction:(nonnull BDMInterstitial *)interstitial {
    
}

@end
