//
//  ViewPresenter.swift
//  SumSquareNum
//
//  Created by Sanhanat Ngamchaiwong on 16/12/2566 BE.
//

import Foundation

protocol ViewPresenterInput {
    func presentResult(response: CalculateResponse)
}

protocol ViewPresenterOutput: AnyObject {
    func displayResult(viewModel: CalculateViewModel)
}

extension ViewPresenter: ViewInteractorOutput {
    
}

class ViewPresenter: ViewPresenterInput {
    weak var output: ViewPresenterOutput!
    
    func presentResult(response: CalculateResponse) {
        
        let output = "Output : \(response.result.count)"
        let sortResult = response.result.sorted(by: {$0 < $1})
        let resultString = sortResult.compactMap({"\($0)"})
        let text = resultString.joined(separator: " + ")
        let explanationText = "Explanation : \(response.source) = \(text)."
        let viewModel = CalculateViewModel(output: output, explanation: explanationText)
        self.output.displayResult(viewModel: viewModel)
    }
}
