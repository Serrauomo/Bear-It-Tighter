//
//  FeelingCard.swift
//  Test
//
//  Created by Andrés Zamora on 11/10/24.
//

import Foundation

struct FeelingCard: Identifiable, Equatable {
    var pleasantness: Int
    var energy: Int
    let name: String
    let advices: [String]
    var adviceIndex = Int.random(in: 0...2)
    
    var advice: String {
        return advices[adviceIndex]
    }
    
    var id: String { name }
    
    static var allCards: [FeelingCard] {
        return [
            FeelingCard(pleasantness: 0, energy: 0, name: "Stress", advices:  [
                "Engage in deep breathing, meditation, or yoga to calm your mind and body.",
                "Make time for activities you enjoy, such as hobbies, exercise, or spending time with loved ones.",
                "Break tasks into manageable steps and create a schedule to reduce feelings of overwhelm."
            ]),
            FeelingCard(pleasantness: 1, energy: 0, name: "Frustration", advices: [
                "Step away from the situation to cool down and gain perspective.",
                "Focus on what you can change or control rather than what’s causing the frustration.",
                "Talk to someone you trust about your feelings to release pent-up emotions and gain support."
            ]),
            FeelingCard(pleasantness: 2, energy: 0, name: "Tension", advices: [
                "Take slow, deep breaths to help relax your body and reduce muscle tension.",
                "Engage in gentle stretching or physical activity to release built-up tension.",
                "Try mindfulness, meditation, or progressive muscle relaxation to calm your mind and body."
            ]),
            FeelingCard(pleasantness: 3, energy: 0, name: "Surprise", advices: [
                "Take a moment to breathe deeply and collect your thoughts before reacting.",
                "Reflect on the surprise and determine whether it’s positive or negative, which can help you respond appropriately.",
                "Embrace the surprise as an opportunity for growth or new experiences, allowing yourself to adapt to the change."
            ]),
            FeelingCard(pleasantness: 4, energy: 0, name: "Motivation", advices: [
                "Define specific, achievable goals to maintain focus and direction in your efforts.",
                "Divide larger tasks into smaller, manageable steps to make progress feel attainable and boost motivation.",
                "Acknowledge and reward yourself for completing tasks or reaching milestones to sustain enthusiasm and motivation."
            ]),
            FeelingCard(pleasantness: 5, energy: 0, name: "Inspiration", advices: [
                "Channel your inspiration into specific projects or goals to keep the momentum going.",
                "Keep a journal or note app handy to capture thoughts and ideas that arise when you feel inspired.",
                "Discuss your ideas with others or collaborate, as sharing can deepen your understanding and spark further creativity."
            ]),
            FeelingCard(pleasantness: 0, energy: 1, name: "Anger", advices: ["Advice 1", "Advice 2", "Advice 3"]),
            FeelingCard(pleasantness: 1, energy: 1, name: "Nervousism", advices: [
                "Use slow, deep breaths to calm your body and mind.",
                "Imagine a positive outcome for the situation causing your nerves.",
                "Rehearse or plan for the upcoming event to boost your confidence and reduce anxiety."
            ]),
            FeelingCard(pleasantness: 2, energy: 1, name: "Anxiety", advices: [
                "Use meditation or deep breathing to stay present.",
                "Physical activity helps reduce anxiety.",
                "Avoid caffeine and alcohol to lessen anxiety symptoms."
            ]),
            FeelingCard(pleasantness: 3, energy: 1, name: "Excitement", advices: [
                "Identify new challenges or adventures that inspire you and create a plan to pursue them.",
                "Engage with uplifting people, experiences, and content that spark your enthusiasm.",
                "Acknowledge and reward yourself for progress, no matter how small, to maintain a sense of excitement."
            ]),
            FeelingCard(pleasantness: 4, energy: 1, name: "Optimism", advices: [
                "Balance your optimism with practical considerations to prepare for potential challenges while maintaining a positive outlook.",
                "Focus on specific, realistic goals to channel your optimism into actionable steps.",
                "Regularly review your achievements and growth, reinforcing your positive mindset and motivation."
            ]),
            FeelingCard(pleasantness: 5, energy: 1, name: "Thrill", advices: [
                "Use the excitement to fuel productive activities or creative projects that inspire you.",
                "Balance your thrill with mindfulness to prevent feeling overwhelmed by intense emotions.",
                "Connect with friends or loved ones to share your excitement, enhancing the joy of the moment."
            ]),
            FeelingCard(pleasantness: 0, energy: 2, name: "Worry", advices: [
                "Identify and reframe negative thoughts to focus on more realistic outcomes.",
                "Allocate a specific time to think about your worries, then move on to prevent overthinking.",
                "Practice mindfulness, meditation, or exercise to help reduce stress and anxiety."
            ]),
            FeelingCard(pleasantness: 1, energy: 2, name: "Annoyment", advices: [
                "Take a few deep breaths to calm your mind and body.",
                "Reflect on what specifically is annoying you to understand and address it.",
                "Redirect your focus by doing something enjoyable or engaging to shift your mood."
            ]),
            FeelingCard(pleasantness: 2, energy: 2, name: "Repulsion", advices: [
                "Recognize and accept your feelings of repulsion without judgment to understand their source.",
                "Redirect your attention to something positive or neutral to lessen the intensity of the feeling.",
                "If possible, distance yourself from the source of your repulsion to create space and reduce discomfort."
            ]
                       ),
            FeelingCard(pleasantness: 3, energy: 2, name: "Pride", advices: [
                "Take time to acknowledge and celebrate your accomplishments, reinforcing your sense of self-worth.",
                "Balance pride with humility by recognizing the contributions of others who supported you along the way.",
                "Channel your pride into setting new goals or challenges to continue growing and achieving."
            ]),
            FeelingCard(pleasantness: 4, energy: 2, name: "Joy", advices: [
                "Take time to fully appreciate and reflect on what brings you joy, enhancing the experience.",
                "Connect with others by sharing your happiness, which can strengthen relationships and spread positivity.",
                "Engage in activities that foster joy, like trying new experiences or celebrating achievements, to build cherished memories."
            ]),
            FeelingCard(pleasantness: 5, energy: 2, name: "Happiness", advices: [
                "Regularly reflect on and express gratitude for the positive aspects of your life to enhance your overall happiness.",
                "Engage fully in the moment and savor joyful experiences to deepen your sense of happiness.",
                "Share your happiness with others through kind actions or words, which can strengthen your connections and boost your mood."
            ]),
            FeelingCard(pleasantness: 0, energy: 3, name: "Disgust", advices: [
                "Step away to clear your mind.",
                "Breathe deeply to regain calm.",
                "Reflect on whether it’s worth your energy."
            ]
                       ),
            FeelingCard(pleasantness: 1, energy: 3, name: "Disappointment", advices: [
                "Acknowledge your feelings without judgment.",
                "Reevaluate your expectations realistically.",
                "Focus on what you can learn and move forward."
            ]),
            FeelingCard(pleasantness: 2, energy: 3, name: "Pessimism", advices: [
                "Challenge negative thoughts with facts.",
                "Focus on small, positive actions.",
                "Surround yourself with uplifting influences."
            ]
                       ),
            FeelingCard(pleasantness: 3, energy: 3, name: "Love", advices: [
                "Express your love through kind words and actions.",
                "Show appreciation and support to those you care about.",
                "Nurture your relationships with patience and understanding."
            ]),
            FeelingCard(pleasantness: 4, energy: 3, name: "Calm", advices: [
                "Maintain your sense of peace through deep breathing.",
                "Practice mindfulness to stay grounded.",
                "Continue engaging in activities that sustain your tranquility."
            ]),
            FeelingCard(pleasantness: 5, energy: 3, name: "Security", advices: [
                "Focus on maintaining healthy boundaries.",
                "Cultivate gratitude for your current stability.",
                "Build on your strengths to reinforce self-confidence."
            ]),
            FeelingCard(pleasantness: 0, energy: 4, name: "Discouragement", advices:  [
                "Break down your goals into smaller, manageable steps.",
                "Celebrate small victories to regain motivation.",
                "Seek support or advice from others who have faced similar challenges."
            ]),
            FeelingCard(pleasantness: 1, energy: 4, name: "Sadness", advices: [
                "Allow yourself to feel and express your emotions.",
                "Reach out to a friend or loved one for support.",
                "Engage in activities that bring you comfort or peace, like going to the gym."
            ]),
            FeelingCard(pleasantness: 2, energy: 4, name: "Boredom", advices: [
                "Try something new or creative to spark interest.",
                "Set small, enjoyable goals to break the monotony.",
                "Take a break or rest to recharge your energy."
            ]),
            FeelingCard(pleasantness: 3, energy: 4, name: "Satisfaction", advices: [
                "Reflect on what you’ve achieved and appreciate it.",
                "Continue setting small, meaningful goals.",
                "Share your positive feelings with others to reinforce your satisfaction."
            ]),
            FeelingCard(pleasantness: 4, energy: 4, name: "Gratitude", advices: [
                "Practice gratitude daily by acknowledging what you’re thankful for.",
                "Express appreciation to others regularly.",
                "Focus on the positive, even in challenging times."
            ]),
            FeelingCard(pleasantness: 5, energy: 4, name: "Balance", advices: [
                "Create a calming environment to prepare for sleep.",
                "Avoid screens and stimulating activities before bed.",
                "Take a short nap if you’re unable to sleep at night."
            ]),
            FeelingCard(pleasantness: 0, energy: 5, name: "Depression", advices: [
                "Seek professional help, like therapy or counseling.",
                "Start with small, manageable activities to regain energy.",
                "Connect with someone you trust for emotional support."
            ]),
            FeelingCard(pleasantness: 1, energy: 5, name: "Exhaustion", advices: [
                "Prioritize rest and sleep to recharge.",
                "Break tasks into smaller steps to avoid burnout.",
                "Practice self-care, like meditation or gentle exercise."
            ]),
            FeelingCard(pleasantness: 2, energy: 5, name: "Drain", advices: [
                "Take a break and disconnect from stressors.",
                "Practice mindfulness or relaxation techniques.",
                "Replenish with nourishing food, hydration, and rest."
            ]),
            FeelingCard(pleasantness: 3, energy: 5, name: "Peace", advices: [
                "Maintain peace through daily relaxation practices.",
                "Create a serene environment around you.",
                "Engage in activities that promote inner harmony, like meditation."
            ]),
            FeelingCard(pleasantness: 4, energy: 5, name: "Sleepiness", advices: [
                "Create a calming environment to prepare for sleep.",
                "Avoid screens and stimulating activities before bed.",
                "Take a short nap if you’re unable to sleep at night."
            ]),
            FeelingCard(pleasantness: 5, energy: 5, name: "Coziness", advices: [
                "Surround yourself with soft, comforting items.",
                "Enjoy simple, quiet moments of relaxation.",
                "Take time to indulge in activities that make you feel at ease."
            ])
        ]
    }
    
    static let previewCards = (0..<10).map {
        FeelingCard(pleasantness: Int.random(in: 1...6), energy: Int.random(in: 1...6), name: "Feeling \($0)", advices: ["Advice 1","Advice 2","Advice 3"])
    }
}
