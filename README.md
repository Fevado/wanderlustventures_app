# WanderlustVentures - Travel Booking App
A Flutter-based mobile application for discovering and booking travel destinations. Users can explore destinations, view details, select trip duration, choose payment methods, and complete bookings.

## App Overview
WanderlustVentures helps users discover amazing travel destinations in Kenya and beyond. The app guides users through a complete booking flow from exploration to payment confirmation.

## Project Structure
    `
    lib/
    ├── models/
    │   └── destination.dart           # Destination data model
    ├── screens/
    │   ├── home.dart                   # Main screen with destination list
    │   ├── details.dart                 # Individual destination details
    │   ├── payments.dart                 # Payment method selection
    │   ├── payment_details.dart          # Payment form (card, M-Pesa, etc.)
    │   └── checkout.dart                 # Booking confirmation
    └── assets/
        └── images/                       # Destination images `
    
## Features Implemented
1. Home Screen (home.dart)
      Data-driven destination listing using ListView.builder
    
      Reusable DestinationCard widget
    
      Search functionality with real-time filtering
    
      Bookmark/unbookmark destinations
    
      Navigation to details screen with selected destination

2. Details Screen (details.dart)
      Receives Destination object from home screen
    
      Displays destination images and descriptions
    
      Bookmark functionality with callback pattern
    
      "Book Trip" button navigates to payments

3. Payments Screen (payments.dart)
      Receives selected destination from details
    
      Days selector (+ / - buttons) with minimum 1 day
    
      Real-time total price calculation (pricePerDay × days)
    
      Payment method selection (PayPal, Card, Crypto)
    
      Visual feedback for selected payment method
    
      Continue button appears only after method selection
    
      Passes complete data to payment details:
    
      Destination object
    
      Selected payment method
    
      Number of days
    
      Total price

4. Payment Details Screen (payment_details.dart)
      Conditional rendering based on payment method:
    
      CardDetails for credit/debit cards
    
      PayPalDetails for PayPal payments
    
      CryptoDetails for cryptocurrency
    
      (M-Pesa ready for integration)
    
      All payment forms receive:
    
       Destination information
    
       Number of days
    
       Total price
    
      No hardcoded values - all data passed from previous screens
    
      "Pay Now" button navigates to checkout with complete booking data

5. Data Model (destination.dart)
`
class Destination {
  final String name;
  final String imagePath;
  final String description;
  final String location;
  final double pricePerDay;
  bool isBookmarked;
  
  // Constructor with required fields
} `

### Data Flow
`
Home Screen 
    ↓ (selected destination)
Details Screen
    ↓ (destination + days + payment method)
Payments Screen 
    ↓ (destination + days + total + payment method)
Payment Details Screen
    ↓ (complete booking data)
Checkout Screen `

### Key Concepts Learned
1. State Management
Local state with setState()

Lifting state up pattern

Callback functions for child-to-parent communication

2. Data-Driven UI
Lists instead of hardcoded widgets

ListView.builder for dynamic content

Conditional rendering based on data

3. Navigation
Passing data between screens via constructors

Navigator.push() with data

Maintaining data consistency across screens

4. User Interaction
Search filtering

Increment/decrement controls

Selection highlighting

Progressive disclosure (Continue button appears after selection)

### Getting Started
Prerequisites
Flutter SDK (latest version)

Dart SDK

Android Studio / VS Code

iOS simulator or Android emulator

Installation
Clone the repository

`bash
git clone https://github.com/yourusername/wanderlustventures.git
Navigate to project directory`

`bash
cd wanderlustventures
Get dependencies`

`bash
flutter pub get
Add destination images to assets/images/:
nairobi.jpg
maasai.jpg
mombasa.jpg`

`Update pubspec.yaml assets section:
yaml
flutter:
  assets:
    - assets/images/`
    
Run the app

`bash
flutter run`

Sample Data Structure
`
List<Destination> destinations = [
  Destination(
    name: 'Nairobi',
    imagePath: 'assets/images/nairobi.jpg',
    description: 'A city of clean waters. Explore the vast surprises the beautiful city has to offer.',
    location: 'Nairobi, Kenya',
    pricePerDay: 150.0,
  ),
  Destination(
    name: 'Maasai Mara',
    imagePath: 'assets/images/maasai.jpg',
    description: 'The beautiful Maa culture. Get to interact and learn about the Maa people.',
    location: 'Narok, Kenya',
    pricePerDay: 196.0,
  ),
  // Add more destinations...
];`

### Testing the App
Home Screen Testing

Scroll through destinations

Use search filter

Toggle bookmarks

Tap any destination

Booking Flow Testing

Select destination → Details

Tap "Book Trip" → Payments

Adjust days with +/- buttons

Select payment method

Click Continue

Verify correct payment form appears

Check totals match calculations

Click "Pay Now" → Checkout

Edge Cases

Search with no results

Decrease days below 1 (should stop at 1)

No payment method selected (Continue button hidden)

Different payment methods show different forms

### UI/UX Decisions
Color Scheme: Light blue background (#D7F0FD) with blue accents (#0498E5)

Consistent spacing: 16px padding throughout

Visual feedback: Selected buttons turn darker blue

Progressive disclosure: Options appear as user makes decisions

Summary cards: Booking summary always visible during payment

### Coming Soon
Form validation for payment details

TextEditingController integration

Provider/Riverpod for global state

API integration for real destination data

User authentication

Booking history

Real payment gateway integration

M-Pesa STK push simulation

### Known Issues
Payment forms don't validate input yet

No persistence for bookmarks

Checkout screen is minimal (confirmation only)

### What You've Learned
Through building this app, you've mastered:

Flutter widget tree and composition

Passing data between screens

State management with setState

Callback functions for child-parent communication

Conditional rendering

ListView.builder for dynamic content

Building reusable widgets

Real-world booking flow logic

### Contributing
This is a learning project. Feel free to fork and enhance:

Add more destinations

Improve UI/UX

Add animations

Implement form validation

Add local storage for bookmarks
