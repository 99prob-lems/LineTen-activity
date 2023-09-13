import { Given, When, Then} from "@badeball/cypress-cucumber-preprocessor";

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

When('I submit a {string} request to the following endpoint {string}', (httpMethod, endPoint) => {
  const url =  baseUrl+endPoint;

  cy.request({
    method: httpMethod,
    url: url,
    body: payload,
    headers: {
        'Content-type': 'application/json; charset=UTF-8',
    },
    failOnStatusCode: false
}).as('Response')
});

Then('Response code {int} is returned', (responseCode) => {
  cy.get('@Response').its('status').should('eq', responseCode)
});

Then('The error message in the response will be {string}', (expectedMessage) => {
  cy.get('@Response').then(response => {
    expect(response.body.errors.Name[0]).to.eq(expectedMessage)
  })
});

