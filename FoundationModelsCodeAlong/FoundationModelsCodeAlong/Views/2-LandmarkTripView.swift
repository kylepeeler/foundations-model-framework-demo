/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A SwiftUI view for displaying the itinerary.
*/

import SwiftUI

struct LandmarkTripView: View {
    let landmark: Landmark
    
    @State private var itineraryGenerator: ItineraryGenerator?

    @State private var requestedItinerary: Bool = false
    
    var body: some View {
        ScrollView {
            if !requestedItinerary {
                VStack(alignment: .leading, spacing: 16) {
                    Text(landmark.name)
                        .padding(.top, 150)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(landmark.shortDescription)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            else if let content = itineraryGenerator?.itineraryContent {
                Text(LocalizedStringKey(content))
                    .padding()
            }
        }
        .scrollDisabled(!requestedItinerary)
        .safeAreaInset(edge: .bottom) {
            // MARK: - [CODE-ALONG] Chapter 1.6.4: Generate itinerary and show the button
            ItineraryButton {
                requestedItinerary = true
                await itineraryGenerator?.generateItinerary()
            }
        }
        .task {
            // MARK: - [CODE-ALONG] Chapter 1.6.2: Create the generator when the view appears
            let generator = ItineraryGenerator(landmark: landmark)
            self.itineraryGenerator = generator
            // MARK: - [CODE-ALONG] Chapter 6.1.2: Pre-warm the model when the view appears
            
        }
        .headerStyle(landmark: landmark)
    }
    
}
