![BidMachine iOS](https://appodeal-ios.s3-us-west-1.amazonaws.com/docs/bidmachine.png)

# BidMachine IOS Amazon TAM demo

## Publisher demo

##### Use BidMachinePublisherSample

Publisher demo contains implementation without BidMachine. The publisher initializes Amazon itself and collects the necessary data for auction. Then it transfers this data to BidMachine for auction.

In folder **BidMachinePublisherSample/BDMAmazonAdapter** you can find the adapter files.

## BidMachine demo

##### Use BidMachineSample

The publisher at the start of the SDK transfers all data to BidMachine (appKey and slotUUID). Then BidMachine initializes Amazon and collects all data for the auction.

In folder **BidMachineSample/BDMAmazonAdapter** you can find the adapter files.