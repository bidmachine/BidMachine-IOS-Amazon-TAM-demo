//
//  Interstitial.m
//  Copyright © 2019 bidmachine. All rights reserved.
//

#import "Interstitial.h"

@interface Interstitial ()<BDMInterstitialDelegate, DTBAdCallback>

@property (nonatomic, strong) BDMInterstitial *interstitial;

@end

@implementation Interstitial

- (void)loadAd:(id)sender {
    [self requestAPSBidSlotUUID:@"424c37b6-38e0-4076-94e6-0933a6213496"];
}

- (void)showAd:(id)sender {
    if ([self.interstitial canShow]) {
        [self.interstitial presentFromRootViewController:self];
    }
}

- (void)requestAPSBidSlotUUID:(NSString*)slotUUID {
    DTBAdLoader *adLoader = [DTBAdLoader new];
    DTBAdSize *size = [[DTBAdSize alloc] initInterstitialAdSizeWithSlotUUID:slotUUID];
    [adLoader setSizes:size, nil];
    [adLoader loadAd:self];
}

- (void)requestBidmachineWithTargetingParams:(NSDictionary *)params {
    self.interstitial = [BDMInterstitial new];
    self.interstitial.delegate = self;
    [self.interstitial populateWithRequest:({
        BDMInterstitialRequest *request = BDMInterstitialRequest.new;
        request.type = BDMFullsreenAdTypeBanner;
        request.networkConfigurations = @[[BDMAdNetworkConfiguration buildWithBuilder:^(BDMAdNetworkConfigurationBuilder *builder) {
            builder.appendName(@"amazon");
            builder.appendNetworkClass(BDMAmazonNetwork.class);
            builder.appendAdUnit(BDMAdUnitFormatInterstitialStatic, params, nil);
        }]];
        request;
    })];
}

#pragma mark - DTBAdCallback

- (void)onFailure: (DTBAdError)error {
    
}

- (void)onSuccess: (DTBAdResponse *)adResponse {
    if (!adResponse.customTargeting) {
        return;
    }
    
    // We work with NSDictionary<NSString *, NSString *>
    NSMutableDictionary *bidding = adResponse.customTargeting.mutableCopy;
    bidding[@"amznrdr"] = [bidding[@"amznrdr"] firstObject];
    bidding[@"amznp"] = [bidding[@"amznp"] firstObject];
    bidding[@"dc"] = [bidding[@"dc"] firstObject];
    
    [self requestBidmachineWithTargetingParams:bidding];
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
