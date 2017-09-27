//
//  NSMutableArray+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/21/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

#import "NSMutableArray+Extension.h"

@implementation NSMutableArray (Extension)

//Set mutablecopy
- (NSMutableArray *)setMutableData
{
    NSMutableArray *arrData = [[NSMutableArray alloc]init];
    NSMutableDictionary *dicData;
    for (NSDictionary *dict in self)
    {
        dicData = nil;
        dicData  = [[NSMutableDictionary alloc] initWithDictionary:dict];
        for (id key in dicData)
            [NSString stringWithString:[NSString stringWithFormat:@"%@",[dicData objectForKey:key]]];

        [arrData addObject:dicData];
    }
    return arrData;
}
//Replace Value to specific object value
-(NSMutableArray *)replaceValueWithKey:(NSString *)strKey byValue:(NSString *)strValue updateValue:(NSString *)strUpdateValue
{
    NSArray *arrOfKeyValue = [self valueForKeyPath:strKey];  // get data of all Key
    
    if ([arrOfKeyValue containsObject:strValue])
    {
        NSInteger indexOfValue = [arrOfKeyValue indexOfObject:strValue]; //get Index
        NSMutableDictionary *dic = self[indexOfValue];
        dic[strKey] = strUpdateValue; //Replace value
    }
    return self;
}

//Replace object to specific object value 
-(NSMutableArray *)replaceObjectWithKey:(NSString *)strKey byValue:(NSString *)strValue updateObject:(NSMutableDictionary *)dicObject
{
    NSArray *arrOfKeyValue = [[NSArray alloc]init];
    arrOfKeyValue = [self valueForKeyPath:strKey];  // get data of all Key
   
    if ([arrOfKeyValue containsObject:strValue])
    {
        NSInteger indexOfValue = [arrOfKeyValue indexOfObject:strValue]; //get Index
        [self replaceObjectAtIndex:indexOfValue withObject:dicObject]; //Replace object
    }
    return self;
}

//Insert object to First
-(NSMutableArray *)addFirstObject:(NSMutableDictionary *)dicObject
{
    [self insertObject:dicObject atIndex:0];
    return self;
}

//Insert object to Last
-(NSMutableArray *)addLastObject:(NSMutableDictionary *)dicObject
{
    NSUInteger count = self.count;
    [self insertObject:dicObject atIndex:count];
    return self;
}

//Insert object to specific value of object of Up/Down
-(NSMutableArray *)insertObjectToUpAndDown:(NSString *)strKey value:(NSString *)strValue updateObject:(NSMutableDictionary *)dicObject isUpDown:(BOOL)isUpInsertObject
{
    NSArray *arrOfKeyValue = [self valueForKeyPath:strKey];  // get data of all Key
    if ([arrOfKeyValue containsObject:strValue])
    {
        NSInteger indexOfValue = [arrOfKeyValue indexOfObject:strValue]; //get Index
        if (isUpInsertObject)
            [self insertObject:dicObject atIndex:indexOfValue+1]; //insert to up
        else
           [self insertObject:dicObject atIndex:indexOfValue]; //Insert to down
    }
    return self;
}

//Delete object using key-value
-(NSMutableArray *)deleteByObjectUsingKey:(NSString *)strKey value:(NSString *)strValue
{
    NSArray *arrOfKeyValue = [self valueForKeyPath:strKey];  // get data of all Key
   
    if ([arrOfKeyValue containsObject:strValue])
    {
        NSInteger indexOfValue = [arrOfKeyValue indexOfObject:strValue]; //get Index
        [self removeObjectAtIndex:indexOfValue]; //Remove object to specific value
    }
    
    return self;
}
//Assending Array
-(NSMutableArray *)ascendingArray;
{
    NSArray *arrSorting = [self sortedArrayUsingSelector:@selector(compare:)];
    return arrSorting.mutableCopy;
}

//Dessending Array
-(NSMutableArray *)descendingArray;
{
    NSArray *arrSorting = [[NSArray alloc]init];
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(localizedCompare:)];
    arrSorting = [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    return arrSorting.mutableCopy;
}

//Ascending/Descending Array with key value pass
-(NSMutableArray *)sortingArrayWithKeyValue:(NSString *)key ascending:(BOOL)isAscending;
{
    NSArray *arrSorting = [[NSArray alloc]init];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:key ascending:isAscending];
    arrSorting = [self sortedArrayUsingDescriptors:@[sort]];
    return arrSorting.mutableCopy;
}

//Search string value to array
-(NSMutableArray *)searchValueArray:(NSString *)strKey value:(NSString *)strValue
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS[cd] %@", strKey, strValue];
    NSArray *searchResults = [self filteredArrayUsingPredicate:resultPredicate];
    return searchResults.mutableCopy;
}

//Remove key and Replace key value
-(NSMutableArray *)removeReplaceKey:(NSString *)strKey remove:(BOOL)isRemove
{
    NSMutableArray *arrData = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in self)
    {
        NSMutableDictionary *dicData  = [NSMutableDictionary new];
        dicData = [dict mutableCopy];
        if (isRemove)
            [dicData removeObjectForKey:strKey];
        else
            dicData[strKey] = @"";

        [arrData addObject:dicData];
    }
    return arrData;
}

@end
