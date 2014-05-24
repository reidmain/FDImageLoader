#import "UIImageView+FDImageLoaderAdditions.h"
#import "FDImageLoader.h"
#import <objc/runtime.h>


#pragma mark Constants

static void * const _RequestClientTaskKey;


#pragma mark - Class Definition

@implementation UIImageView (FDImageLoaderAdditions)


#pragma mark - Properties


#pragma mark - Public Methods

- (void)setImageWithURL: (NSURL *)url
{
	// Ensure there is a weak reference associated with the image view that will be used to store the current request client task.
	FDWeakReference *weakReference = objc_getAssociatedObject(self, _RequestClientTaskKey);
	if (weakReference == nil)
	{
		weakReference = [FDWeakReference new];
		objc_setAssociatedObject(self, _RequestClientTaskKey, weakReference, OBJC_ASSOCIATION_RETAIN);
	}
	
	// Cancel any previous request to load a image.
	[weakReference.referencedObject cancel];
	
	// Load the image from the URL and set the image property on the image view.
	FDImageLoader *imageLoader = [FDImageLoader sharedInstance];
	FDWeakSelfDeclare();
	weakReference.referencedObject = [imageLoader loadImageFromURL: url 
		progressBlock: nil 
		completionBlock: ^(UIImage *image)
			{
				FDWeakSelfImportReturn();
				
				self.image = image;
			}];
}


@end