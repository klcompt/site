Feature: As a conference organizer, I can manage where and when
  conference sessions are scheduled so that speakers and attendees
  know where and when to go for each conference session.

  Background: The site requires a user before serving public content
    Given an admin exists

  Scenario: Conference organizer views all rooms for the current conference year
    Given there are no rooms
    And I am a logged in organizer
    And I am on the conference sessions admin index page
    When I follow "Manage Conference Rooms"
    Then I should see "No rooms exist for the current conference year"

  Scenario: Conference organizer adds a room
    Given I am a logged in organizer
    And I am on the conference sessions admin index page
    And I follow "Manage Conference Rooms"
    And I follow "Add a Room"
    When I change the Name field to "West Room 1"
    And I change the Capacity field to "200"
    And I push the Save button
    Then I should be on the room index page
    And I should see "West Room 1 (cap. 200)"

  Scenario: Conference organizer views all session times for the current conference year
    Given there are no session times
    And I am a logged in organizer
    And I am on the conference sessions admin index page
    When I follow "Manage Conference Session Times"
    Then I should see "No session times exist for the current conference year"

  Scenario: Conference organizer adds a session time
    Given I am a logged in organizer
    And I am on the conference sessions admin index page
    And I follow "Manage Conference Session Times"
    And I follow "Add a Session Time"
    When I change the Start Time date selector to "2011 June 7 02 00"
    And I change the Duration Hours field to "0"
    And I change the Duration Minutes field to "15"
    And I push the Save button
    Then I should be on the session times index page
    And I should see "June 7, 2011 from 02:00 - 02:15"