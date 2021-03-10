//
//  AppDelegate.m
//  Copyright © 2019 BidMachine. All rights reserved.
//

#import "AppDelegate.h"
#import "BDMAmazonAdLoader.h"

#import <StackFoundation/StackFoundation.h>


@interface AppDelegate ()

@property (nonatomic, strong) NSHashTable <BDMAmazonAdLoader *> *loaders;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BDMSdkConfiguration *configuration = BDMSdkConfiguration.new;
    configuration.networkConfigurations = @[[BDMAdNetworkConfiguration buildWithBuilder:^(BDMAdNetworkConfigurationBuilder *builder) {
        builder.appendName(@"amazon");
        builder.appendNetworkClass(BDMAmazonNetwork.class);
    }]];
    [[BDMSdk sharedSdk] startSessionWithSellerID:@"1" configuration:configuration completion:^{
        [self startAmazonSDK];
    }];
    
    return YES;
}

#pragma mark - Bidding

+ (void)prepareBiddingParamsForFormat:(BDMAdUnitFormat)format
                               slotId:(NSString *)slotId
                           completion:(void (^)(NSDictionary<NSString *,NSString *> *, NSError *))completion {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate prepareBiddingParamsForFormat:format slotId:slotId completion:completion];
}

- (void)prepareBiddingParamsForFormat:(BDMAdUnitFormat)format
                               slotId:(NSString *)slotId
                           completion:(void(^)(NSDictionary<NSString *, NSString *> *, NSError *))completion {
    BDMAmazonAdLoader *loader = [[BDMAmazonAdLoader alloc] initWithFormat:format
                                                         serverParameters:@{BDMAmazonSlotIdKey : slotId }];
    [self.loaders addObject:loader];
    __weak typeof(self) weakSelf = self;
    [loader prepareWithCompletion:^(BDMAmazonAdLoader *loader,
                                    NSDictionary<NSString *, NSString *> *biddingParameters,
                                    NSError *error) {
        [weakSelf.loaders removeObject:loader];
        STK_RUN_BLOCK(completion, biddingParameters, error);
    }];
}

#pragma mark - Private

- (void)startAmazonSDK {
    [DTBAds.sharedInstance setLogLevel:BDMSdkLoggingEnabled ? DTBLogLevelAll : DTBLogLevelOff];
    DTBAds.sharedInstance.mraidPolicy = CUSTOM_MRAID;
    DTBAds.sharedInstance.mraidCustomVersions = @[@"1.0", @"2.0", @"3.0"];
    DTBAds.sharedInstance.testMode = YES;
    
    [DTBAds.sharedInstance setAppKey:@"c5f20fe6e37146b08749d09bb2b6a4dd"];
}

- (NSHashTable<BDMAmazonAdLoader *> *)loaders {
    if (!_loaders) {
        _loaders = [[NSHashTable alloc] init];
    }
    return _loaders;
}

@end
