Feature: Inventory API

  Background:
    * url baseUrl
    # choose an id not present in the initial inventory
    * def newItem = { id: '10', name: 'Hawaiian', image: 'hawaiian.png', price: '$14' }

  Scenario: Get all menu items
    Given path 'inventory'
    When method get
    Then status 200
    * def items = response.data
    * assert items.length >= 9
    * match each items == { id: '#string', name: '#string', price: '#string', image: '#string' }

  Scenario: Filter by id returns Baked Rolls x 8
    Given path 'inventory', 'filter'
    And param id = '3'
    When method get
    Then status 200
    And match response == { id: '3', name: 'Baked Rolls x 8', image: 'roll.png', price: '$10' }

  Scenario: Add item for non existent id
    Given path 'inventory', 'add'
    And request newItem
    When method post
    Then status 200

    # Verify the item created
    Given path 'inventory', 'filter'
    And param id = '10'
    When method get
    Then status 200
    And match response == newItem

  Scenario: Add item for existent id
    Given path 'inventory', 'add'
    And request newItem
    When method post
    Then status 400
    And match response == 'Bad Request'

  Scenario: Add item with missing information
    Given path 'inventory', 'add'
    And request { name: 'missing info' }
    When method post
    Then status 400
    And match response == 'Not all requirements are met'

  Scenario: Validate recently added item is present in the inventory
    Given path 'inventory'
    When method get
    Then status 200
    * def items = response.data
    * assert items.length >= 10
    * match items contains newItem
