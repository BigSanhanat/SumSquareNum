//
//  ViewController.swift
//  SumSquareNum
//
//  Created by Sanhanat Ngamchaiwong on 18/11/2566 BE.
//

import UIKit

protocol ViewControllerOutput {
    func calculateNumber(request: CalculateRequest)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var explanation: UILabel!
    
    var output: ViewControllerOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        viewModel = ViewModel(viewDelegate: self)
        configure()
    }
    
    func configure() {
        let presenter = ViewPresenter()
        presenter.output = self
        
        let interactor = ViewInteractor()
        interactor.output = presenter
        
        output = interactor
    }

    @IBAction func calculateButton_Clicked(_ sender: Any) {
        if let number = Int(numberTextField.text ?? "0") {
            let request = CalculateRequest(number: number)
            output.calculateNumber(request: request)
        }
    }
}

extension ViewController: ViewPresenterOutput {
    func displayResult(viewModel: CalculateViewModel) {
        outputLabel.text = viewModel.output
        explanation.text = viewModel.explanation
    }
}
