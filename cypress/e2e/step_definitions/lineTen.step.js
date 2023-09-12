import {
    Given,
    When,
    Then,
    After,
    Before
  } from "@badeball/cypress-cucumber-preprocessor";

  const payload = {}; // can clean up later, or maybe store in cypress.env
  const baseUrl = '';

  Given('I have baseurl {string }', (base) => {
    baseUrl = base;
  });

  Given('I have the following request payload:', (dataTable) => {
    payload = {
      Email: null,
      Phone: null,
      Address: null,
      City: null,
      Zip: null,
      Country: null,
      Notes: null
    }
    dataTable.hashes().forEach(row =>{
      if (row.key in payload) {
        payload[row.key] = row.value
      }
    })
  });

  Given('I submit the request to endpoint {string}', (endPoint) => {
    cy.log(baseUrl+endPoint)
  });

  