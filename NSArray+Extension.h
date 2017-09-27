//
//  NSArray+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/21/17.

#import <Foundation/Foundation.h>

@interface NSArray (Extension)
-(NSArray *)removeDuplicateObject;
-(NSArray *)removeDuplicateObjectByKey:(NSString *) key;
-(NSArray *)descendingArray;
-(NSArray *)ascendingArray;
-(NSArray *)ascendingArrayWithKeyValue:(NSString *)key ascending:(BOOL)isAscending;
-(NSString *)convertToString;
@end
