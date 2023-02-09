//
//  FocusIntent.swift
//  FocusIntentTest
//
//  Created by Alexander Sandberg on 09.02.23.
//

import AppIntents

struct FocusIntent: SetFocusFilterIntent {

	static let title: LocalizedStringResource = "Test intent"

//	@Parameter(title: "Some double") // Without default
	@Parameter(title: "Some double", default: 1) // With default
	var someDouble: Double

	var displayRepresentation: DisplayRepresentation {
		DisplayRepresentation(title: Self.title)
	}

	func perform() async throws -> some IntentResult {
		print("someDouble in FocusIntent's `perform()`:", someDouble)

		return .result()
	}
}
