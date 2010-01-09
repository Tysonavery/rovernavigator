Feature: Engineer provides instructions to the system

  As a NASA Engineer
  In order to easily input a predefined set of instructions into the system
  I want to be able to specify a instrcution file for the system to process and then have the system process those instructions
  
Scenario: Provide the system with instructions 
  Given I have started the system
  And I provide a instruction file called 'input1.txt'
  Then the system should read in the file and have it ready for processing
