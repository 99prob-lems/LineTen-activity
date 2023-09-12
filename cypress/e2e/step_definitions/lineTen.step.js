import { Given, When, Then, } from "@badeball/cypress-cucumber-preprocessor";

let payload = {}; // can clean up later, or maybe store in cypress.env
let baseUrl = '';

Given('I have baseurl {string}', (base) => {
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
  dataTable.hashes().forEach(row => {
    if (row.key in payload) {
      payload[row.key] = row.value
    }
  })
});

Given('I submit the request to endpoint {string}', (endPoint) => {
  cy.log(baseUrl + endPoint)
});

