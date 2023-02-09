//
//  ContentView.swift
//  FocusIntentTest
//
//  Created by Alexander Sandberg on 09.02.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
		.onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
			Task {
				do {
					print("Attempt to call current FocusIntent's `perform()`")

					// If no Focus filter is active, and no `default` is supplied to FocusIntent's @Parameter(s), this will throw.
					let result = try await FocusIntent.current.perform()

					// If a `default` is supplied to the @Parameter(s), this will no longer throw, `perform()` will be called, and a result will be logged.
					print("Result:", result)

					// ❓ However, despite that, the "No current action is available. Supply the caller with the default." is still logged from somewhere, before the `perform()` method runs.
				} catch {
					// If a `default` is not supplied, the following error will be thrown (as expected):
					// AppIntentError(context: AppIntents.AppIntentError.Context.needsValue(parameter: AppIntents.IntentParameter<Swift.Double>, dialog: nil))
					print("Call did throw:", error)
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
