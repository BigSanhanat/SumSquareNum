//
//  ViewController.swift
//  SumSquareNum
//
//  Created by Sanhanat Ngamchaiwong on 18/11/2566 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var explanation: UILabel!
    var viewModel: ViewModel! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = ViewModel(viewDelegate: self)
    }

    @IBAction func calculateButton_Clicked(_ sender: Any) {
        if let number = Int(numberTextField.text ?? "0") {
            viewModel.calculateWithNumber(number: number)
        }
        
    }
    
    @IBAction func resetButton_Clicked(_ sender: Any) {
    }
}

extension ViewController: ViewModelDelegate {
    func setOutputText(text: String) {
        outputLabel.text = text
    }
    
    func setExplanation(text: String) {
        explanation.text = text
    }
    
    
}
