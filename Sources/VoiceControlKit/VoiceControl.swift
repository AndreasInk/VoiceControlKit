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
class HomeViewButton: VoiceControllable {
    var voiceCommands: [String] {
        ["home"]
    }
    let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    func performAction(forVoiceCommand command: String) {
        print("Voice command activated: \(command)")
        action()
    }
}

struct CustomAccessibilityLabelModifier: ViewModifier {
    let label: Text
    let voice = HomeViewButton {
        print("TRIGGERED")
    }
    func body(content: Content) -> some View {
        content
            .voiceControl(voice)
            // Add any other custom attributes or modifiers here
    }
}
public extension View {
    func accessibilityLabel(_ label: Text) -> some View {
        self.modifier(CustomAccessibilityLabelModifier(label: label))
    }
}

extension View {
    func customAccessibilityLabel(_ label: String) -> some View {
        self.modifier(CustomAccessibilityLabelModifier(label: Text(label)))
    }
}

