package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "feedback")
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(length = 100, name = "email", nullable = false)
    private String email;

    @Column(name = "rating", nullable = false)
    private int rating;

    @Column(length = 1000, name = "suggestion")
    private String suggestion;

    @Column(length = 2000, name = "feedback", nullable = false)
    private String feedback;

    // Constructors
    public Feedback() {}

    public Feedback(String email, int rating, String suggestion, String feedback) {
        this.email = email;
        this.rating = rating;
        this.suggestion = suggestion;
        this.feedback = feedback;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
