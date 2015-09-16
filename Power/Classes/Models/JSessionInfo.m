////
////  JSessionInfo.m
////  TaiShou
////
////  Created by GF on 13-4-19.
////  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
////
//
#import "JSessionInfo.h"

static JSessionInfo *sessionInfo = nil;

@implementation JSessionInfo

@synthesize secretNum;

-(void)dealloc{
    [super dealloc];
}


+ (JSessionInfo *)sharedInstance {
    
    @synchronized(self){
            
        if (!sessionInfo) {
            
            sessionInfo = [[JSessionInfo alloc] init];
            sessionInfo.secretNum =[NSString string];
            
        }
    }
    
    return sessionInfo;
    
}

 

- (id) copyWithZone:(NSZone*)zone  
{  
    return self;  
}  

- (id) retain  
{  
    return self;  
}  

- (NSUInteger) retainCount  
{  
    return NSUIntegerMax; // denotes an object that cannot be released  
}  

- (oneway void) release  
{  

//    sessionInfo = nil;
    
    // do nothing  
}  

- (id) autorelease  
{  
    return self;  
}  



-(id)init{
    
    
    self=[super init];
    
        
    if (self) {
 
    }
    return self;
}


@end
