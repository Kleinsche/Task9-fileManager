//
//  ViewController.m
//  Task9
//
//  Created by 🍋 on 2016/11/27.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ViewController.h"
#import "FileManage.h"

@interface ViewController ()
@property (nonatomic,strong) FileManage * file;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.file = [[FileManage alloc]init];
}

- (IBAction)achDocAction:(id)sender {
        NSLog(@"%@",path);
}

- (IBAction)achieveDirectory:(id)sender {
    [self.file achieveDirectory];
}

- (IBAction)writeAction:(id)sender {
    [self.file writeToFile];
}

- (IBAction)readAction:(id)sender {
    [self.file readFromFile];
}

- (IBAction)createFileAction:(id)sender {
    [self.file createFile];
}

- (IBAction)judgeExistAction:(id)sender {
    [self.file judgeExist];
}

- (IBAction)fileSizeAction:(id)sender {
    [self.file countFileSize];
}

- (IBAction)folderSizeAction:(id)sender {
    [self.file countFolderSize];
}

- (IBAction)createFolderAction:(id)sender {
    [self.file createFolder];
}

- (IBAction)moveAction:(id)sender {
    [self.file moveFile];
}

- (IBAction)deleteAction:(id)sender {
    [self.file deleteFile];
}


@end
