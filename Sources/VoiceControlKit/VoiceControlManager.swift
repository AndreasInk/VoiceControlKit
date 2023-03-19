//
//  SwiftUIView.swift
//  
//
//  Created by Andreas Ink on 3/18/23.
//

import Combine
import SwiftUI

@available(iOS 16.0, *)
public class VoiceControlManager: WhisperState  {
    
    public override init() {
        super.init()
        do {
            try loadModel()
            canTranscribe = true
        } catch {
            print(error.localizedDescription)
            messageLog += "\(error.localizedDescription)\n"
        }
    }
    func register(_ voiceControllable: VoiceControllable) {
        activeVoiceControls.append(voiceControllable)
    }

    func unregister(_ voiceControllable: VoiceControllable) {
        activeVoiceControls.removeAll { $0 === voiceControllable }
    }

}
