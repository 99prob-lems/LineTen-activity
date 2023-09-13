import { Given, When, Then} from "@badeball/cypress-cucumber-preprocessor";

let payload = {}; // can clean up later, or maybe store in cypress.env
let baseUrl = '';

Given('I have baseurl {string}', (base) => {
  baseUrl = base;
});

Given('I have the following request payload:', (dataTable) => {
  payload = {
    Name: null,
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
  cy.get('@Response').its('status').should('eq', responseCode);
});

Then('The error message in the response will be {string}', (expectedMessage) => {
  cy.get('@Response').then(response => {
    if(expectedMessage.includes('Name')){expect(response.body.errors.Name[0]).to.eq(expectedMessage)};
    if(expectedMessage.includes('Email')){expect(response.body.errors.Email[0]).to.eq(expectedMessage)};
  })
});

Then('I assert the response body has the following content:', (dataTable) => {
  cy.get('@Response').then(response =>{
    dataTable.hashes().forEach(row => {
      expect(response.body[row.key]).to.eq(row.value);
    })
  })
});

Then('I assert the response body for index {int} of get response has content:', (index, dataTable) => {
  cy.get('@Response').then(response =>{
    const data = response.body[index];
    dataTable.hashes().forEach(row => {
      expect(data[row.key]).to.eq(row.value);
    })
  })
});

Then('Field {string} in response body returns {string}', (field, responseData) => {
  cy.get('@Response').then(response =>{
    const data = response.body;
    expect(data[field]).to.eq(responseData);
  })
});

