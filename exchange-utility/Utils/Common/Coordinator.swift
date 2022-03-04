//
//  Coordinator.swift
//  exchange-utility
//
//  Created by Utsav Patel on 04/03/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

