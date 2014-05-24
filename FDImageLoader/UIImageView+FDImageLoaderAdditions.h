#pragma mark Type Definitions

typedef void (^UIImageViewImageLoaderCompletionBlock)();


#pragma mark - Class Interface

@interface UIImageView (FDImageLoaderAdditions)


#pragma mark - Instance Methods

- (void)setImageWithURL: (NSURL *)url 
	placeholderImage: (UIImage *)placeholderImage 
	completionBlock: (UIImageViewImageLoaderCompletionBlock)completionBlock;
- (void)setImageWithURL: (NSURL *)url 
	placeholderImage: (UIImage *)placeholderImage;
- (void)setImageWithURL: (NSURL *)url;


@end