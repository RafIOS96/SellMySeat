//
//  LanguageManager.swift
//  SellMySeat
//
//  Created by Rafayel Aghayan on 16.04.25.
//

import Foundation

enum AppLanguages: String, CaseIterable {
    case english = "en"
    case armenian = "hy"
    case russian = "ru"
}

class LanguageManager {
    enum Language: String {

        case english = "en"
        case armenian = "hy"
        case russian = "ru"

        func languageByRawValue(_ value: String) -> Language {
            switch value {
            case Language.english.rawValue:
                return .english
            case Language.armenian.rawValue:
                return .armenian
            case Language.russian.rawValue:
                return .russian
            default:
                return .english
            }
        }
        
        var languageName: String {
            switch self {
            case .english:
                return "English"
            case .armenian:
                return "Հայերեն"
            case .russian:
                return "Русский"
            }
        }
    }
    
    static let shared = LanguageManager()
    
    func initialize() {
        setLanguage(current)
    }
    
    var current: Language {
//        return self.setLanguageBasedDeviceAppSettings()
        if let lngFromUserDefaults = Language(rawValue: UserDefaults.standard.string(forKey: "_language") ?? "") {
            return lngFromUserDefaults
        }
        return .armenian
    }
    
    var locale: Locale {
        switch current {
        case .english:
            return Locale(identifier: "en_GB")
        case .russian:
            return Locale(identifier: "ru_RU")
        case .armenian:
            return Locale(identifier: "hy_AM")
        }
    }

    func changeLanguage(_ newValue: Language) {
        if self.current != newValue {
            self.setLanguage(newValue)
        }
    }
    
    func replaceTranslations(pairs: [String: String], for language: String) {
        Bundle.replaceTranslations(pairs: pairs, for: language)
    }
    
    // MARK: - Private
    
    private func setLanguage(_ lang: Language) {
        UserDefaults.standard.set(lang.rawValue, forKey: "_language")
        UserDefaults.standard.synchronize()
        Bundle.setLanguage(AppLanguages(rawValue: lang.rawValue) ?? .armenian)
        NotificationCenter.default.post(name: .refreshLocalizations, object: nil)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "changeLanguage"), object: nil)
    }
    
    private func setLanguageBasedDeviceAppSettings() -> Language {
        let pre = Locale.preferredLanguages[0]
        let lngCodeFromDeviceAppSettings = pre.components(separatedBy: "-").first
        if let lngFromUserDefaults = Language(rawValue: UserDefaults.standard.string(forKey: "_language") ?? "") {
            if let safeLngCode = lngCodeFromDeviceAppSettings,
               let lngFromDeviceAppSettings = Language(rawValue: safeLngCode) {
                return lngFromDeviceAppSettings != lngFromUserDefaults ? lngFromDeviceAppSettings : lngFromUserDefaults
            }
            return lngFromUserDefaults
        }
        return .armenian
    }
}
