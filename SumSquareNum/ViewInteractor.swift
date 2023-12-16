//
//  ViewInteractor.swift
//  SumSquareNum
//
//  Created by Sanhanat Ngamchaiwong on 16/12/2566 BE.
//

import Foundation

protocol ViewInteractorInput {
    func calculateNumber(request: CalculateRequest)
}

protocol ViewInteractorOutput {
    func presentResult(response: CalculateResponse)
}

class ViewInteractor: ViewInteractorInput {
    var output: ViewInteractorOutput!
    var n = ""
    var number = 0
    var resultNum = [Int]()
    
    private func calculateWithNumber(number: Int) {
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
        let response = CalculateResponse(source: n, result: resultNum)
        output.presentResult(response: response)
    }
    
    func calculateNumber(request: CalculateRequest) {
        calculateWithNumber(number: request.number)
    }

}
