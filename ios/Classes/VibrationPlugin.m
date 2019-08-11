#import "VibrationPlugin.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation VibrationPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"vibration"
                                     binaryMessenger:[registrar messenger]
                                     ];
    VibrationPlugin* instance = [[VibrationPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result
{
    if ([@"hasVibrator" isEqualToString:call.method]) {
        result(TARGET_OS_SIMULATOR == 0);
    } else if ([@"hasAmplitudeControl" isEqualToString:call.method]) {
        result(TARGET_OS_SIMULATOR == 0);
    } else if ([@"vibrate" isEqualToString:call.method]) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    } else if ([@"cancel" isEqualToString:call.method]) {
        result(NULL);
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
