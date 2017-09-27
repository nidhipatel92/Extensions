//
//  NSMutableArray+Extension.h
//  ExtensionObjC
//
//  Created by Nidhi on 8/21/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Extension)
-(NSMutableArray *)setMutableData; 
-(NSMutableArray *)replaceValueWithKey:(NSString *)strKey byValue:(NSString *)strValue updateValue:(NSString *)strUpdateValue;
-(NSMutableArray *)replaceObjectWithKey:(NSString *)strKey byValue:(NSString *)strValue updateObject:(NSMutableDictionary *)dicObject;
-(NSMutableArray *)addFirstObject:(NSMutableDictionary *)dicObject;
-(NSMutableArray *)addLastObject:(NSMutableDictionary *)dicObject;
-(NSMutableArray *)insertObjectToUpAndDown:(NSString *)strKey value:(NSString *)strValue updateObject:(NSMutableDictionary *)dicObject isUpDown:(BOOL)isUpInsertObject;
-(NSMutableArray *)deleteByObjectUsingKey:(NSString *)strKey value:(NSString *)strValue;
-(NSMutableArray *)ascendingArray;
-(NSMutableArray *)descendingArray;
-(NSMutableArray *)sortingArrayWithKeyValue:(NSString *)key ascending:(BOOL)isAscending;
-(NSMutableArray *)searchValueArray:(NSString *)strKey value:(NSString *)strValue;
-(NSMutableArray *)removeReplaceKey:(NSString *)strKey remove:(BOOL)isRemove;
@end
