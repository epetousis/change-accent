//
//  MacOSAccent.swift
//  change-accent
//
//  Created by Evangelos Petousis on 17/8/19.
//  Copyright © 2019 Evangelos Petousis. All rights reserved.
//

import Foundation

enum MacOSAccent: String {
    case blue // #2F7CF6
    case purple // #9A57A2
    case pink // #E55D9C
    case red // #EC5F5D
    case orange // #E8873A
    case yellow // #F2B94B
    case green // #78B756
    case graphite // #8C8C8C
    
    // Return the integer option value corresponding to each accent.
    func accentColour() -> Int? {
        switch self {
        case MacOSAccent.purple:
            return 5;
        case MacOSAccent.pink:
            return 6;
        case MacOSAccent.red:
            return 0;
        case MacOSAccent.orange:
            return 1;
        case MacOSAccent.yellow:
            return 2;
        case MacOSAccent.green:
            return 3;
        case MacOSAccent.graphite:
            return -1;
        default:
            return nil;
        }
    }
    
    // Return the default macOS highlight colours corresponding to each accent.
    func highlightColour() -> String? {
        switch self {
        case MacOSAccent.purple:
            return "0.968627 0.831373 1.000000 Purple";
        case MacOSAccent.pink:
            return "1.000000 0.749020 0.823529 Pink";
        case MacOSAccent.red:
            return "1.000000 0.733333 0.721569 Red";
        case MacOSAccent.orange:
            return "1.000000 0.874510 0.701961 Orange";
        case MacOSAccent.yellow:
            return "1.000000 0.937255 0.690196 Yellow";
        case MacOSAccent.green:
            return "0.752941 0.964706 0.678431 Green";
        case MacOSAccent.graphite:
            return "0.847059 0.847059 0.862745 Graphite";
        default:
            return nil;
        }
    }
}
