#import "OSCController.h"

#include "OscOutboundPacketStream.h"
#include "UdpSocket.h"

#define ADDRESS "127.0.0.1"
//#define ADDRESS "10.80.159.156"
//#define ADDRESS "169.254.186.226"
#define PORT 8000

#define OUTPUT_BUFFER_SIZE 1024

@implementation OSCController

-(id) init{
	self = [super init];
	return self;
}

-(void) sendPitch:(float) pitch Roll:(float)roll Yaw:(float)yaw{
	char buffer[OUTPUT_BUFFER_SIZE];
	osc::OutboundPacketStream p( buffer, OUTPUT_BUFFER_SIZE );
	UdpTransmitSocket transmitSocket( IpEndpointName( ADDRESS, PORT ) );

	//    float one = msg[0] + msg[1];
	p << osc::BeginBundleImmediate << osc::BeginMessage( "/orientation/1/pitch" ) << pitch << osc::EndMessage
	<< osc::BeginMessage( "/orientation/1/roll" ) << roll << osc::EndMessage
	<< osc::BeginMessage( "/orientation/1/yaw" ) << yaw << osc::EndMessage
	<< osc::EndBundle;
	transmitSocket.Send( p.Data(), p.Size() );
//	printf("sending: %f, %f ,%f\n", pitch, roll, yaw);
}


-(void) send{
	char buffer[OUTPUT_BUFFER_SIZE];
	osc::OutboundPacketStream p( buffer, OUTPUT_BUFFER_SIZE );
	UdpTransmitSocket transmitSocket( IpEndpointName( ADDRESS, PORT ) );
	
	float pitch = arc4random()%1000/1000.0;//1.0;
	float roll = arc4random()%1000/1000.0;//1.0;
	float yaw = arc4random()%1000/1000.0;//1.0;
	
	//    float one = msg[0] + msg[1];
	p << osc::BeginBundleImmediate << osc::BeginMessage( "/orientation/1/pitch" ) << pitch << osc::EndMessage
	<< osc::BeginMessage( "/orientation/1/roll" ) << roll << osc::EndMessage
	<< osc::BeginMessage( "/orientation/1/yaw" ) << yaw << osc::EndMessage
	<< osc::EndBundle;
	transmitSocket.Send( p.Data(), p.Size() );
}

@end
