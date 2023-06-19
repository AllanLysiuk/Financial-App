//
//  CalendarVCCoordinator.swift
//  BudgetApp
//
//  Created by Allan on 18.06.23.
//

import Foundation
import UIKit

final class CalendarVCCoordinator: Coordinator {
    private var rootVC: UIViewController?
    private var rootCoordinator: CalendarRootCoordinatorProtocol
    var childCoordinators: [Coordinator] = []
    
    init(
        rootVC: UIViewController,
        rootCoordinator: CalendarRootCoordinatorProtocol
    ) {
        self.rootCoordinator = rootCoordinator
        self.rootVC = rootVC
    }
    
    func start() {
        assert(false, "Should be open with arguments, please use start(delegate: MovAccCalendarDelegate)")
    }
    
    func start(delegate: MovAccCalendarDelegate) {
        let vc = CalendarVCAssembler.makeCalendarVC(coordinator: self, delegate: delegate)
        if let sheet = vc.sheetPresentationController {
            sheet.detents =  [.medium()]
        }
        rootVC?.present(vc, animated: true)
    }
    
    func finish() {
        rootCoordinator.dateSelectingFinished(self)
    }
    
    
}
#warning("могу ли я передавать вью контроллер")
extension CalendarVCCoordinator: CalendarCoordinatorProtocol {
    func finish(shouldMoveToParent: Bool) {
        if shouldMoveToParent {
            rootVC?.dismiss(animated: true)
        }
        finish()
    }

}
