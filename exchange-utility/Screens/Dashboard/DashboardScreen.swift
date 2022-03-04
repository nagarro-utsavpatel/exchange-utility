//
//  DashboardScreen.swift
//  exchange-utility
//
//  Created by Utsav Patel on 04/03/2022.
//

import UIKit
import RxSwift
import RxCocoa

class DashboardScreen: UIViewController, Instantiable {
    
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var next: UITextField!
    
    private let disposeBag = DisposeBag()
    var viewModel = DashboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModelInputs()
        bindViewModelOutputs()
    }
    
    private func bindViewModelInputs() {
        
    }
    
    private func bindViewModelOutputs() {
        
    }
}

https://www.swensonhe.com/mvvm-rx-part-1/
