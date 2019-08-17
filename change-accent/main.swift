//
//  main.swift
//  change-accent
//
//  Created by Evangelos Petousis on 17/8/19.
//  Copyright © 2019 Evangelos Petousis. All rights reserved.
//

import Foundation
import AppKit

func showUsage() {
    print("""
    USAGE:
        $ change-accent [OPTIONS]
    OPTIONS:
        --accent <COLOUR>
            Set the macOS system accent colour.
            Valid colours:
                purple
                pink
                red
                orange
                yellow
                green
                graphite
                blue
        --license
            Shows the license for this program.
    Copyright © 2019 Evan Petousis
    This program comes with ABSOLUTELY NO WARRANTY.
    This is free software, and you are welcome to redistribute it
    under certain conditions; use the --license argument for details.
    """)
}

let args = getArgs(["--accent": 1, "--license": 0])
let colour = args["--accent"]
let license = args["--license"]

if license != nil {
    NSWorkspace.shared.open(URL(string: "https://www.gnu.org/licenses/#GPL")!)
} else if let colour = colour {
    if let accent = MacOSAccent(rawValue: colour) {
        setSystemAccent(accent: accent)
    } else if colour.range(of: #"#\w{6}$"#, options: .regularExpression) != nil {
        var differences: [MacOSAccent: Double] = [:]
        MacOSAccent.allCases.forEach {
            differences[$0] = colourDifference(color1: colour, color2: $0.hexColour())
        }
        if let closestColour = differences.min(by: { a, b in a.value < b.value }) {
            print("Closest hex option found was \(closestColour.key.rawValue). Switching...")
            setSystemAccent(accent: closestColour.key)
        } else {
            print("error: colour matching broke")
        }
    } else {
        print("error: invalid colour")
        showUsage()
    }
} else {
    print("error: missing colour")
    showUsage()
}
