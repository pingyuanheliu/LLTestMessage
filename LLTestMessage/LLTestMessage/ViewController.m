//
//  ViewController.m
//  LLTestMessage
//
//  Created by LL on 2018/11/5.
//  Copyright © 2018年 LL. All rights reserved.
//

#import "ViewController.h"
#import "Test01ViewController.h"
#import "Test02ViewController.h"
#import "Test03ViewController.h"
#import "Test04ViewController.h"
#import "Test05ViewController.h"
#import "Test06ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *listTV;
//列表数组
@property (nonatomic, copy) NSArray *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"消息";
    _listArray = @[@"1、消息发送", @"2、向上转发", @"3、动态发送", @"4、备用转发", @"5、调用转发", @"6、不能识别"];
}



#pragma mark - 1、消息发送

/**
 消息发送
 */
- (void)testMessageSend {
    [self performSegueWithIdentifier:@"Show01" sender:nil];
}

#pragma mark - 2、向上转发

/**
 向上转发
 */
- (void)testMessageForwardUp {
    [self performSegueWithIdentifier:@"Show02" sender:nil];
}

#pragma mark - 3、动态发送

/**
 动态发送
 */
- (void)testMessageResolve {
    [self performSegueWithIdentifier:@"Show03" sender:nil];
}


#pragma mark - 4、备用转发

/**
 备用转发
 */
- (void)testMessageForwardTarget {
    [self performSegueWithIdentifier:@"Show04" sender:nil];
}

#pragma mark - 5、调用转发

/**
 调用转发
 */
- (void)testMessageForwardInvocation {
    [self performSegueWithIdentifier:@"Show05" sender:nil];
}

#pragma mark - 6、不能识别

/**
 不能识别
 */
- (void)testMessageDoesNotRecognize {
    [self performSegueWithIdentifier:@"Show06" sender:nil];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const Identifier = @"Cell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    id title = self.listArray[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0://1、消息发送
        {
            [self testMessageSend];
        }
            break;
        case 1://2、向上转发
        {
            [self testMessageForwardUp];
        }
            break;
        case 2://3、动态发送
        {
            [self testMessageResolve];
        }
            break;
        case 3://4、备用转发
        {
            [self testMessageForwardTarget];
        }
            break;
        case 4://5、调用转发
        {
            [self testMessageForwardInvocation];
        }
            break;
        case 5://6、不能识别
        {
            [self testMessageDoesNotRecognize];
        }
            break;
        default:
            break;
    }
}

@end
