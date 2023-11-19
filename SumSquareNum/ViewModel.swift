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
    var resultNum = [Int]()
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
        
        minusWith(squareNum: squareNumbers)
//        print(squareNumber)
    }
    
    private func minusWith(squareNum: [Int]) {
        for i in squareNum {
            print("\(self.number) \(i) \(self.number - i)")
            if i <= self.number {
                resultNum.append(i)
                self.number = self.number - i
                if self.number > 0 {
                    minusWith(squareNum: squareNum)
                } else {
                    viewDelegate.setOutputText(text: "Output : \(resultNum.count)")
                    prepareExplanation()
//                    return
                }
            } else if number > 0 && number < 4 {
                resultNum.append(1)
                self.number = self.number - 1
                if self.number > 0 {
                    minusWith(squareNum: squareNum)
                } else {
                    viewDelegate.setOutputText(text: "Output : \(resultNum.count)")
                    prepareExplanation()
//                    return
                }
            }
        }
    }
    
    func prepareExplanation() {
        let text = resultNum.reversed().compactMap({"\($0)"}).joined(separator: " + ")
        let explanationText = "Explanation : \(n) = \(text)."
        viewDelegate.setExplanation(text: explanationText)
    }
}
