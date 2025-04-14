

# NgiritKuy 🍴  
**NgiritKuy** is an iOS app designed to help new employees and visitors at Green Park Office (GOP) find affordable food stalls that suit their budget and preferences. The app combines location-based services, gamification, and user-friendly filtering to make food exploration fun and efficient.

<div align="center">
<img width="778" alt="image" src="https://github.com/user-attachments/assets/5f5a686f-c7c7-4b6c-aa37-1ff5af438967" />
</div>

---

## Table of Contents  
- [Features](#features)  
- [Tech Stack](#tech-stack)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Screenshots](#screenshots)  
- [Architecture](#architecture)  
- [Achievements & Gamification](#achievements--gamification)  

---

## Features  
NgiritKuy offers a variety of features to enhance the food-finding experience:  

### Core Features  
- **Food Stall Finder**:  
  Locate nearby food stalls with detailed information, including menus, price ranges, and locations.  
- **Filters**:  
  Filter stalls by price range, location, cuisine type, favorites, and visited status.  
- **Gamification**:  
  Track achievements and progress through Game Center integration.  
- **Favorites & Visited Tracking**:  
  Mark stalls as favorites or visited for easy reference.  
- **Map Integration**:  
  Get walking directions to stalls using Apple Maps.  

### Additional Features  
- **Dynamic Distance Calculation**:  
  See how far each stall is from your current location.  
- **Achievements**:  
  Unlock achievements for exploring stalls, marking favorites, and more.  
- **Offline Data**:  
  Seeded data ensures the app works even without an internet connection.  

---

## Tech Stack  
NgiritKuy is built using modern iOS development tools and frameworks:  

### Languages  
- **Swift 5.0**  

### Frameworks  
- **SwiftUI**: For building a declarative and responsive UI.  
- **SwiftData**: For managing data persistence and relationships.  
- **CoreLocation**: For real-time location tracking and distance calculations.  
- **MapKit**: For map-based navigation and directions.  
- **GameKit**: For Game Center achievements and progress tracking.  
- **TipKit**: For providing contextual tips to users.  

### Tools  
- **Xcode 16.2**  
- **GitHub**: For version control and collaboration.  

---

## Installation  
Follow these steps to set up and run the project locally:  

1. **Clone the Repository**:  
   ```bash  
   git clone https://github.com/your-username/ngiritkuy.git  
   cd ngiritkuy  
   ```  

2. **Open the Project**:  
   Open `NgiritKuy.xcodeproj` in Xcode.  

3. **Install Dependencies**:  
   Ensure you have Xcode 16.2 or later installed.  

4. **Run the App**:  
   Select a simulator or connected device and click the **Run** button in Xcode.  

---

## Usage  
### How to Use NgiritKuy:  
1. **Explore Food Stalls**:  
   - Browse a list of food stalls with detailed information.  
   - Use filters to narrow down your search by price, location, or cuisine.  

2. **Mark Favorites & Visited**:  
   - Tap the heart icon to mark a stall as a favorite.  
   - Mark stalls as visited to track your exploration progress.  

3. **Get Directions**:  
   - Use the "Locate Me" button to get walking directions to a stall.  

4. **Track Achievements**:  
   - Sign in with Game Center to unlock achievements and track your progress.  

---

## Screenshots  
### Home Screen  
![Home Screen](https://github.com/user-attachments/assets/816d0387-70a9-4454-b6ee-d5412e48ac53)


### Filter Options  
![Filter Options](https://github.com/user-attachments/assets/82ad20dc-964f-4750-a6e7-c5d83e7bafc3)

### Stall Details  
![Stall Details](https://github.com/user-attachments/assets/0fa52d05-13dd-4118-98bb-ddae839c9155)

---

## Architecture  
NgiritKuy follows a modular architecture to ensure scalability and maintainability.  

### Key Components  
1. **Model Layer**:  
   - `Stall`, `FoodMenu`, `GOPArea`, and `UserProgress` models manage app data.  
   - Relationships between models are handled using **SwiftData**.  

2. **View Layer**:  
   - Built with **SwiftUI** for a declarative and responsive UI.  
   - Includes reusable components like `StallCard`, `MenuItemRow`, and `FilterHeaderView`.  

3. **Controller Layer**:  
   - `LocationManager`: Handles location updates and distance calculations.  
   - `AchievementTracker`: Manages user progress and Game Center achievements.  

### Data Flow  
- **SwiftData**: Handles data persistence and relationships.  
- **CoreLocation**: Provides real-time location updates.  
- **MapKit**: Integrates with Apple Maps for navigation.  

---

## Achievements & Gamification  
NgiritKuy integrates with Game Center to provide a gamified experience:  

### Achievements  
- **Favorite Stalls**: Unlock achievements for marking stalls as favorites.  
- **Visited Stalls**: Track and unlock achievements for visiting stalls.  
- **Exploration**: Earn rewards for exploring distinct areas in GOP.  

### Progress Tracking  
- **UserProgress Model**: Tracks metrics like favorite stalls, visited stalls, and distinct areas visited.  
