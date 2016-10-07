
#import <Foundation/Foundation.h>

@interface OSCController : NSObject

-(id) init;
-(void) sendPitch:(float) pitch Roll:(float)roll Yaw:(float)yaw;

@end
