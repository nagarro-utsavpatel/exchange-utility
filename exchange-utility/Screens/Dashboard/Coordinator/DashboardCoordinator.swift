//
//  DashboardCoordinator.swift
//  exchange-utility
//
//  Created by Utsav Patel on 04/03/2022.
//

import UIKit

class DashboardCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        log.info("SelectMakeCoordinator Start")
        
        let controller = DashboardScreen.instantiateFromStoryboard()
        
        let viewModel = DashboardViewModel()
        viewModel.appCoordinator = self
        controller.viewModel = viewModel
        navigationController.pushViewController(controller, animated: true)
    }
}

extension SelectMakeCoordinator {
    func movetoSelectModel(model: MakeCellViewModel) {
        let selectModelCoordinator = SelectModelCoordinator(navigationController: navigationController,
                                                            make: model)
        selectModelCoordinator.parentCoordinator = self
        children.append(selectModelCoordinator)
        
        selectModelCoordinator.start()
    }
}
