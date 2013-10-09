Feature: Enviar Consulta

  Scenario: Envio de Consulta
    Given I have "Programmer vacancy" offer in My Offers
    When I click "Consulta"
    And write my consulta
    Then I should see "Consulta Enviada"
