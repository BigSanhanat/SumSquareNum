//
//  ViewModel.swift
//  SumSquareNum
//
//  Created by Sanhanat Ngamchaiwong on 18/11/2566 BE.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func setOutputText(text: String)
    func setExplanation(text: String)
}

class ViewModel {
    var viewDelegate: ViewModelDelegate! = nil
    var n = ""
    var number = 0
    var resultNum = [[Int]]() {
        didSet {
            findBestSolution()
        }
    }
    var finishResult: [Int] = [] {
        didSet {
            prepareExplanation()
        }
    }
    init(viewDelegate: ViewModelDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    func calculateWithNumber(number: Int) {
        n = "\(number)"
        self.number = number
        resultNum = []
        var squareNumbers = [Int]()
        var n = 2
        repeat {
            let squareN = n*n
            squareNumbers.append(squareN)
            n += 1
        } while n*n <= number
        
        firstSolution(squareNum: squareNumbers)
        secondSolution(squareNum: squareNumbers)
        thirdSolution(squareNum: squareNumbers)
//        print(squareNumber)
    }
    
    private func firstSolution(squareNum: [Int]) {
        var firstResult = [Int]()
        for i in squareNum {
            print("\(self.number) \(i) \(self.number - i)")
            if i <= self.number {
                firstResult.append(i)
                self.number = self.number - i
                if self.number > 0 {
                    firstSolution(squareNum: squareNum)
                } else {
                    if firstResult.count > 0 {
                        resultNum.append(firstResult)
                    }
                    
//                    viewDelegate.setOutputText(text: "Output : \(resultNum.count)")
//                    prepareExplanation()
//                    return
                }
            } else if number > 0 && number < 4 {
                firstResult.append(1)
                self.number = self.number - 1
                if self.number > 0 {
                    firstSolution(squareNum: squareNum)
                } else {
                    if firstResult.count > 0 {
                        resultNum.append(firstResult)
                    }
//                    viewDelegate.setOutputText(text: "Output : \(resultNum.count)")
//                    prepareExplanation()
//                    return
                }
            }
        }
    }
    
    private func secondSolution(squareNum: [Int]) {
        var secondResult = [Int]()
        for i in squareNum {
            print("\(self.number) \(i) \(self.number - i)")
            if i <= self.number {
                secondResult.append(i)
                self.number = self.number - i
                if self.number > 0 {
                    secondSolution(squareNum: squareNum)
                } else {
                    if secondResult.count > 0 {
                        resultNum.append(secondResult)
                    }
                    
//                    viewDelegate.setOutputText(text: "Output : \(resultNum.count)")
//                    prepareExplanation()
//                    return
                }
            } else if number > 0 && number < 4 {
                secondResult.append(1)
                self.number = self.number - 1
                if self.number > 0 {
                    secondSolution(squareNum: squareNum)
                } else {
                    if secondResult.count > 0 {
                        resultNum.append(secondResult)
                    }
//                    viewDelegate.setOutputText(text: "Output : \(resultNum.count)")
//                    prepareExplanation()
//                    return
                }
            }
        }
    }
    
    private func thirdSolution(squareNum: [Int]) {
        var thirdResult = [Int]()
        repeat {
            for i in squareNum {
                if i <= self.number {
                    thirdResult.append(i)
                    self.number = self.number - i
                } else if number > 0 && number < 4 {
                    thirdResult.append(1)
                    self.number = self.number - 1
                } else if number > 0 {
                    thirdSolution(squareNum: squareNum)
                }
            }
        } while (self.number > 0)
        if thirdResult.count > 0 {
            resultNum.append(thirdResult)
        }
        
//        viewDelegate.setOutputText(text: "Output : \(resultNum.count)")
//        prepareExplanation()

    }
    
    private func findBestSolution() {
        let sortSolution = resultNum.sorted(by: {$0.count < $1.count})
        if let result = sortSolution.first {
            finishResult = result
        }
        
    }
    
    func prepareExplanation() {
        viewDelegate.setOutputText(text: "Output : \(finishResult.count)")
        let text = finishResult.reversed().compactMap({"\($0)"}).joined(separator: " + ")
        let explanationText = "Explanation : \(n) = \(text)."
        viewDelegate.setExplanation(text: explanationText)
    }
}
