import ShortcutFoundation

class SettingsRowViewModel {

    // MARK: - Properties -
    let item: SettingsItem
    let shouldShowSeparator: Bool
    let actionRowTapped: SettingsItemTappedBlock?

    // MARK: - Life Cycle -

    init(with item: SettingsItem,
         shouldShowSeparator: Bool,
         actionRowTapped: SettingsItemTappedBlock?) {
        self.item = item
        self.shouldShowSeparator = shouldShowSeparator
        self.actionRowTapped = actionRowTapped
    }

    // MARK: - Internal -
    func executeActionIfNeeded() {
        guard item.rowType == .action else {
            return
        }
        actionRowTapped?(item)
    }
}
