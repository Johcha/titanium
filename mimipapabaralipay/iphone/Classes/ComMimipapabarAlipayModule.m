/**
 * mimipapabaralipay
 *
 * Created by Your Name
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "ComMimipapabarAlipayModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation ComMimipapabarAlipayModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"a1da631e-d2b4-44da-823d-215edd9d368d";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.mimipapabar.alipay";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs
-(id)alipay:(id)args{
    
    ENSURE_SINGLE_ARG(args, NSDictionary);
    NSString *partner = [TiUtils stringValue:[args valueForKey:@"partner"]];
    NSString *seller = [TiUtils stringValue:[args valueForKey:@"seller"]];
    NSString *privateKey = [TiUtils stringValue:[args valueForKey:@"private_key"]];
    NSLog(partner);
    NSLog(seller);
    NSLog(privateKey);
    
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        /*
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
         message:@"缺少partner或者seller或者私钥。"
         delegate:self
         cancelButtonTitle:@"确定"
         otherButtonTitles:nil];
         [alert show];
         */
        NSLog(@"缺少partner或者seller或者私钥。");
        return;
    }
    
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [TiUtils stringValue:[args valueForKey:@"id"]]; //订单ID（由商家自行制定）
    order.productName = [TiUtils stringValue:[args valueForKey:@"subject"]]; //商品标题
    order.productDescription = [TiUtils stringValue:[args valueForKey:@"desc"]]; //商品描述
    order.amount = [TiUtils stringValue:[args valueForKey:@"price"]]; //商品价格
    order.notifyURL =  [TiUtils stringValue:[args valueForKey:@"notify_url"]]; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
//    <dict>
//    <key>CFBundleURLName</key>
//    <string>mmppb</string>
//    <key>CFBundleURLSchemes</key>
//    <array>
//    <string>mimipapabar</string>
//    </array>
//    </dict>
    NSString *appScheme = @"mimipapabar";//[TiUtils stringValue:[args valueForKey:@"mmppb"]];
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    NSLog(privateKey);
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        NSLog(@"orderString = %@",orderString);
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
//            [super fireEvent:@"alipay:pay_success" withObject:resultDic propagate:YES];
        }];
    }
    
    
    return @"ok";
}

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

@end
