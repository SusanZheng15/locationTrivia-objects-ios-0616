//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Flatiron School on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"
//#import "FISTrivium.h"

@implementation FISLocation

-(instancetype)init
{
    self = [self initWithName:@"" latitude:0 longitude:0];
    return self;
}
-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
    self = [super init];
    if(self)
    {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc]init];
    }
    return self;
}
-(NSString*)stringByTruncatingNameToLength:(NSUInteger)length
{
    if(length > _name.length)
    {
        return _name;
    }
    return [_name substringToIndex:length];
}
-(BOOL)hasValidData
{
    if([_name isEqualToString:@""] || [_name length] == 0)
    {
        return NO;
    }
    if(_latitude < -90.0 || _latitude > 90.0)
    {
        return NO;
    }
    if(_longitude < -180.0 || _longitude > 180.0)
    {
        return NO;
    }
    if (_longitude == -180.0)
    {
        return NO;
    }
    return YES;
}
-(FISTrivium *)triviumWithMostLikes
{
    if([_trivia isEqualToArray: @[]])
    {
        return nil;
    }
    
    NSSortDescriptor *sortTrivia = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    [_trivia sortUsingDescriptors:@[sortTrivia]];
        
    return _trivia[0];

}
@end
