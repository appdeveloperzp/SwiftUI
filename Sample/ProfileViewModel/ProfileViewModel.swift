import Foundation
import Domain
import SwiftUI
import Core
import ShortFoundation
import Combine

class ProfileViewModel: ObservableObject {

    // - MARK: - Properties -
    @LazyInject private var profileUseCase: ProfileUseCase
    @LazyInject private var toastMessageRouter: ToastMessageRouter

    @Published var personalInfo: UserProfileInfo?

    var updatePhotoAction: EmptyBlock?

    // MARK: - Internal -
    func onAppear() {
        updateFullProfileInfo()
    }

    // MARK: - Private -
    private func updateFullProfileInfo() {
        profileUseCase.getUserProfileInfo()
            .receive(on: DispatchQueue.main)
            .receiveAndCancel { [weak self] in
                self?.personalInfo = $0
            } receiveError: { [weak self] error in
                self?.toastMessageRouter.show(error: error)
            }
    }

}
