//
//  main.swift
//  change-accent
//
//  Created by Evangelos Petousis on 17/8/19.
//  Copyright © 2019 Evangelos Petousis. All rights reserved.
//

import Foundation

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
    Created by Evan Petousis
    """)
}

let args = getArgs(["--accent": 1])
let colour = args["--accent"]

if let colour = colour {
    if let accent = MacOSAccent(rawValue: colour) {
        setSystemAccent(accent: accent)
    } else {
        // TODO: Attempt to find nearest colour using HEX values
        print("error: invalid colour")
        showUsage()
    }
} else {
    print("error: missing colour")
    showUsage()
}
