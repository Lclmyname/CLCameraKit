//
//  CLQueue.m
//  CLDownloadManager
//
//  Created by apple on 16/7/4.
//  Copyright © 2016年 刘朝龙. All rights reserved.
//

#import "CLQueue.h"

@implementation CLQueue

- (instancetype)initQueueWithDownloadURL:(NSString *)url path:(NSString *)path
{
    return [self initQueueWithDownloadURL:url path:path model:NULL];
}

- (instancetype)initQueueWithDownloadURL:(NSString *)url name:(NSString *)name
{
    return [self initQueueWithDownloadURL:url name:name model:NULL];
}

- (instancetype)initQueueWithDownloadURL:(NSString *)url folder:(NSString *)folder name:(NSString *)name
{
    return [self initQueueWithDownloadURL:url folder:folder name:name model:NULL];
}

- (instancetype)initQueueWithDownloadURL:(NSString *)url name:(NSString *)name model:(id)model
{
    return [self initQueueWithDownloadURL:url folder:NULL name:name model:NULL];
}

- (instancetype)initQueueWithDownloadURL:(NSString *)url path:(NSString *)path model:(id)model
{
    if (self = [super init]) {
        
        self.url  = url;
        self.path = path;
        self.model= model;
        
    }
    
    return self;
}

- (instancetype)initQueueWithDownloadURL:(NSString *)url folder:(NSString *)folder name:(NSString *)name model:(id)model
{
    if (self = [super init]) {
        
        NSString *folderPath = [NSString stringWithFormat:@"/%@",folder];
        NSString *namePath   = [NSString stringWithFormat:@"/%@",name];
        
        self.url = url;
        self.folder = folder;
        self.name= name;
        self.path= [[[self library] stringByAppendingPathComponent:folderPath] stringByAppendingPathComponent:namePath];
        
    }
    
    return self;
}

#pragma mark - getter and setter
- (void)setFolder:(NSString *)folder
{
    NSString *folderPath = [NSString stringWithFormat:@"/%@",folder];
    NSString *namePath   = [NSString stringWithFormat:@"/%@",self.name];
    _folder = folder;
    self.path = [[[self library] stringByAppendingPathComponent:folderPath] stringByAppendingPathComponent:namePath];
}

- (void)setName:(NSString *)name
{
    NSString *namePath   = [NSString stringWithFormat:@"/%@",name];
    _name = name;
    self.path = [[self library] stringByAppendingPathComponent:namePath];
}


#pragma mark - private method
- (NSString *)library
{
    
    NSString *libraryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    return libraryPath;
    
}

@end
