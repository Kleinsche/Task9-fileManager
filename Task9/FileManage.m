//
//  FileManage.m
//  Task9
//
//  Created by 🍋 on 2016/11/27.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "FileManage.h"

@implementation FileManage


- (void)createFolder {
    NSString * folderPath = [path stringByAppendingString:@"/创建目录"];
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
}

- (void)createFile {
    NSString * filePath = [path stringByAppendingString:@"/创建文件.txt"];
    NSFileManager * fileManager = [[NSFileManager alloc]init];
    [fileManager createFileAtPath:filePath contents:nil attributes:nil];
}

- (void)writeToFile {
    NSString * path1 = [path stringByAppendingString:@"/字符串.txt"];
    NSString *str= @"www.baidu.com";
    [str writeToFile:path1 atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString * path2 = [path stringByAppendingString:@"/字典.plist"];
    NSDictionary * dict = @{@"xiaoming":@"20",@"xiaoli":@"21"};
    [dict writeToFile:path2 atomically:YES];
    
    NSString * path3 = [path stringByAppendingString:@"/数组.plist"];
    NSArray * array = @[@"1",@"2",@"3",@"4"];
    [array writeToFile:path3 atomically:YES];
}

- (void)readFromFile {
    NSString * readPath1 = [path stringByAppendingString:@"/字符串.txt"];
    NSString * readPath2 = [path stringByAppendingString:@"/字典.plist"];
    NSString * readPath3 = [path stringByAppendingString:@"/数组.plist"];
    NSLog(@"%@",[NSString stringWithContentsOfFile:readPath1 encoding:NSUTF8StringEncoding error:nil]);
    NSLog(@"%@",[NSDictionary dictionaryWithContentsOfFile:readPath2]);
    NSLog(@"%@",[NSArray arrayWithContentsOfFile:readPath3]);
}

//遍历目录
- (void)achieveDirectory {
    NSString * filePath = path;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator * files = [fileManager enumeratorAtPath:filePath];
    for(NSString * str in files){
        NSLog(@"%@", str);
    }
}

- (void)judgeExist {
    NSString *strDoc = [path stringByAppendingString:@"/创建文件.txt"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:strDoc]) {
        NSLog(@"创建文件存在");
    }else{
        NSLog(@"创建文件不存在");
    }
}

- (void)countFileSize {
    NSString * filePath = [path stringByAppendingString:@"/数组.plist"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSLog(@"%llu字节",[fileManager attributesOfItemAtPath:filePath error:nil].fileSize);
}

- (void)countFolderSize {
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator * files = [fileManager enumeratorAtPath:path];
    unsigned long long size = 0;
    for(NSString * str in files){
        NSString * filePath = [path stringByAppendingPathComponent:str];
        size += [fileManager attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    NSLog(@"Documents:%llu字节", size);
}

- (void)deleteFile {
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator * files = [fileManager enumeratorAtPath:path];
    for (NSString * str in files) {
        [fileManager removeItemAtPath:[path stringByAppendingPathComponent:str] error:nil];
    }
    
}

- (void)moveFile {
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator * files = [fileManager enumeratorAtPath:path];
    for (NSString * str in files) {
        if ([str containsString:@"txt"]||[str containsString:@"plist"]) {
    [fileManager moveItemAtPath:[path stringByAppendingPathComponent:str] toPath:[path stringByAppendingString:[NSString stringWithFormat:@"/创建目录/%@",str]] error:nil];
        }
    }
}

@end
