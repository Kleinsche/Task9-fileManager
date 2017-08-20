//
//  FileManage.h
//  Task9
//
//  Created by 🍋 on 2016/11/27.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManage : NSObject
#define path [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

- (void)createFolder;
- (void)createFile;
- (void)writeToFile;//字符串、字典、数组
- (void)readFromFile;
- (void)achieveDirectory;
- (void)judgeExist;
- (void)countFileSize;
- (void)countFolderSize;
- (void)deleteFile;
- (void)moveFile;

@end
