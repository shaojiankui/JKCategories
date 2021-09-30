//
//  NSURLSession+SynchronousTask.h
//
//  Copyright (c) 2015 Florian Schliep (http://floschliep.com/)
//                                    

/**
 Reference: <https://github.com/floschliep/NSURLSession-SynchronousTask>
 为 NSURLSession 添加类似 NSURLConnection 的同步任务。
 */
#import <Foundation/Foundation.h>

@interface NSURLSession (JKSynchronousTask)

#pragma mark - NSURLSessionDataTask

- (nullable NSData *)jk_sendSynchronousDataTaskWithURL:(nonnull NSURL *)url
                                     returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response
                                                 error:(NSError *_Nullable __autoreleasing*_Nullable)error;

- (nullable NSData *)jk_sendSynchronousDataTaskWithRequest:(nonnull NSURLRequest *)request
                                         returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response
                                                     error:(NSError *_Nullable __autoreleasing*_Nullable)error;

#pragma mark - NSURLSessionDownloadTask

- (nullable NSURL *)jk_sendSynchronousDownloadTaskWithURL:(nonnull NSURL *)url
                                        returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response
                                                    error:(NSError *_Nullable __autoreleasing *_Nullable)error;

- (nullable NSURL *)jk_sendSynchronousDownloadTaskWithRequest:(nonnull NSURLRequest *)request
                                            returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response
                                                        error:(NSError *_Nullable __autoreleasing *_Nullable)error;

#pragma mark - NSURLSessionUploadTask

- (nullable NSData *)jk_sendSynchronousUploadTaskWithRequest:(nonnull NSURLRequest *)request
                                                    fromFile:(nonnull NSURL *)fileURL
                                           returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response
                                                       error:(NSError *_Nullable __autoreleasing *_Nullable)error;

- (nullable NSData *)jk_sendSynchronousUploadTaskWithRequest:(nonnull NSURLRequest *)request
                                                    fromData:(nonnull NSData *)bodyData
                                           returningResponse:(NSURLResponse *_Nullable __autoreleasing *_Nullable)response
                                                       error:(NSError *_Nullable __autoreleasing *_Nullable)error;

@end
