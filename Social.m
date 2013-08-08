//
//  Social.m
//
//  Saumya Ray
//
//  Original by:
//  Cameron Lerch
//  Sponsored by Brightflock: http://brightflock.com
//

#import "Social.h"

@interface Social ()

@end

@implementation Social

- (void)available:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    BOOL avail = false;
    
    if (NSClassFromString(@"UIActivityViewController")) {
        avail = true;
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:avail];
    [self writeJavascript:[pluginResult toSuccessCallbackString:[arguments objectAtIndex:0]]];
}
/*
- (void)share:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    
    if (!NSClassFromString(@"UIActivityViewController")) {
        return;
    }
    
    NSString *text = [arguments objectAtIndex:1];
    
    NSString *imageName = [arguments objectAtIndex:2];
    UIImage *image = nil;
    
    if (imageName) {
        image = [UIImage imageNamed:imageName];
    }
    
    NSString *urlString = [arguments objectAtIndex:3];
    NSURL *url = nil;
    
    if (urlString) {
        url = [NSURL URLWithString:urlString];
    }
    
    NSArray *activityItems = [[NSArray alloc] initWithObjects:text, image, url, nil];
    
    UIActivity *activity = [[UIActivity alloc] init];
    
    NSArray *applicationActivities = [[NSArray alloc] initWithObjects:activity, nil];
    UIActivityViewController *activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:applicationActivities];
    [self.viewController presentViewController:activityVC animated:YES completion:nil];
}
*/
- (void)share:(CDVInvokedUrlCommand*)command{
    NSLog(@"CordovaPlugin : share : ");
    
    CDVPluginResult* pluginResult = nil;
    //NSString* myarg = [command.arguments objectAtIndex:0];
    /*
    NSString *text = [command.arguments objectAtIndex:1];
    NSString *imageName = [command.arguments objectAtIndex:2];
    UIImage *image = nil;
    NSString *urlString = [command.arguments objectAtIndex:3];
    NSURL *url = nil;
    
    if (imageName) {
        image = [UIImage imageNamed:imageName];
    }
    if (urlString) {
        url = [NSURL URLWithString:urlString];
    }
    */
    
    
    //NSLog(@"DataComingIn::: %@",myarg);
    //NSLog(@"text %@",url);
    //NSLog(@"text %@",image);
    /*
    NSString *text = @"HEllo";
    UIImage *image = nil;
    NSURL *url = nil;
    NSArray *activityItems = [[NSArray alloc] initWithObjects:text, image, url, nil];
    UIActivity *activity = [[UIActivity alloc] init];
    NSArray *applicationActivities = [[NSArray alloc] initWithObjects:activity, nil];
    UIActivityViewController *activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:applicationActivities];
    [self.viewController presentViewController:activityVC animated:YES completion:nil];
    
    
    if (myarg != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
     */
    
    NSString* mTitle = [command.arguments objectAtIndex:0];
    NSString* mUrlS = [command.arguments objectAtIndex:1];
    NSURL *mUrl = [NSURL URLWithString:mUrlS];//Sometimes returns null so the below FIX is done
    //Deleaing with URLS
    //ref : http://stackoverflow.com/questions/1981390/urlwithstring-returns-nil
    //localisationName is a arbitrary string here
    NSString* webName = [mUrlS stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString* stringURL = [NSString stringWithFormat:mUrlS, webName];
    NSString* webStringURL = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL* mmUrl = [NSURL URLWithString:webStringURL];
    //End URL handling
    
    NSLog(@"mTitle:: %@",mTitle);
    NSLog(@"mUrl:: %@",mUrl);//This sometimes is null, so used mmUrl
    NSLog(@"mmUrl:: %@",mmUrl);
    
    if (mTitle != nil) {
        NSArray *activityItems = [[NSArray alloc] initWithObjects:mTitle, mmUrl, nil];
        UIActivity *activity = [[UIActivity alloc] init];
        NSArray *applicationActivities = [[NSArray alloc] initWithObjects:activity, nil];
        UIActivityViewController *activityVC =
        [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:applicationActivities];
        [self.viewController presentViewController:activityVC animated:YES completion:nil];
        
        //finally CALLBACK
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
