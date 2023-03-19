//
//  VoiceControllable.swift
//  
//
//  Created by Andreas Ink on 3/18/23.
//

import SwiftUI

public protocol VoiceControllable: AnyObject {
    var voiceCommands: [String] { get }
    func performAction(forVoiceCommand command: String)
}
