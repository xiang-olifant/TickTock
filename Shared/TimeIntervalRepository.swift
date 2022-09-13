//
//  TimeIntervalRepository.swift
//  TickTock
//
//  Created by Chang Chu on 9/13/22.
//

import Foundation

@MainActor class TimeIntervalRepository: ObservableObject {
    @Published var models: [TimeIntervalModel]
    
    private static var savedModels: [TimeIntervalModel]? {
        get {
            let value = UserDefaults.standard.value(forKey: "TimeInterval") as? Data
            if let value = value, let models = try? PropertyListDecoder().decode(Array<TimeIntervalModel>.self, from: value) {
                return models
            }
            return nil
        }
        set {
            try? UserDefaults.standard.set(PropertyListEncoder().encode(newValue), forKey: "TimeInterval")
        }
    }
    
    init() {
        if !(TimeIntervalRepository.savedModels?.isEmpty ?? true) {
            _models = .init(initialValue: TimeIntervalRepository.savedModels ?? [])
        } else {
            let defaultModels: [TimeIntervalModel] = [
                .init(timeInterval: 60),
                .init(timeInterval: TimeInterval(5 * 60)),
                .init(timeInterval: TimeInterval(10 * 60)),
                .init(timeInterval: TimeInterval(25 * 60)),
                .init(timeInterval: TimeInterval(55 * 60)),
                .init(timeInterval: TimeInterval(60 * 60))
            ].compactMap { $0 }
            TimeIntervalRepository.savedModels = defaultModels
            _models = .init(initialValue: defaultModels)
        }
    }
    
    func add(_ model: TimeIntervalModel) {
        var savedModels = TimeIntervalRepository.savedModels ?? []
        savedModels += [model]
        TimeIntervalRepository.savedModels = savedModels
    }
}
