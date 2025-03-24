import SwiftData
import Foundation

func loadActivitiesForPersonalUsers() -> [Activity]{
    return loadAllActivities().filter { $0.capacity < 100}
    
}
func loadActivitiesForLargeGroupUsers() -> [Activity]{
    return loadAllActivities()
    
}

func loadAllActivities() -> [Activity] {

    return [
        // 🌿 Wellness & Relaxation
        Activity(name: "Yoga Class", image: "figure.mind.and.body", groupTitle: "Wellness", capacity: 15, times: ["8:00 AM", "10:00 AM"], daysAvailable: ["Monday", "Wednesday"], activityDescription: "A relaxing yoga session to start your day."),
        Activity(name: "Meditation & Mindfulness", image: "brain.head.profile", groupTitle: "Wellness", capacity: 12, times: ["7:00 AM", "5:00 PM"], daysAvailable: ["Tuesday", "Friday"], activityDescription: "A guided meditation session designed to improve focus and reduce stress."),
        Activity(name: "Spa & Hydrotherapy", image: "drop.circle", groupTitle: "Wellness", capacity: 10, times: ["10:00 AM", "2:00 PM"], daysAvailable: ["Wednesday", "Saturday"], activityDescription: "Enjoy a rejuvenating spa session with hydrotherapy, aromatherapy, and massages."),

        // 🌲 Outdoor & Nature
        Activity(name: "Farm Tour", image: "leaf", groupTitle: "Outdoor", capacity: 20, times: ["9:00 AM", "2:00 PM"], daysAvailable: ["Tuesday", "Friday"], activityDescription: "Explore the beauty of our farm and learn about sustainable farming practices."),
        Activity(name: "Guided Nature Walk", image: "figure.walk", groupTitle: "Outdoor", capacity: 15, times: ["9:00 AM", "4:00 PM"], daysAvailable: ["Monday", "Thursday"], activityDescription: "A scenic guided hike through the resort’s nature trails."),
        Activity(name: "Fishing & Catch-Release", image: "fish", groupTitle: "Outdoor", capacity: 10, times: ["6:00 AM", "5:00 PM"], daysAvailable: ["Wednesday", "Saturday"], activityDescription: "Enjoy a relaxing fishing experience at our private resort pond."),
        Activity(name: "Horseback Riding", image: "carrot", groupTitle: "Outdoor", capacity: 10, times: ["10:00 AM", "3:00 PM"], daysAvailable: ["Tuesday", "Friday"], activityDescription: "A relaxing horseback ride across the scenic farm landscapes."),

        // 🍽️ Culinary & Farm-to-Table
        Activity(name: "Cooking Class", image: "fork.knife", groupTitle: "Culinary", capacity: 12, times: ["11:00 AM"], daysAvailable: ["Thursday", "Saturday"], activityDescription: "Learn to cook farm-fresh meals with our expert chefs."),
        Activity(name: "Wine & Cheese Tasting", image: "wineglass", groupTitle: "Culinary", capacity: 18, times: ["6:00 PM"], daysAvailable: ["Friday", "Saturday"], activityDescription: "Enjoy a guided tasting of locally produced wines and artisanal cheeses."),
        Activity(name: "Private Farm-to-Table Dining", image: "fork.knife.circle", groupTitle: "Culinary", capacity: 8, times: ["7:00 PM"], daysAvailable: ["Saturday", "Sunday"], activityDescription: "Indulge in an exclusive multi-course meal prepared by our on-site chef."),

        // 🚀 Adventure & Outdoor Sports
        Activity(name: "Canoeing Experience", image: "figure.water.fitness", groupTitle: "Adventure", capacity: 10, times: ["1:00 PM"], daysAvailable: ["Wednesday", "Sunday"], activityDescription: "Paddle across the peaceful resort lake with an experienced guide."),
        Activity(name: "Pickleball Tournament", image: "tennis.racket", groupTitle: "Adventure", capacity: 16, times: ["4:00 PM"], daysAvailable: ["Monday", "Thursday"], activityDescription: "Join an exciting pickleball tournament with fellow guests!"),
        Activity(name: "Axe Throwing", image: "target", groupTitle: "Adventure", capacity: 12, times: ["2:00 PM"], daysAvailable: ["Saturday", "Sunday"], activityDescription: "Test your accuracy and skill with an exhilarating axe throwing session."),
        Activity(name: "Clay Shooting Course", image: "target", groupTitle: "Adventure", capacity: 15, times: ["10:00 AM"], daysAvailable: ["Friday", "Sunday"], activityDescription: "Experience the thrill of clay shooting in a safe and controlled environment."),
        Activity(name: "4-Wheeler Off-Roading", image: "car.2", groupTitle: "Adventure", capacity: 12, times: ["1:00 PM"], daysAvailable: ["Wednesday", "Saturday"], activityDescription: "Explore the farm’s rugged terrain on a guided off-road adventure."),

        // 🏢 Corporate & Events (Excludes 100+ Capacity for Normal Users)
        Activity(name: "Corporate Retreat", image: "person.3.sequence", groupTitle: "Corporate & Events", capacity: 50, times: ["9:00 AM"], daysAvailable: ["Monday", "Thursday"], activityDescription: "A fun and engaging retreat for teams."),
        Activity(name: "Conference Meeting", image: "building.2", groupTitle: "Corporate & Events", capacity: 75, times: ["10:00 AM"], daysAvailable: ["Wednesday"], activityDescription: "A well-equipped space for large group meetings."),
        Activity(name: "Team Building Games", image: "figure.run", groupTitle: "Corporate & Events", capacity: 40, times: ["11:00 AM"], daysAvailable: ["Monday", "Thursday"], activityDescription: "Fun and interactive team-building exercises to foster collaboration."),
        Activity(name: "Wedding & Event Space", image: "balloon", groupTitle: "Corporate & Events", capacity: 90, times: ["5:00 PM"], daysAvailable: ["Saturday", "Sunday"], activityDescription: "A beautifully curated space for weddings, receptions, and special events.")
    ]
}
