Feature: As a user I can see talks I might want to attend

  Scenario: Conference organizer approves proposals
    Given a proposal exists
    And there are no conference sessions
    And I am a logged in organizer
    And I am on the default proposal review page
    Then I press "Approve"
    When I am on the default conference session page
    Then I should see "Title"
    And I should see "Abstract"
    And I should see "Talk Type"
    And I should see "Talk Length"   
    And I should see "Name"
    
 


    
