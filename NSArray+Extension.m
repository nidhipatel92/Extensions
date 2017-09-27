//
//  NSArray+Extension.m
//  ExtensionObjC
//
//  Created by Nidhi on 8/21/17.


#import "NSArray+Extension.h"

@implementation NSArray (Extension)

//In this same object remove not value of object remove
-(NSArray *)removeDuplicateObject
{
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:self];
    NSArray *arrayWithoutDuplicates = [orderedSet array];
    orderedSet = nil;
    return arrayWithoutDuplicates;
}

//Remove duplicate key value of object
- (NSArray *)removeDuplicateObjectByKey:(NSString *) key
{
    NSMutableSet *tempValues = [[NSMutableSet alloc] init];
    NSMutableArray *retData = [NSMutableArray array];
    for(id obj in self)
    {
        if(! [tempValues containsObject:[obj valueForKey:key]]) //Match value
        {
            [tempValues addObject:[obj valueForKey:key]];
            [retData addObject:obj];
        }
    }
    tempValues = nil;
    return retData;
}

-(NSString *)convertToString
{
    return [self componentsJoinedByString:@" "];
}

//Assending Array
-(NSArray *)ascendingArray
{
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

//Dessending Array
-(NSArray *)descendingArray
{
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(localizedCompare:)];
    return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

//Ascending  desending Array with key value pass
-(NSArray *)ascendingArrayWithKeyValue:(NSString *)key ascending:(BOOL)isAscending
{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:key ascending:isAscending];
    return [self sortedArrayUsingDescriptors:@[sort]];
}



@end
