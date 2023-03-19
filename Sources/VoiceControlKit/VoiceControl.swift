//
//  VoiceControl.swift
//  
//
//  Created by Andreas Ink on 3/18/23.
//

import SwiftUI

@available(iOS 16.0, *)
public struct VoiceControl: ViewModifier {
    @EnvironmentObject var voiceControlManager: VoiceControlManager
    let voiceControllable: VoiceControllable

    public func body(content: Content) -> some View {
        content
            .onAppear {
                voiceControlManager.register(voiceControllable)
            }
            .onDisappear {
                voiceControlManager.unregister(voiceControllable)
            }
    }
}

@available(iOS 16.0, *)
public extension View {
    func voiceControl(_ voiceControllable: VoiceControllable) -> some View {
        self.modifier(VoiceControl(voiceControllable: voiceControllable))
    }
}
