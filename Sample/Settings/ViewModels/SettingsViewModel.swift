import Domain
import Foundation
import ShortFoundation

typealias SettingsItemTappedBlock = (_ rowType: SettingsItem) -> Void

class SettingsViewModel: ObservableObject {

    // MARK: - Variables -
    var sections: [SettingsSectionModel] = []

    @LazyInject private var appModalViewRouter: AppModalViewRouter
    @LazyInject private var userAuthenticationUseCase: UserAuthenticationUseCase
    @Published var shouldPresentContactUs = false

    // MARK: - Life Cycle -
    init() {
        prepareDataSource()
    }

    // MARK: - Internal -

    func showLogOutConfirmation() {
        appModalViewRouter.showCustomSheet(state: .logOutConfirmation(handleUserResponse: { [weak self] isConfirmed in
            if isConfirmed {
                self?.logOut()
            }
        }))
    }

    func executeAction(for settingsItem: SettingsItem) {
        switch settingsItem {
        case .contactUs:
            openContactUsPopup()

        case .rateApp:
            showRateAppPopup()

        default:
            break
        }
    }

    // MARK: - Private -

    private func logOut() {
        userAuthenticationUseCase.logOut()
    }

    private func openContactUsPopup() {
        shouldPresentContactUs = true
    }

    private func showRateAppPopup() {
        let handleUserResponse: BoolCompletion = { isConfirmed in
            guard isConfirmed else {
                return
            }
            RateAppPresenter.shared.presentRateAppFlow()
        }

        appModalViewRouter.showCustomSheet(state: .rateAppConfirmation(handleUserResponse: handleUserResponse))
    }

    private func prepareDataSource() {
        let accountSection = SettingsSectionModel(type: .account,
                                                  items: [.personalInfo,
                                                          .accountSettings])

        let infoSection = SettingsSectionModel(type: .info,
                                                items: [.howToUse,
                                                        .termsOfService,
                                                        .privacyPolicy])

        let supportSection = SettingsSectionModel(type: .support,
                                                  items: [.helpCenter,
                                                          .contactUs,
                                                          .diagnosticsPage,
                                                          .rateApp])

        sections = [accountSection,
                    infoSection,
                    supportSection]
    }
}

