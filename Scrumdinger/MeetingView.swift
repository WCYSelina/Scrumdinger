//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Ching Yee Selina Wong on 13/11/2022.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    
    private var player:AVPlayer{AVPlayer.sharedDingPlayer}
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16).fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                MeetingTimerView(speakers: scrumTimer.speakers, isRecording: isRecording, theme: scrum.theme)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }.padding()
            .onAppear{
                scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
                scrumTimer.speakerChangedAction = {
                    player.seek(to: .zero)
                    player.play()
                }
                speechRecognizer.reset()
                speechRecognizer.transcribe()
                isRecording = true
                    scrumTimer.startScrum()
            }
            .onDisappear{
                scrumTimer.stopScrum()
                speechRecognizer.stopTranscribing()
                isRecording = false
                let newHistory = History(attendees: scrum.attendees,lengthInMinutes: scrum.timer.secondsElapsed/60,transcript: speechRecognizer.transcript)
                scrum.history.insert(newHistory,at:0)
            }
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleDaTA[0]))
    }
}
