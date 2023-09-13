Feature: LineTen services tests in BDD

    Background: Set the baseurl
        Given I have baseurl 'https://linetencustomerapi.azurewebsites.net/'

    Scenario: Submit request with missing Name field in request returns 400 response
        Given I have the following request payload:
            | key     | value        |
            | Email   | john@doe.com |
            | Phone   | 07499111222  |
            | Address | 191 wood ln  |
            | City    | London       |
            | Zip     | W12 7FP      |
            | Country | UK           |
            | Notes   | Hello        |
         When I submit a 'POST' request to the following endpoint 'Api/add'
         Then Response code 400 is returned
         And The error message in the response will be 'The Name field is required.'




