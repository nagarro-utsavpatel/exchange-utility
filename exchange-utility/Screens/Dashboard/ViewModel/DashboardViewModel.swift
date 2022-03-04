//
//  DashboardViewModel.swift
//  exchange-utility
//
//  Created by Utsav Patel on 04/03/2022.
//

import UIKit
import RxSwift
import RxCocoa

class DashboardViewModel: ViewModel {
    
    struct Input {
        let saveTrigger: AnyObserver<Void>
        let title: AnyObserver<String>
        let details: AnyObserver<String>
    }
    
    private let saveTrigger = PublishSubject<Void>()
    private let title = ReplaySubject<String>.create(bufferSize: 1)
    private let details = ReplaySubject<String>.create(bufferSize: 1)
    
    struct Output {
        let saveEnabled: Driver<Bool>
    }
    
    var input: Input
    var output: Output
    
    init() {
        let saveEnabled = Observable.combineLatest(title, details) { title, details in
            return title.isEmpty == false && details.isEmpty == false
        }.asDriver(onErrorJustReturn:
                    false)
        input = Input(
            saveTrigger: saveTrigger.asObserver(),
            title: title.asObserver(),
            details: details.asObserver())
        
        output = Output(saveEnabled: saveEnabled)
        
    }
    
    weak var coordinator: DashboardCoordinator!
    
    // input
    
    // output
    
//    let apiService: EdmundsClient
//    
//    private var makelist = [MakeModel]()
//    
//    weak var appCoordinator: SelectMakeCoordinator!
//    
//    private var cellViewModels: [MakeCellViewModel] = [MakeCellViewModel]() {
//        didSet {
//            self.reloadTableViewClosure?()
//        }
//    }
//    
//    var isLoading = false {
//        didSet {
//            self.updateLoadingStatus?()
//        }
//    }
//    
//    var alertMessage: String? {
//        didSet {
//            self.showAlertClosure?()
//        }
//    }
//    
//    var numberOfCells: Int {
//        return cellViewModels.count
//    }
//    
//    var selectedMake: MakeCellViewModel? {
//        didSet {
//            guard let model = selectedMake else {
//                return
//            }
//            appCoordinator.movetoSelectModel(model: model)
//        }
//    }
//    
//    var reloadTableViewClosure: (() -> Void)?
//    var showAlertClosure: (() -> Void)?
//    var updateLoadingStatus: (() -> Void)?
//    
//    init( apiService: EdmundsClient) {
//        self.apiService = apiService
//    }
//    
//    func initFetch() {
//        self.isLoading = true
//        
//        apiService.request(requestType: Client.makes,
//                           type: Response<MakeModel>.self) { [weak self] result in
//            self?.isLoading = false
//            switch result {
//                case .success(let items):
//                    self?.processFetchedItem(items: items.results)
//                    // swiftlint:disable empty_enum_arguments
//                case .failure(_):
//                    self?.alertMessage = "No any data found!"
//            }
//        }
//    }
//    
//    func getCellViewModel( at indexPath: IndexPath ) -> MakeCellViewModel {
//        return cellViewModels[indexPath.row]
//    }
//    
//    private func processFetchedItem(items: [MakeModel] ) {
//        self.makelist = items // Cache
//        var vms = [MakeCellViewModel]()
//        for item in makelist {
//            vms.append( MakeCellViewModel(model: item) )
//        }
//        self.cellViewModels = vms
//    }
}
