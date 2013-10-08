Feature: Job Offers
  In order to get employees
  As a job offerer
  I want to publish my offers

  Background:
  	Given I am logged in as job offerer

  Scenario: Create new offer
    Given I access the new offer page
    When I fill the title with "Programmer vacancy"
    When I fill the category with "Technology"
		And confirm the new offer    
    Then I should see "Offer created"
    And I should see "Programmer vacancy" in My Offers
    And I should see "Technology" in My Offers

  Scenario: Edit offer
    Given I have "Programmer vacancy" offer in My Offers
    And I edit it
    And I set title to "Programmer vacancy!!!"
    And I save the modification
    Then I should see "Offer updated"
    And I should see "Programmer vacancy!!!" in My Offers

    Scenario: Edit Category
    Given I have "Programmer vacancy" offer in My Offers
    And I edit it
    And I set category to "Other Category"
    And I save the modification
    Then I should see "Offer updated"
    And I should see "Other Category" in My Offers

  Scenario: Delete offer
    Given I have "Programmer vacancy" offer in My Offers
    Given I delete it
    Then I should see "Offer deleted"
    And I should not see "Programmer vacancy!!!" in My Offers    