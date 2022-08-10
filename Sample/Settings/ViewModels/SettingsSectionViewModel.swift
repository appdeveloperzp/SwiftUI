import Foundation

class SettingsSectionViewModel {

    // MARK: - Properties -

    let model: SettingsSectionModel
    let actionRowTapped: SettingsItemTappedBlock?

    // MARK: - Life Cycle -

    init(with model: SettingsSectionModel,
         actionRowTapped: SettingsItemTappedBlock?) {
        self.actionRowTapped = actionRowTapped
        self.model = model
    }

    // MARK: - Internal -
    func shouldShowSeparator(at index: Int) -> Bool {
        index != model.items.count - 1
    }

    func item(at index: Int) -> SettingsItem {
        model.items[index]
    }
}
