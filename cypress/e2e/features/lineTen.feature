Feature: LineTen services test

    Background: BaseUrl
        Given I have baseurl 'https://linetencustomerapi.azurewebsites.net/'

    Scenario: Check out some stuff
        And I have the following request payload:
            | key     | value        |
            | Email   | john@doe.com |
            | Phone   | 07499111222  |
            | Address | 191 wood ln  |
            | City    | London       |
            | Zip     | W12 7FP      |
            | Country | UK           |
            | Notes   | Hello        |
         When I submit the request to endpoint 'ttte'





