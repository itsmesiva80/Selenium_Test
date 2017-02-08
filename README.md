# Selenium_Test
Selenium test for fyber

#Preconditions:
Install Python 27
Install Selenium
Install geckodriver (Firefox)

Set Your PATH variables for Python, Selenium and Gekodriver in System Environment variables
Note: Setting PATH is different in Windows, Mac and Ubuntu

Page Obects Model is used to create  test, benefits of using page object pattern:

*Creating reusable code that can be shared across multiple test cases
*Reducing the amount of duplicated code
*If the user interface changes, the fix needs changes in only one place

#To Run the Test
Navigate to Fyber_test/Page_obj

```
python testcase.py.robot

```

Also raw test without any pageobject model is available

#To run raw test
Navigate to Fyber_test/Tests

```
python Case1.py

```

Improvments:
* Test case modularity
* Reporting
