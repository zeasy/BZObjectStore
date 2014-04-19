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

#import "BZObjectStoreClazzID.h"
#import "FMResultSet.h"
#import "BZObjectStoreConst.h"
#import "BZObjectStoreRuntimeProperty.h"

@implementation BZObjectStoreClazzID

- (Class)superClazz
{
    return NULL;
}
- (NSString*)attributeType
{
    return nil;
}
- (BOOL)isObjectClazz
{
    return YES;
}
- (BOOL)isRelationshipClazz
{
    return YES;
}
- (BOOL)isSimpleValueClazz
{
    return YES;
}
- (id)storeValueWithValue:(NSObject*)value
{
    BZObjectStoreClazz *osclazz = [BZObjectStoreClazz osclazzWithClazz:[value class]];
    if (osclazz && [osclazz class] != [self class]) {
        return [osclazz storeValueWithValue:value];
    } else {
        return [NSNull null];
    }
}

- (id)valueWithStoreValue:(NSObject*)value
{
    BZObjectStoreClazz *osclazz = [BZObjectStoreClazz osclazzWithClazz:[value class]];
    if (osclazz && [osclazz class] != [self class]) {
        return [osclazz valueWithStoreValue:value];
    } else {
        return [NSNull null];
    }
}

- (NSArray*)storeValuesWithObject:(NSObject*)object attributeName:(NSString*)attributeName
{
    return @[[self storeValueWithValue:[object valueForKey:attributeName]]];
}

- (id)valueWithResultSet:(FMResultSet*)resultSet attribute:(BZObjectStoreRuntimeProperty*)attribute
{
    return [self valueWithStoreValue:[resultSet objectForColumnName:attribute.columnName]];
}

- (NSString*)sqliteDataTypeName
{
    return SQLITE_DATA_TYPE_BLOB;
}

@end