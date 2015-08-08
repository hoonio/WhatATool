#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPathInfo(){
	// Code from path info section here
	NSString *path = @"/Users/Hoonio";
	NSLog(@"My home folder is at '%@'", path);
	NSArray *pathComponents = [path pathComponents];
	for(int i=0; i < [pathComponents count]; i++){
		NSLog(@"%@", [pathComponents objectAtIndex:i]);
	}
}

void PrintProcessInfo(){
	NSString *processName = [[NSProcessInfo processInfo] processName];
	int processID = [[NSProcessInfo processInfo] processIdentifier];
	NSLog(@"Process Name: '%@' Process ID: '%i'", processName, processID);
}

void PrintBookmarkInfo(){
	NSArray *keys = [NSArray arrayWithObjects:@"Hoonio", @"ViciHooni", @"Sentimentum", @"Apple", @"CS193P", nil];
	NSArray *urls = [NSArray arrayWithObjects:[NSURL URLWithString:@"http://www.hoonio.com"], [NSURL URLWithString:@"http://www.hoonio.com/wiki"], [NSURL URLWithString:@"http://www.hoonio.com/blog"], [NSURL URLWithString:@"http://www.apple.com"], [NSURL URLWithString:@"http://cs193p.stanford.edu"], nil];
	NSMutableDictionary *dictionary = [NSDictionary dictionaryWithObjects:urls forKeys:keys];
	
	for (id key in dictionary){
		if ([key hasPrefix:@"Hoonio"]) {
			NSLog(@"Key: '%@' URL: '%@'", key, [dictionary objectForKey:key]);
		}
	}
}

void PrintIntrospectionInfo(){
	NSArray *keys = [NSArray arrayWithObjects:@"Hoonio", @"ViciHooni", @"Sentimentum", nil];
	NSArray *objects = [NSArray arrayWithObjects:@"hello world!", [NSURL URLWithString:@"http://www.hoonio.com"], [NSDictionary dictionary], nil];
	NSMutableDictionary *dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
	
	for (id key in dictionary){
		id object = [dictionary objectForKey:key];
		NSLog(@"Class name: %@", [object class]);
		if ([object isMemberOfClass:[NSString class]]) {
			NSLog(@"conditional entered");
		}
		NSLog(@"Is Member of NSString: %@", ([object isMemberOfClass:[NSString class]] ? @"YES" : @"NO"));
		NSLog(@"Is Kind of NSString: %@", ([object isKindOfClass:[NSString class]] ? @"YES" : @"NO"));
		if ([object respondsToSelector:@selector(lowercaseString)]) {
			NSLog(@"Responds to lowercaseString: YES");
			NSLog(@"lowercaseString is: %@", object);
		}
		else {
			NSLog(@"Responds to lowercaseString: NO");
		}
	}
	
}

void PrintPolygonInfo(){
	NSMutableArray *polygonArray = [[NSMutableArray alloc] initWithCapacity:3];

	PolygonShape *poly1 = [[PolygonShape alloc] initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:7];
	[polygonArray insertObject:poly1 atIndex:0]; 
	[poly1 printOutput];
	PolygonShape *poly2 = [[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9];
	[polygonArray insertObject:poly2 atIndex:1]; 
	[poly2 printOutput];
	PolygonShape *poly3 = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
	[polygonArray insertObject:poly3 atIndex:2]; 
	[poly3 printOutput];
	

	NSUInteger index = 0;
	// attempt to set numberOfSides to 10
	NSLog(@"Testing for setter iteration");
	for (id element in polygonArray){
		NSLog(@"Attempting to set numberOfSides for polygon %u", index);
		[element setNumberOfSides:10];
		if (++index >= 3)
			break;
	}
	
	//deallocation
	index = 0;
	for (id element in polygonArray){
		[element dealloc];
		if (++index >= 3)
			break;
	}
	NSLog(@"Polygon Array deallocated");
	
	[polygonArray dealloc];
}




int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
	PrintPathInfo();			// Section 1
	PrintProcessInfo();			// Section 2
	PrintBookmarkInfo();		// Section 3
    PrintIntrospectionInfo();	// Section 4
	PrintPolygonInfo();			// Section 6
	
	[pool release];
    return 0;
}
