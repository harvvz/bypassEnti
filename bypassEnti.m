#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface BYPassEntitlementsHook : NSObject
@end

@implementation BYPassEntitlementsHook

+ (void)load {
static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
Class targetClass = objc_getClass("INVocabulary");
if (!targetClass) {
return;
}

// Hook the sharedVocabulary class method
SEL originalSelector = @selector(sharedVocabulary);
SEL swizzledSelector = @selector(replacement_sharedVocabulary);

Method originalMethod = class_getClassMethod(targetClass, originalSelector);
Method swizzledMethod = class_getClassMethod(self, swizzledSelector);

if (originalMethod && swizzledMethod) {
method_exchangeImplementations(originalMethod, swizzledMethod);
}
});
}

+ (id)replacement_sharedVocabulary {
// Return nil to avoid triggering the entitlement check crash,
// ensuring the app handles the absence of the Siri capability gracefully.
return nil;
}

@end

