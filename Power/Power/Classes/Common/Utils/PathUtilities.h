//
//  PathUtilities.h
//  TaiPing
//
//  Created by bbdtek on 11-8-31.
//  Copyright 2011 bbdtek. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ZipArchive.h"

@interface PathUtilities : NSObject 

+(NSMutableDictionary *)readPlistWithFile:(NSString*)filename_ ;

+(NSMutableDictionary *)readPlist:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_  ;


+(NSString *)readPlistForKey:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ wihtKey:(NSString*)key_ ;


+(void)updatePlist:(NSSearchPathDirectory)searchPathDirectory_ withFile:(NSString*)filename_ wihtKey:(NSString*)key_ withValue:(NSString*)value_;



+ (NSString *)documentFilePathWithFileName:(NSString*)fileName;

+ (BOOL)createDirectoryIfNotExistsAtPath:(NSString *)path;

//Open  XML OR txt File
+ (NSString *)openXMLWithFileName:(NSString *)fileName;

+ (NSString *)libraryFilePathWithFileName:(NSString*)fileName;

//Copy File
+ (void) copyDatabaseIfNeededWithFileName:(NSString*)fileName  SearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory;

//deleate Library
+ (void)deteleLibraryFile:(NSString*)fileName;


//Wirte File
+ (NSString *)writeToFile:(NSData *)data  withFileName:(NSString *) fileName;

//delete File
+ (void)deteleFile:(NSString*)fileName;

//imgUrl :  folderName:docunent   renFileName:文件重命名
+(BOOL)downloadFileAndSaveWithURL:(NSString*)imgUrl withDocument:(NSString*)folderName renFileName:(NSString*)fileName;


//update documents在appDelte中实现
//remove old file  move *.temp old name
+(void)updateFilesWithDocument:(NSString*)documents;


//unzip File
//+(void)unzipFile:(NSString*)fileName  toUnzipPath:(NSString*) unzipFile_ ;

//解压到制定目录
//+(void)unzipFile:(NSString*)fileName  SearchPathDirectory:(NSSearchPathDirectory)searchPathDirectory toUnzipPath:(NSString*) unzipFile_ ;

//将string保存成文件
+ (void)storeDataToDisk:(NSString *)dataStr_ withFilePath:(NSString *)filePath_;

//判断文件是否存在
+(BOOL)fileExifileExistsAtPath:(NSString *) filePath_;

//创建对应路径的文件夹
+(void)createFolder:(NSString *)folderPath_;

//读取文件为string
+(NSString *)queryDiskCache:(NSString *)filePath_;

//超时了返回NO， 不超时返回YES
+(BOOL)checkFileIsTimeOver:(NSString *)filePath_  withMaxAge:(NSInteger)maxAge_ ;

/**
 *	@brief	返回用户的头像路径
 *	@author	zhgz
 *
 *	@param 	accountName_
 *
 *	@return	用户的文件夹路径
 */
//+(NSString *)userPathWithAccountName:(NSString *)accountName_;

/**
 *	@brief	生成用户头像截图
 *	@author	zhgz
 *
 *	@param 	accountName_ 	用户
 *	@param 	image_ 	用户选择的原图
 */
//+(void)storeUserPhotoWithUserName:(NSString *)accountName_ withImage_:(UIImage *)image_;

/**
 *	@brief	返回客户的头像路径
 *	@author	xex
 *
 *	@param 	customerId_
 *
 *	@return	用户的文件夹路径
 */
+(NSString *)customerPathWithImageName:(NSString *)imageName_ withFolderString:(NSString *)folderString_ ;

/**
 *	@brief	客户管理头像
 *	@author	xex
 *
 *	@param 	image_ 	用户选择的原图
 */
//+(void)storeCustomerPhotoWithImage_:(UIImage *)image_ withCustomerId:(NSString *)customerId_ withFolderString:(NSString *)folderString_ ;


@end
