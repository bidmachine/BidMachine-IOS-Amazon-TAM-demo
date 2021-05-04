//
//  AppDelegate.m
//  Copyright © 2019 BidMachine. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BDMSdkConfiguration *configuration = BDMSdkConfiguration.new;
    configuration.targeting = BDMTargeting.new;
    configuration.targeting.storeId = @"123";
    configuration.networkConfigurations = @[[BDMAdNetworkConfiguration buildWithBuilder:^(BDMAdNetworkConfigurationBuilder *builder) {
        builder.appendName(@"amazon");
        builder.appendNetworkClass(BDMAmazonNetwork.class);
    }]];
    [[BDMSdk sharedSdk] startSessionWithSellerID:@"1" configuration:configuration completion:^{
        [self startAmazonSDK];
    }];
    
    return YES;
}

#pragma mark - Private

- (void)startAmazonSDK {
    [DTBAds.sharedInstance setLogLevel:BDMSdkLoggingEnabled ? DTBLogLevelAll : DTBLogLevelOff];
    DTBAds.sharedInstance.mraidPolicy = CUSTOM_MRAID;
    DTBAds.sharedInstance.mraidCustomVersions = @[@"1.0", @"2.0", @"3.0"];
    DTBAds.sharedInstance.testMode = YES;
    
    [DTBAds.sharedInstance setAppKey:@"c5f20fe6e37146b08749d09bb2b6a4dd"];
}

@end
