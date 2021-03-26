//
//  Banner.m
//  Copyright © 2019 bidmachine. All rights reserved.
//

#import "Banner.h"

@interface Banner ()<BDMBannerDelegate, DTBAdCallback>

@property (weak, nonatomic) IBOutlet BDMBannerView *bannerView;

@end

@implementation Banner

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bannerView.delegate = self;
}

- (void)loadAd:(id)sender {
    [self requestAPSBidWidth:320 height:50 slotUUID:@"88e6293b-0bf0-43fc-947b-925babe7bf3f"];
}

- (void)requestAPSBidWidth:(int)width height:(int)height slotUUID:(NSString*)slotUUID {
    DTBAdLoader *adLoader = [DTBAdLoader new];
    DTBAdSize *size = [[DTBAdSize alloc] initBannerAdSizeWithWidth:width height:height andSlotUUID:slotUUID];
    [adLoader setSizes:size, nil];
    [adLoader loadAd:self];
}

- (void)requestBidmachineWithTargetingParams:(NSDictionary *)params {
    [self.bannerView populateWithRequest:({
        BDMBannerRequest *request = BDMBannerRequest.new;
        request.adSize = BDMBannerAdSize320x50;
        request.networkConfigurations = @[[BDMAdNetworkConfiguration buildWithBuilder:^(BDMAdNetworkConfigurationBuilder *builder) {
            builder.appendName(@"amazon");
            builder.appendNetworkClass(BDMAmazonNetwork.class);
            builder.appendAdUnit(BDMAdUnitFormatBanner320x50, params, nil);
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

#pragma mark - BDMBannerDelegate

- (void)bannerViewReadyToPresent:(nonnull BDMBannerView *)bannerView {
    
}

- (void)bannerView:(nonnull BDMBannerView *)bannerView failedWithError:(nonnull NSError *)error {
    
}

- (void)bannerViewRecieveUserInteraction:(nonnull BDMBannerView *)bannerView {
    
}

@end
