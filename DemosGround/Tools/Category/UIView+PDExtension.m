//
//  UIView+PDExtension.m
//  GDUMini
//
//  Created by ProFlight on 16/5/18.
//  Copyright © 2016年 ProFlight. All rights reserved.
//

#import "UIView+PDExtension.h"

@implementation UIView (PDExtension)

- (void)setPd_x:(CGFloat)pd_x
{
    CGRect rect = self.frame;
    rect.origin.x = pd_x;
    self.frame = rect;
}

- (CGFloat)pd_x
{
    return self.frame.origin.x;
}

- (void)setPd_y:(CGFloat)pd_y
{
    CGRect rect = self.frame;
    rect.origin.y = pd_y;
    self.frame = rect;
}

- (CGFloat)pd_y
{
    return self.frame.origin.y;
}

- (void)setPd_width:(CGFloat)pd_width
{
    CGRect rect = self.frame;
    rect.size.width = pd_width;
    self.frame = rect;
}

- (CGFloat)pd_width
{
    return self.frame.size.width;
}

- (void)setPd_height:(CGFloat)pd_height
{
    CGRect rect = self.frame;
    rect.size.height = pd_height;
    self.frame = rect;
}

- (CGFloat)pd_height
{
    return self.frame.size.height;
}

- (void)setPd_centerX:(CGFloat)pd_centerX
{
    CGPoint center = self.center;
    center.x = pd_centerX;
    self.center = center;
}

- (CGFloat)pd_centerX
{
    return self.center.x;
}

- (void)setPd_centerY:(CGFloat)pd_centerY
{
    CGPoint center = self.center;
    center.y = pd_centerY;
    self.center = center;
}

- (CGFloat)pd_centerY
{
    return self.center.y;
}


- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

@end

////////////////////////////////////////////////////////////////////////////////////////

#import <objc/runtime.h>

const char oldDelegateKey;
const char completionHandlerKey;

@implementation UIView (PDAlert)
-(void)showWithCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    if ([self isKindOfClass:[UIAlertView class]]) {
        UIAlertView *view = (UIAlertView *)self;
        [view show];
        
        if(completionHandler != nil)
        {
            id oldDelegate = objc_getAssociatedObject(self, &oldDelegateKey);
            if(oldDelegate == nil)
            {
                objc_setAssociatedObject(self, &oldDelegateKey, oldDelegate, OBJC_ASSOCIATION_ASSIGN);
            }
            
            view.delegate = self;
            objc_setAssociatedObject(self, &completionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY);
        }
        
    }else if ([self isKindOfClass:[UIActionSheet class]]) {
        UIActionSheet *view = (UIActionSheet *)self;
        [view showInView:[UIApplication sharedApplication].keyWindow];
        
        if(completionHandler != nil)
        {
            id oldDelegate = objc_getAssociatedObject(self, &oldDelegateKey);
            if(oldDelegate == nil)
            {
                objc_setAssociatedObject(self, &oldDelegateKey, oldDelegate, OBJC_ASSOCIATION_ASSIGN);
            }
            
            view.delegate = (id)self;
            objc_setAssociatedObject(self, &completionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY);
        }
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertView *view = (UIAlertView *)self;
    void (^theCompletionHandler)(NSInteger buttonIndex) = objc_getAssociatedObject(self, &completionHandlerKey);
    
    if(theCompletionHandler == nil)
        return;
    
    theCompletionHandler(buttonIndex);
    view.delegate = objc_getAssociatedObject(self, &oldDelegateKey);
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIActionSheet *view = (UIActionSheet *)self;
    void (^theCompletionHandler)(NSInteger buttonIndex) = objc_getAssociatedObject(self, &completionHandlerKey);
    
    if(theCompletionHandler == nil)
        return;
    
    theCompletionHandler(buttonIndex);
    view.delegate = objc_getAssociatedObject(self, &oldDelegateKey);
}

@end
