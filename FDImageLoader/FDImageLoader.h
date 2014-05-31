#import <FDRequestClient/FDRequestClient.h>
#import "UIImageView+FDImageLoaderAdditions.h"
@import UIKit.UIImage;


#pragma mark Constants


#pragma mark - Enumerations


#pragma mark - Type Definitions

typedef void (^FDImageLoaderProgressBlock)(float progress);
typedef void (^FDImageLoaderCompletionBlock)(UIImage *image);


#pragma mark - Class Interface

@interface FDImageLoader : NSObject


#pragma mark - Properties


#pragma mark - Constructors


#pragma mark - Static Methods

+ (FDImageLoader *)sharedInstance;


#pragma mark - Instance Methods

- (FDRequestClientTask *)loadImageFromURL: (NSURL *)url 
	progressBlock: (FDImageLoaderProgressBlock)progressBlock 
	completionBlock: (FDImageLoaderCompletionBlock)completionBlock;


@end