@import XCTest;

@import FDImageLoader;

@interface FDImageLoaderTests : XCTestCase

@end

@implementation FDImageLoaderTests

- (void)testExample
{
	XCTestExpectation *expectation = [self expectationWithDescription: @"loading image"];
	
	FDImageLoader *imageLoader = [FDImageLoader new];
	
	NSURL *url = [NSURL URLWithString: @"http://i.imgur.com/PD7ana0.jpg"];
	[imageLoader loadImageFromURL: url 
		progressBlock: ^(float progress)
			{
				XCTAssertTrue(progress > 0.0f);
			} 
		completionBlock: ^(UIImage *image)
			{
				XCTAssertNotNil(image);
				
				[expectation fulfill];
			}];
	
	[self waitForExpectationsWithTimeout: 5.0 
		handler: nil];
}

@end
