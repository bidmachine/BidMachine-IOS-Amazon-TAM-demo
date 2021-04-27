
platform :ios, '10.0'
workspace 'AmazonTAMSample.xcworkspace'

install! 'cocoapods', :deterministic_uuids => false, :warn_for_multiple_pod_sources => false

source 'https://github.com/appodeal/CocoaPods.git'
source 'https://github.com/CocoaPods/Specs.git'

def bidmachine
  pod "BDMIABAdapter", "1.7.3.0"
end

def amazon
  pod 'AmazonPublisherServicesSDK', '3.3.0'
end


target 'BidMachineSample' do
  project 'BidMachineSample/BidMachineSample.xcodeproj'
  bidmachine
  amazon
end

target 'BidMachinePublisherSample' do
  project 'BidMachinePublisherSample/BidMachinePublisherSample.xcodeproj'
  bidmachine
  amazon
end
