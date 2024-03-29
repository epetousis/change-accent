//
//  util.swift
//  change-accent
//
//  Created by Evangelos Petousis on 17/8/19.
//  Copyright © 2019 Evangelos Petousis. All rights reserved.
//

import Foundation

func getArgs(_ argSpecs: [String: Int]) -> [String: String] {
    guard CommandLine.arguments.count > 1 else {
        return [:]
    }

    var args: [String: [String]] = [:]
    let argumentCount = CommandLine.arguments.count-1

    for i in 1...argumentCount {
        let argument = CommandLine.arguments[i]

        if let requiredArgQty = argSpecs[argument] {
            var values: [String] = args[argument] ?? []
            if (requiredArgQty <= 0) {
                args[argument] = [""]
                continue
            }
            
            // For each item starting from after this current one
            // to the specified limit in the argSpecs dictionary
            for valIndex in i+1...i+requiredArgQty {
                guard valIndex+1 <= CommandLine.arguments.count && !argSpecs.keys.contains(CommandLine.arguments[valIndex]) else {
                    // We've either hit the end of the arguments array,
                    // or we've encountered the next argument.
                    break
                }
                values.append(CommandLine.arguments[valIndex])
            }
            if values.count > 0 {
                args[argument] = values
            }
        }
    }
    return args.mapValues { $0.joined(separator: " ") }
}

func setSystemAccent(accent: MacOSAccent) -> Void {
    // NOTE: there are also preferences for dark mode
    // AppleInterfaceStyle = Dark; applies dark mode
    // AppleInterfaceStyleSwitchesAutomatically = 1; applies the auto dark mode setting
    let preferencesDict: [String: Any?] = [
        "AppleAccentColor": accent.accentColour(),
        "AppleHighlightColor": accent.highlightColour()
    ];
    
    if var globalDefaults = UserDefaults().persistentDomain(forName: UserDefaults.globalDomain) {
        if accent == MacOSAccent.blue {
            preferencesDict.forEach { (key, val) in globalDefaults.removeValue(forKey: key) }
        } else {
            preferencesDict.forEach { (key, val) in globalDefaults[key] = val }
        }
        UserDefaults().setPersistentDomain(globalDefaults, forName: UserDefaults.globalDomain)
    }
    
    let notifications = [
        "AppleColorPreferencesChangedNotification",
        "AppleAquaColorVariantChanged",
        "AXInterfaceClassicInvertColorStatusDidChange",
        "AXInterfaceDifferentiateWithoutColorStatusDidChange"];
    
    for notification in notifications {
        let userInfo = preferencesDict.compactMapValues { $0 } as [AnyHashable : Any];
        DistributedNotificationCenter.default().post(name: NSNotification.Name(rawValue: notification), object: nil, userInfo: userInfo)
    }
}
