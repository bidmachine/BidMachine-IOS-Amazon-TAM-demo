//
//  AppDelegate.m
//  Copyright © 2019 BidMachine. All rights reserved.
//

#import "AppDelegate.h"

#import "BDMAmazonNetwork.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    BDMSdkConfiguration *configuration = BDMSdkConfiguration.new;
    configuration.targeting = BDMTargeting.new;
    configuration.targeting.storeId = @"123";
    configuration.networkConfigurations = @[[BDMAdNetworkConfiguration buildWithBuilder:^(BDMAdNetworkConfigurationBuilder *builder) {
        builder.appendName(@"amazon");
        builder.appendNetworkClass(BDMAmazonNetwork.class);
        builder.appendParams(@{@"app_key": @"c5f20fe6e37146b08749d09bb2b6a4dd"});
        builder.appendAdUnit(BDMAdUnitFormatBanner320x50, @{@"slot_uuid": @"88e6293b-0bf0-43fc-947b-925babe7bf3f"}, nil);
        builder.appendAdUnit(BDMAdUnitFormatInterstitialStatic, @{@"slot_uuid": @"424c37b6-38e0-4076-94e6-0933a6213496"}, nil);
    }]];
    [[BDMSdk sharedSdk] startSessionWithSellerID:@"1" configuration:configuration completion:nil];
    
    return YES;
}

@end
