/*
  Jonathan Bauman
  Advanced Programming Workshop : Swift
  Section 6
  primeFinder with closures
 */

import Foundation

var numOutputs = 0
var numOfPrimes = 0
var numNonPrimes = 0
var listOfNumbers:[Int] = []
var showLargestSmallest = false
print("Please enter a number...")
// readline function returns an Optional String


func readNumbers(using label: String, for process: (Int)->Bool){
    var fullList:[Int] {
        return listOfProcessPassers + listOfProcessFailures
    }
    var listOfProcessPassers:[Int] = []
    var listOfProcessFailures:[Int] = []

    while let response = readLine(){
        if response == "0"{
            break
        }
        
        guard let int = convertToInt(response) else{
            print(response, "Invalid")
            continue
        }
        let isValid = process(int)
        print(isValid, int)
        if isValid{
            listOfProcessPassers.append(int)
            print("\(int) is \(label)!")
          }
        else{
            listOfProcessFailures.append(int)
            print("\(int) is not \(label)!")
        }
        
    }

    print("The total entries: ", fullList.count)
    print("The total number of \(label) numbers entered: ", listOfProcessPassers.count)
    print("The total number of Not \(label) numbers entered: ", listOfProcessFailures.count)
    print("The largest \(label) Number:", listOfProcessPassers.max() ?? 0)
    print("The smallest \(label) Number:", listOfProcessPassers.min() ?? 0)
}

readNumbers(using : "Prime", for: isPrime)
readNumbers(using : "Even", for: isEven)
readNumbers(using : "Divisble by 5", for: divisibleByFive)

func isEven(_ int: Int) -> Bool {
  return int%2 == 0
}

func divisibleByFive(_ int : Int) -> Bool {
    return int%5 == 0
}

func isPrime(_ num: Int) -> Bool{
    var primeFlag = false
    
    if num != 0{
        if num > 1 {
            for i in 2..<num{
                if (num % i == 0) {
                    primeFlag = false;
                    break
                }else {
                    primeFlag = true
                }
            }
        }
        
        if  num == 2 {
            primeFlag = true
        }
        
        return primeFlag
    }
    return false
}

func convertToInt(_ input: String) -> Int?{
    let integerValue = Int(input)
    let doubleValue = Double(input)
    if let doubleValue = doubleValue{
        if floor(doubleValue) > 0.000001, doubleValue.truncatingRemainder(dividingBy:1)==0
        {
            return Int(doubleValue)
        }
        return integerValue
    }
    return nil
  }
