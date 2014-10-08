#import "AppDelegate.h"


#pragma mark Class Definition

@implementation AppDelegate
{
	@private __strong UIWindow *_mainWindow;
}


#pragma mark - UIApplicationDelegate Methods

- (BOOL)application: (UIApplication *)application 
	didFinishLaunchingWithOptions: (NSDictionary *)launchOptions
{
	// Create the main window.
	UIScreen *mainScreen = [UIScreen mainScreen];
	
	_mainWindow = [[UIWindow alloc] 
		initWithFrame: mainScreen.bounds];
	
	_mainWindow.backgroundColor = [UIColor blackColor];
	
	// TODO: Create the root view controller based on what platform the app is running on.
	UIDevice *currentDevice = [UIDevice currentDevice];
	
	UIUserInterfaceIdiom idiom = currentDevice.userInterfaceIdiom;
	
	if (idiom == UIUserInterfaceIdiomPad)
	{
	}
	else
	{
	}
	
	FDImageLoader *imageLoader = [FDImageLoader sharedInstance];
	
	// Show the main window.
	[_mainWindow makeKeyAndVisible];
	
	// Indicate success.
	return YES;
}


@end