//
//  BDMAmazonAdLoader.h
//
//  Copyright © 2019 BidMachine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BidMachine/BidMachine.h>

#import "BDMAmazonNetwork.h"


@class BDMAmazonAdLoader;

typedef void(^BDMAmazonAdLoaderCompletion)(BDMAmazonAdLoader *_Nonnull loader,
                                           NSDictionary <NSString *, NSString *> *_Nullable biddingParameters,
                                           NSError *_Nullable error);


NS_ASSUME_NONNULL_BEGIN

@interface BDMAmazonAdLoader : NSObject


- (instancetype)initWithFormat:(BDMAdUnitFormat)foramt
              serverParameters:(NSDictionary<NSString *, NSString *> *)parameters;

- (void)prepareWithCompletion:(BDMAmazonAdLoaderCompletion)completion;

@end

NS_ASSUME_NONNULL_END
