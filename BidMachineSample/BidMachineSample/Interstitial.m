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
    self.interstitial = [BDMInterstitial new];
    self.interstitial.delegate = self;
    [self.interstitial populateWithRequest:({
        BDMInterstitialRequest *request = BDMInterstitialRequest.new;
        request.type = BDMFullsreenAdTypeBanner;
        request;
    })];
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
