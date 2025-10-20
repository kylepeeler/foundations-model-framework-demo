/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A Playground for testing Foundation Models framework features.
*/

import FoundationModels
import Playgrounds

#Playground {
    let instructions = """
        Your job is to create an itinerary for the user.
        """

    let session = LanguageModelSession(instructions: instructions)
    let prompt = "Generate a 3-day itinerary to Paris."
    let response = try await session.respond(to: prompt,
                                             generating: Itinerary.self)
}
