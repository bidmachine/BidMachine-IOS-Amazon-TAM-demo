//
//  BDMAmazonAdObject.m
//
//  Copyright © 2019 BidMachine. All rights reserved.
//

#import "BDMAmazonAdObject.h"

@implementation BDMAmazonBannerAdapter

- (UIView *)adView {
    return UIView.new;
}

- (void)prepareContent:(BDMStringToObjectMap *)contentInfo {}

- (void)presentInContainer:(UIView *)container {}


@end

@implementation BDMAmazonInterstitialAdapter

- (UIView *)adView {
    return UIView.new;
}

- (void)prepareContent:(BDMStringToObjectMap *)contentInfo { }

- (void)present { }

@end
