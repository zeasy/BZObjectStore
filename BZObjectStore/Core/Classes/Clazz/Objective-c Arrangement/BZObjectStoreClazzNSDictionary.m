//
// The MIT License (MIT)
//
// Copyright (c) 2014 BONZOO.LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "BZObjectStoreClazzNSDictionary.h"
#import <FMResultSet.h>
#import "BZObjectStoreConst.h"
#import "BZObjectStoreRuntimeProperty.h"

@implementation BZObjectStoreClazzNSDictionary

- (NSEnumerator*)objectEnumeratorWithObject:(NSDictionary*)object
{
    return [object objectEnumerator];
}
- (NSArray*)keysWithObject:(NSDictionary*)object
{
    return [object allKeys];
}
- (id)objectWithObjects:(NSArray*)objects keys:(NSArray*)keys initializingOptions:(NSString*)initializingOptions
{
    return [NSDictionary dictionaryWithObjects:objects forKeys:keys];
}
- (Class)superClazz
{
    return [NSDictionary class];
}
- (NSString*)attributeType
{
    return NSStringFromClass([self superClazz]);
}
- (BOOL)isArrayClazz
{
    return YES;
}
- (BOOL)isRelationshipClazz
{
    return YES;
}

- (NSArray*)storeValuesWithValue:(NSDictionary*)value attribute:(BZObjectStoreRuntimeProperty*)attribute
{
    if ([[value class] isSubclassOfClass:[NSDictionary class]]) {
        return @[[NSNumber numberWithUnsignedInteger:value.count]];
    }
    return @[[NSNumber numberWithUnsignedInteger:0]];
}

- (NSString*)sqliteDataTypeName
{
    return SQLITE_DATA_TYPE_INTEGER;
}

@end