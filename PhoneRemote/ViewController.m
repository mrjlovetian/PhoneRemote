//
//  ViewController.m
//  PhoneRemote
//
//  Created by Mr on 2017/7/19.
//  Copyright © 2017年 Mr. All rights reserved.
//

#import "ViewController.h"
#import "RemoteSender.h"
#import <AsyncNetwork/AsyncClient.h>

@interface ViewController ()<AsyncClientDelegate>
@property(nonatomic, strong) RemoteSender *remoteSender;

@property (nonatomic, strong)AsyncClient *client;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(69, 69, 60, 45);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.remoteSender = [[RemoteSender alloc] init];
    
//    self.client = [AsyncClient new];
//    self.client.delegate = self;
//    self.client.serviceType = @"_ClientServer._tcp";
//    [self.client start];
    
}

- (void)start
{
    self.client.delegate = self;
    self.client.serviceType = @"_ClientServer._tcp";
    [self.client start];
}


- (void)dealloc
{
    [self.client stop];
    self.client.delegate = nil;
}

- (void)clickBtn
{
    NSDictionary *theDictionaryToSendToTV = @{@"name": @"余洪江",@"age": @"27", @"address":@"杭州", @"出生年月":@"1990-01-13"};
    [self.remoteSender sendInfo:theDictionaryToSendToTV];
    

//    [self.client sendObject:theDictionaryToSendToTV];
}


#pragma mark AsyncClientDelegate
/*- (BOOL)client:(AsyncClient *)theClient didFindService:(NSNetService *)service moreComing:(BOOL)moreComing
{
    NSLog(@"服务器名称：%@   服务器%@", service.hostName, service);
    return YES;
}

- (void)client:(AsyncClient *)theClient didRemoveService:(NSNetService *)service
{
    NSLog(@"服务器移除");
}

- (void)client:(AsyncClient *)theClient didConnect:(AsyncConnection *)connection
{
    // display log entry
    NSLog(@"服务器连接中");
    NSString *string = [NSString stringWithFormat:@"[connected to %@]\n", connection.netService.name];
    NSLog(@"%@", string);
}

- (void)client:(AsyncClient *)theClient didDisconnect:(AsyncConnection *)connection
{
    NSLog(@"服务器断开连接");
    // display log entry
    NSString *string = [NSString stringWithFormat:@"[disconnected from %@]\n", connection.netService.name];
    NSLog(@"%@", string);
    
    [self start];
}

- (void)client:(AsyncClient *)theClient didReceiveCommand:(AsyncCommand)command object:(id)object connection:(AsyncConnection *)connection
{
    NSLog(@"接收到的数据%@", object);
}

- (void)client:(AsyncClient *)theClient didReceiveCommand:(AsyncCommand)command object:(id)object connection:(AsyncConnection *)connection responseBlock:(AsyncNetworkResponseBlock)block
{
    NSLog(@"接收到的数据%@ 含有block", object);
}

- (void)client:(AsyncClient *)theClient didFailWithError:(NSError *)error
{
    NSString *string = [NSString stringWithFormat:@"[error] %@\n", error.localizedDescription];
    NSLog(@"%@", string);

}*/


@end
