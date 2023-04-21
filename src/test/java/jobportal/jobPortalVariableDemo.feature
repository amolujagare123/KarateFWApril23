Feature: check and understand about variables

  Background: global variables definition
    * def operating_system = 'windows'
    * def time_out = 120
    * def common = 0

  Scenario: to create variables
    Given def var_1 = 10
    * def var_2 = 'amol'
    * def var_3 = true
    * def common = 100
    When def var_4 = var_1 + 25
    Then print 'var_1=' , var_1
    * print 'var_2=' , var_2
    * print 'var_3=' + var_3
    * print 'var_4=' + var_4
    * print 'operating_system=' + operating_system
    * print 'time_out=' + time_out
    * print 'common=' , common

  Scenario:Access variables
   Given def var_1 = 11
   * def var_2 = 'java'
    * def var_3 = false
   When def var_4 = var_1 + 30
    * print 'common=' , common
    * print 'var_2=' , var_2
    * print 'var_2=' , var_2
    * print 'var_3=' + var_3
    * print 'var_4=' + var_4
    * print 'operating_system=' + operating_system
    * print 'time_out=' + time_out

  Scenario:Read json file
    * def myFile = read('sample.json')
    # * def jsonFile = read('input.json')
    * print 'myFile=' , myFile
