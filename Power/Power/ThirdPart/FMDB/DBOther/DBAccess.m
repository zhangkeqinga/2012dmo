//
//  DBAccess.m
//  iSIPCity
//
//  Created by  on 12-1-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//



#import "DBAccess.h"

static DBAccess *dbAccess = nil;

@implementation DBAccess

+ (DBAccess *)sharedInstance {
    
    if (!dbAccess) {
        dbAccess = [[DBAccess alloc] init];
    }
    return dbAccess;
}



- (id)init {
    
	if (self = [super init]) {
        
        //library
//		db = [[FMDatabase databaseWithPath:[PathUtilities libraryFilePathWithFileName:JIAFENG_DB]] retain];
		
        
        DLog(@"OKOKOKL = %@",[PathUtilities documentFilePathWithFileName:JIAFENG_DB]);
        //document
        db = [[FMDatabase databaseWithPath:[PathUtilities documentFilePathWithFileName:JIAFENG_DB]] retain];
        
		if (![db open]) {
			DLog(@"Could not open db.");
			return nil;
		}
        
//		[db setShouldCacheStatements:YES];
		
		if ([db hadError]) {
			DLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
			return nil;
		}	
		
	}
	return self;
}



- (void)dealloc {
    
	[db release];
	[super dealloc];
}






- (BOOL)runSQL:(id) sqlStr{
    /*++
     sqlStr LIKE @"CREATE TABLE 'sipapplet' ('sipID' TEXT PRIMARY KEY  NOT NULL ,'sipName' TEXT,'sipIcon' TEXT,'sipDescription' TEXT,'sipHTML' TEXT,'sipVersion' TEXT,'sipDownload' TEXT)"
     --*/
    /*++
     sqlStr LIKE @"DROP TABLE 'sipapplet'"
     --*/
    /*++
     sqlStr LIKE @"INSERT INTO sipapplet VALUES('%@','%@','%@','%@','%@','%@','%@')"
     @"insert into TabelBarCode('barcode','location','time')values('%@','%@','%@')"
     --*/
    /*++
     sqlStr LIKE @"DELETE FROM sipapplet WHERE sipID='%@'"
     --*/
    /*++
     sqlStr LIKE @"UPDATE sipapplet SET sipDescription='%@' WHERE sipID='%@'"
     --*/
    if (![db executeUpdate:sqlStr]) {
        DLog(@"未执行成功的语句是:%@",sqlStr);
        return NO;
    }
    return YES;
}



-(NSMutableArray *)queryDataToArray:(NSString*)sqlStr{
    /*++
     sqlStr LIKE @"SELECT * FROM sipapplet"
     --*/
    NSMutableArray *objArray=nil;
    
    FMResultSet *rs = [db executeQuery:sqlStr];
    
    if (rs==nil) {
        
        DLog(@"Could not query RS.");
        
        DLog(@"未执行成功的语句是:%@",sqlStr);
        
        return nil;
    }
    
    objArray=[[[NSMutableArray alloc] init] autorelease];
    
    while ([rs next]) {
        
        NSMutableArray *tempArray=[[NSMutableArray alloc] init];
        
        for (int columnIdx=0; columnIdx<[rs columnCount]; columnIdx++) {
            
            [tempArray addObject:[rs objectForColumnIndex:columnIdx]];
            
        }
        
        [objArray addObject:tempArray];
        
        [tempArray release];
    }
    
    [rs close];
    
    return objArray;
}

-(NSMutableArray *)queryDataToDictionary:(NSString*)sqlStr{
    /*++
     sqlStr LIKE @"SELECT * FROM sipapplet"
     --*/
    FMResultSet *rs = [db executeQuery:sqlStr];
    if (rs==nil) {
        
        DLog(@"Could not query RS.");
        
        DLog(@"未执行成功的语句是:%@",sqlStr);
        
        return nil;
    }
    
    NSMutableArray *resultArray=nil;
    
    while ([rs next]) {
        
        if(resultArray ==nil)
        {
            
            resultArray = [[[NSMutableArray alloc] init] autorelease];
        }
        
        NSMutableDictionary *objDict=[[NSMutableDictionary alloc] init];
        
        for (int columnIdx=0; columnIdx<[rs columnCount]; columnIdx++) {
            
            [objDict setValue:[rs objectForColumnIndex:columnIdx] forKey:[rs columnNameForIndex:columnIdx]];
        }
        
        [resultArray addObject:objDict];
        
        [objDict release];
    }
    
    [rs close];
    
    return resultArray;
}



-(NSMutableArray *)queryDataToObjArrary:(NSString*)sqlStr type:(Class)type{
    /*++
     sqlStr LIKE @"SELECT * FROM sipapplet"
     --*/
    FMResultSet *rs = [db executeQuery:sqlStr];
    
    
    if (rs==nil) {
        
        DLog(@"Could not query RS.");
        
        DLog(@"未执行成功的语句是:%@",sqlStr);
        
        return nil;
    }
    
    NSMutableArray *resultArray=nil;
    
    while ([rs next]) {
        
        if(resultArray ==nil)
        {
            
            resultArray = [[[NSMutableArray alloc] init] autorelease];
        }
        
        
        id object = [[type alloc] init];
        
         
        for (int columnIdx=0; columnIdx<[rs columnCount]; columnIdx++) {
                         
            if([ [rs columnNameForIndex:columnIdx] hasPrefix:@"is"]){

                NSNumber *isbool = [NSNumber numberWithBool:[[rs stringForColumnIndex:columnIdx] isEqualToString:@"1"]?YES:NO];
                
//                DLog(@"isbool  %@",isbool);
                
                [object setValue:isbool forKey:[rs columnNameForIndex:columnIdx]];

//               DLog(@"setValue %@ forKey:%@",[rs stringForColumnIndex:columnIdx],[rs columnNameForIndex:columnIdx] );
                
            }
            
            else{

                [object setValue:[rs objectForColumnIndex:columnIdx] forKey:[rs columnNameForIndex:columnIdx]];
                
            }
           
        }
        

        [resultArray addObject:object];
        
        [object release];
    }
    
    [rs close];
    
    return resultArray;
}

-(id)queryDataToObj:(NSString*)sqlStr type:(Class)type{
    /*++
     sqlStr LIKE @"SELECT * FROM sipapplet"
     --*/
    FMResultSet *rs = [db executeQuery:sqlStr];
    
    
    if (rs==nil) {
        
        DLog(@"Could not query RS.");
        
        DLog(@"未执行成功的语句是:%@",sqlStr);
        
        return nil;
    }
    
    
    
    id object = [[[type alloc] init] autorelease];
    
    while ([rs next]) {

        for (int columnIdx=0; columnIdx<[rs columnCount]; columnIdx++) {
            
            if([ [rs columnNameForIndex:columnIdx] hasPrefix:@"is"]){
                
                NSNumber *isbool = [NSNumber numberWithBool:[[rs stringForColumnIndex:columnIdx] isEqualToString:@"1"]?YES:NO];
                
                //                DLog(@"isbool  %@",isbool);
                
                [object setValue:isbool forKey:[rs columnNameForIndex:columnIdx]];
                
                //               DLog(@"setValue %@ forKey:%@",[rs stringForColumnIndex:columnIdx],[rs columnNameForIndex:columnIdx] );
                
            }
            
            else{
                
                [object setValue:[rs objectForColumnIndex:columnIdx] forKey:[rs columnNameForIndex:columnIdx]];
                
            }
            
        }
        
  
    }
    
    [rs close];
    
    return object;
}





@end