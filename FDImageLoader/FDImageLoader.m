#import "FDImageLoader.h"


#pragma mark Constants


#pragma mark - Class Extension

@interface FDImageLoader ()

@end


#pragma mark - Class Variables

static FDImageLoader *_sharedInstance;


#pragma mark - Class Definition

@implementation FDImageLoader
{
	@private __strong FDRequestClient *_requestClient;
}


#pragma mark - Properties


#pragma mark - Constructors

+ (void)initialize
{
	// NOTE: initialize is called in a thead-safe manner so we don't need to worry about two shared instances possibly being created.
	
	// Create a flag to keep track of whether or not this class has been initialized because this method could be called a second time if a subclass does not override it.
	static BOOL classInitialized = NO;
	
	// If this class has not been initialized then create the shared instance.
	if (classInitialized == NO)
	{
		_sharedInstance = [[FDImageLoader alloc] 
			init];
		
		classInitialized = YES;
	}
}

+ (id)allocWithZone: (NSZone *)zone
{
	// Because we are creating the shared instance in the +initialize method we can check if it exists here to know if we should alloc an instance of the class.
	if (_sharedInstance == nil)
	{
		return [super allocWithZone: zone];
	}
	else
	{
	    return [self sharedInstance];
	}
}

- (id)init
{
	// Abort if base initializer fails.
	if ((self = [super init]) == nil)
	{
		return nil;
	}
	
	// Initialize instance variables.
	_requestClient = [FDRequestClient new];
	
	// Return initialized instance.
	return self;
}


#pragma mark - Public Methods

+ (FDImageLoader *)sharedInstance
{
	return _sharedInstance;
}

- (FDRequestClientTask *)loadImageFromURL: (NSURL *)url 
	progressBlock: (FDImageLoaderProgressBlock)progressBlock 
	completionBlock: (FDImageLoaderCompletionBlock)completionBlock
{
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL: url];
	
	FDRequestClientTask *requestClientTask = [_requestClient loadURLRequest: urlRequest 
		authorizationBlock: nil 
		progressBlock: ^(float uploadProgress, float dowloadProgress)
			{
				if (progressBlock != nil)
				{
					progressBlock(dowloadProgress);
				}
			} 
		dataParserBlock: nil 
		transformBlock: nil 
		completionBlock: ^(FDURLResponse *urlResponse)
			{
				if (completionBlock != nil 
					&& urlResponse.status != FDURLResponseStatusCancelled)
				{
					UIImage *image = nil;
					
					if ([urlResponse.content isKindOfClass: [UIImage class]] == YES)
					{
						image = urlResponse.content;
					}
					
					completionBlock(image);
				}
			}];
	
	return requestClientTask;
}


#pragma mark - Overridden Methods

- (id)copyWithZone: (NSZone *)zone
{
	return self;
}


#pragma mark - Private Methods


@end