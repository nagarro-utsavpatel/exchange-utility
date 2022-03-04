//
//  ViewModel.swift
//  exchange-utility
//
//  Created by Utsav Patel on 04/03/2022.
//

import Foundation

protocol ViewModel {
    
    associatedtype Input
    associatedtype Output
    
    var input: Input {get set}
    var output: Output {get set}
}
