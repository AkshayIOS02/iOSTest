import UIKit


//MARK: #C
///The function takes two arrays of generic type T as input, where T conforms to the Equatable and Hashable and Comparable protocols.

func checkValuePresentOrNot<T: Equatable & Hashable & Comparable>(array1: [T], array2: [T]) -> [T]
{
    var dict1: [T: Int] = [:]
    
    for value in array1 {
        dict1[value, default: 0] += 1
    }
    
    var dict2: [T: Int] = [:]
    
    for value in array2 {
        dict2[value, default: 0] += 1
    }
    
    var missingArray: [T] = []
    
    for (key, value) in dict2 {
        if dict1[key, default: 0] < value {
            
            missingArray.append(key)
        }
    }
    return missingArray.sorted()
}


//TODO: Test case 1: array1 and array2 are empty.
let test1:[Int] = checkValuePresentOrNot(array1: [], array2: [])
debugPrint(test1) //print vlaue is []

//TODO: Test case 2: array1 is empty, array2 contains one element.
let test2:[Int] = checkValuePresentOrNot(array1: [], array2: [1])
debugPrint(test2) //print vlaue is [1]

//TODO: Test case 3: array1 and array2 contain the same elements.
let testt3:[Int] = checkValuePresentOrNot(array1: [1, 2, 3], array2: [1, 2, 3])
debugPrint(testt3) //print vlaue is []

//TODO: Test case 4: array1 and array2 contain the same elements, but in a different order.
let test4:[Int] = checkValuePresentOrNot(array1: [3, 2, 1], array2: [1, 2, 3])
debugPrint(test4) //print vlaue is []

//TODO: Test case 5: array1 and array2 contain different elements.
let test5:[Int] = checkValuePresentOrNot(array1: [1, 2, 3], array2: [4, 5, 6])
debugPrint(test5) //print vlaue is [4, 5, 6]


