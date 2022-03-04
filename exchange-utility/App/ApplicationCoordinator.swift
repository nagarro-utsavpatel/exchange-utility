//
//  ApplicationCoordinator.swift
//  exchange-utility
//
//  Created by Utsav Patel on 04/03/2022.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        log.info("App Start")
        
        let authCoordinator = DashboardCoordinator(navigationController: navigationController)
        authCoordinator.parentCoordinator = self
        children.append(authCoordinator)
        
        authCoordinator.start()
    }
}
