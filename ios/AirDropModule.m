#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(AirDropModule, NSObject)

RCT_EXTERN_METHOD(shareDeepLink:(NSString *)deepLink)

@end
