#import "FlutterConfigPlusPlugin.h"
#import "GeneratedDotEnv.m" // written during build by BuildDotenvConfig.ruby

@implementation FlutterConfigPlusPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_config_plus"
            binaryMessenger:[registrar messenger]];
  FlutterConfigPlusPlugin* instance = [[FlutterConfigPlusPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

+ (NSDictionary *)env {
    return (NSDictionary *)DOT_ENV;
}

+ (NSString *)envFor: (NSString *)key {
    NSString *value = (NSString *)[self.env objectForKey:key];
    return value;
}

- (NSDictionary *)constantsToExport {
    return DOT_ENV
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"loadEnvVariables" isEqualToString:call.method]) {
      NSDictionary *variables = (NSDictionary *)DOT_ENV;
      
      result(variables);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
