import {
    Given,
    When,
    Then,
    After,
    Before
  } from "@badeball/cypress-cucumber-preprocessor";

  Given("I am trying something", () => {
    cy.log('test me')
  });