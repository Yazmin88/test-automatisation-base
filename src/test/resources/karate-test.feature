Feature: TEST_EXAMEN

  Background:
    * url1= 'http://bp-se-test-cabcd9b246a5.herokuapp.com/yquinone/api/characters'
    * url2= 'http://bp-se-test-cabcd9b246a5.herokuapp.com/yquinone/api/characters'
    * url3= 'http://bp-se-test-cabcd9b246a5.herokuapp.com/yquinone/api/characters'
    * url4= 'http://bp-se-test-cabcd9b246a5.herokuapp.com/yuinone/api/characters'
    * url5= 'http://bp-se-test-cabcd9b246a5.herokuapp.com/yquinone/api/characters/1'
    * url6= 'http://bp-se-test-cabcd9b246a5.herokuapp.com/yquinone/api/characters/1'
    * url7= 'http://bp-se-test-cabcd9b246a5.herokuapp.com/yquinone/api/characters/999'

  @id:1 @Obtenertodoslospersonajes
  Scenario: Obtener todos los personajes
    Given url url1
    When method GET
    Then status 200

@id:2 @CrearPersonajeExitoso
Scenario: CrearPersonajeExitoso
  Given url url2
  And def user = read('classpath:../Data/CrearPersonajeExitoso/body.json')
  And request user
  When method POST
  Then status 201
  * print response

@id:3 @CrearPersonajeDuplicado
Scenario: CrearPersonajeDuplicado
    Given url url3
    And def user = read('classpath:../Data/CrearPersonajeNombreDuplicado/body.json')
    And request user
    When method POST
    Then status 400
    * print response

@id:4 @CrearPersonajeInvalido
Scenario: CrearPersonajeInvalido
    Given url url4
    And def user = read('classpath:../Data/CrearPersonajeInvalido/body.json')
    And request user
    When method POST
    Then status 400
    * print response

@id:5 @ObtenerPersonajeporID
Scenario: ObtenerPersonajeporID
    Given url url5
    And def user = read('classpath:../Data/ObtenerPersonajeID/body.json')
    And request user
    When method GET
    Then status 200
    * print response

@id:6 @ActualizarPersonaje
Scenario: ActualizarPersonaje
    Given url url6
    And def user = read('classpath:../Data/ActualizarPersonaje/body.json')
    And request user
    When method PUT
    Then status 200
    * print response

@id:7 @ActualizarPersonajeInexitente
Scenario: ActualizarPersonajeInexitente
    Given url url7
    And def user = read('classpath:../Data/ActualizarPersonajeInexistente/body.json')
    And request user
    When method PUT
    Then status 404
    * print response




