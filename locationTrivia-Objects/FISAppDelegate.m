//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
-(NSArray*)allLocationNames
{
    NSMutableArray *names = [[NSMutableArray alloc]init];
    for (FISLocation *location in _locations)
    {
        [names addObject:location.name];
    }
    NSLog(@"%@",names);
    return names;
}
-(FISLocation*)locationNamed:(NSString *)name
{
    for(FISLocation *location in _locations)
    {
        if([location.name isEqualToString: name])
        {
            return location;
        }
        
    }
    
    return nil;
}
-(NSArray*)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin
{
    NSMutableArray *matchingLocation = [[NSMutableArray alloc]init];

       for (FISLocation *location in self.locations)
       {
           if (location.latitude <= latitude + margin && location.latitude >= latitude - margin &&
               location.longitude <= longitude + margin && location.longitude >= longitude - margin)
            {
                [matchingLocation addObject:location];
            }
           
        }
    
    return matchingLocation;

}
@end
