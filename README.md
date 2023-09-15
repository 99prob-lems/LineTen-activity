Certainly! Here's the extended README:

---

## LineTen Customer API Cypress Tests in Cucumber

This README provides a quick guide on how to set up and run the LineTen Customer API tests using Cypress in Cucumber.

### Prerequisites

Before running the tests, ensure the following prerequisites are met:

1. **Clone the Repository**: If you haven't already, clone this repository to your local machine using:

   Make sure you navigate to the directory where the repository is cloned.

2. **Docker**: The tests are containerized using Docker. If you don't have Docker installed, download and install it from [Docker's official site](https://www.docker.com/products/docker-desktop).

3. **Visual Browser Testing (Optional)**:
   
   If you wish to run the tests and see the visuals in a browser:
   
   - **Node.js**: Ensure you have Node.js installed. If not, download and install it from [Node's official site](https://nodejs.org/).
   
   - **Dependencies**: Navigate to the project directory and run:
     ```
     npm install
     ```

   - **Chromium-Based Browser**: Make sure you have a Chromium-based browser (like Chrome or Edge) installed. This will be used by Cypress to run the tests in a visual mode.

### Running the Tests

**Using Docker**:

1. **Build the Docker Image**:
   ```
   docker build -t lineten-activity .
   ```

2. **Run the Tests**:
   ```
   docker run lineten-activity
   ```

   Once you execute this command, the tests will run and you will be able to see the test results in the terminal.

**Using a Visual Browser (Optional)**:

If you've installed Node.js and the project's dependencies and wish to see the test run visually:

1. Run the tests using:
   ```
   npx cypress open
   ```

   This will open the Cypress Test Runner and you can select the tests to run. They will be executed in a visual browser, and you can watch them as they progress.

### Viewing the Test Report

After the tests have completed, navigate to the root folder of the repository. You will find a `cucumber-reporter.html` file. Open this file using a web browser to view the detailed test report.

---

And that's it! You've successfully run the LineTen Customer API tests using Cypress in Cucumber. 
