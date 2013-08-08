//
//  Social.h
//
//	Saumya Ray : http://saumyaray.com : https://twitter.com/saumya
//
//	Original by:
//  Cameron Lerch
//  Sponsored by Brightflock: http://brightflock.com
//

#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVPluginResult.h>

@interface Social : CDVPlugin {
}

- (void)available:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

//- (void)share:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

- (void)share:(CDVInvokedUrlCommand*)command;

@end
