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
    }
    
    private func minusWith(squareNum: [Int]) {
        repeat {
            for i in squareNum {
                if i <= self.number {
                    resultNum.append(i)
                    self.number = self.number - i
                } else if number > 0 && number < 4 {
                    resultNum.append(1)
                    self.number = self.number - 1
                } else if number > 0 {
                    minusWith(squareNum: squareNum)
                }
            }
        } while (self.number > 0)
        
        //DISPLAY RESULT
        prepareExplanation()

    }
    
    func prepareExplanation() {
        viewDelegate.setOutputText(text: "Output : \(resultNum.count)")
        let sortResult = resultNum.sorted(by: {$0 < $1})
        let resultString = sortResult.compactMap({"\($0)"})
        let text = resultString.joined(separator: " + ")
        let explanationText = "Explanation : \(n) = \(text)."
        viewDelegate.setExplanation(text: explanationText)
    }
}
