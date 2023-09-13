Feature: LineTen services tests in BDD

    Background: Set the baseurl
        Given I have baseurl 'https://linetencustomerapi.azurewebsites.net/'

    Scenario Outline: Bad Add request <Scenario>
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

    Scenario Outline: 4 Successfull Add request returns 200 response
        Given I have the following request payload:
            | key     | value        |
            | Name    | John Doe     |
            | Email   | john@doe.com |
            | Phone   | 07499111222  |
            | Address | 191 wood ln  |
            | City    | London       |
            | Zip     | W12 7FP      |
            | Country | UK           |
            | Notes   | Hello        |
        When I submit a 'POST' request to the following endpoint 'Api/add'
        Then Response code 200 is returned
        And I assert the response body has the following content:
            | key     | value        |
            | Name    | John Doe     |
            | Email   | john@doe.com |
            | Phone   | 07499111222  |
            | Address | 191 wood ln  |
            | City    | London       |
            | Zip     | W12 7FP      |
            | Country | UK           |
            | Notes   | Hello        |

    Scenario Outline: 5 Successfull get request returns 200 response
        When I submit a 'GET' request to the following endpoint 'Api/get'
        Then Response code 200 is returned
        And I assert the response body for index 0 of get response has content:
            | key  | value    |
            | Name | John Doe |
        And I assert the response body for index 1 of get response has content:
            | key  | value    |
            | Name | Jane Doe |

    Scenario Outline: 6 Unsuccessfull get request returns 404 response
        When I submit a 'GET' request to the following endpoint 'Api/get/1cedd95b-da95-4231-bc05-ba23a9f8b697'
        Then Response code 404 is returned
        And Field 'title' in response body returns 'Not Found'

    Scenario Outline: 7 Successfull get request by ID returns 200 response
        When I submit a 'GET' request to the following endpoint 'Api/get/c241a259-58b0-4936-b27d-6a393f0c95eb'
        Then Response code 200 is returned
        And I assert the response body has the following content:
            | key  | value                                |
            | Name | John Doe                             |
            | Id   | c241a259-58b0-4936-b27d-6a393f0c95eb |

