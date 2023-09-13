Feature: LineTen services tests in BDD

    Background: Set the baseurl
        Given I have baseurl 'https://linetencustomerapi.azurewebsites.net/'

    Scenario Outline: Bad request <Scenario>
        Given I have the following request payload:
            | key     | value       |
            | Name    | <Name>      |
            | Email   | <Email>     |
            | Phone   | 07499111222 |
            | Address | 191 wood ln |
            | City    | London      |
            | Zip     | W12 7FP     |
            | Country | UK          |
            | Notes   | Hello       |
        When I submit a 'POST' request to the following endpoint 'Api/add'
        Then Response code 400 is returned
        And The error message in the response will be '<ErrorMessage>'
        Examples: Unsuccessful add scenarios
            | Scenario                                                                           | Name  | Email        | ErrorMessage                 |
            | 1 Unsuccessfull add request with missing Name field returns 400 response           |       | john@doe.com | The Name field is required.  |
            | 2 Unsuccessfull add request with missing Name and Email field returns 400 response |       |              | The Name field is required.  |
            | 3 Unsuccessfull add request with missing Email field returns 400 response          | James |              | The Email field is required. |





