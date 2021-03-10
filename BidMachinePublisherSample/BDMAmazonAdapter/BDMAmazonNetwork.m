//
//  BDMAmazonNetwork.m
//
//  Copyright © 2019 BidMachine. All rights reserved.
//

@import DTBiOSSDK;
@import StackFoundation;

#import "BDMAmazonNetwork.h"
#import "BDMAmazonAdObject.h"


@implementation BDMAmazonNetwork

- (NSString *)name {
    return @"amazon";
}

- (NSString *)sdkVersion {
    return [DTBAds version];
}

- (void)initializeWithParameters:(BDMStringToStringMap *)parameters
                           units:(NSArray<BDMAdUnit *> *)units
                      completion:(BDMInitializeBiddingNetworkBlock)completion {
    completion(YES, nil);
}

- (void)collectHeaderBiddingParameters:(BDMAdUnit *)unit
                            completion:(BDMCollectBiddingParamtersBlock)completion
{
    STK_RUN_BLOCK(completion, unit.params, nil);
}

- (id<BDMBannerAdapter>)bannerAdapterForSdk:(BDMSdk *)sdk {
    return [BDMAmazonBannerAdapter new];
}

- (id<BDMFullscreenAdapter>)interstitialAdAdapterForSdk:(BDMSdk *)sdk {
    return [BDMAmazonInterstitialAdapter new];
}

@end
