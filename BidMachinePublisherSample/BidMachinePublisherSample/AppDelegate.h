//
//  AppDelegate.h
//  Copyright © 2019 BidMachine. All rights reserved.
//

#import <UIKit/UIKit.h>

@import BidMachine;
@import BidMachine.HeaderBidding;
@import DTBiOSSDK;

#import "BDMAmazonNetwork.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (void)prepareBiddingParamsForFormat:(BDMAdUnitFormat)format
                               slotId:(NSString *)slotId
                           completion:(void(^)(NSDictionary<NSString *, NSString *> *, NSError *))completion;

@end

