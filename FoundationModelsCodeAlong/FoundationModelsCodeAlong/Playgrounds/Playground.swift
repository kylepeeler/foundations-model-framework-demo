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
                                             generating: SimpleItinerary.self)
}

// The @Generable macro makes your custom type compatible with the model.
@Generable
struct SimpleItinerary {
    // The @Guide macro provides hints to the model about a property.
    @Guide(description: "An exciting name for the trip.")
    let title: String

    @Guide(description: "A short, engaging description of the trip.")
    let description: String

    @Guide(description: "A list of day-by-day plans, as simple strings.")
    @Guide(.count(3))
    let days: [String]
}
