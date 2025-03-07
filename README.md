# Seminaarityö - Robot Framework web testing

This is a report about my learning process on Robot Framework web testing for a school assignment. The [tests folder](https://github.com/jummij/ohte-robot/tree/main/tests) contains six test files.

My goal was to get a feel of what web testing with [Robot Framework](https://robotframework.org/) is like and to write some simple test cases myself.
I have also experimented with many other keywords not included in the test files during the learning process.


### Table of Contents


  - [Installation](#installation)
  - [Getting started](#getting-started)
  - [1. test.robot](#1-testrobot)
  - [2. test2.robot](#2-test2robot)
  - [3. test3.robot](#3-test3robot)
  - [4. test4.robot](#4-test4robot)
  - [5. test5.robot](#5-test5robot)
  - [6. test6.robot](#6-test6robot)


<hr />



## Installation

Python is required to be installed. Install Python to PATH on Windows machines. Web testing (Selenium library and QWeb library) requires a browser driver to be installed before any tests can be run. 


* [python](https://www.python.org/downloads/) (See [installation instructions](https://github.com/robotframework/robotframework/blob/master/INSTALL.rst))

To install Robot framework and SeleniumLibrary:
 ```
 pip install robotframework
 pip install -U selenium
```
**OR**
```
 pip install robotframework-seleniumlibrary 
```

To install QWeb Library:
```
 pip install QWeb
```

Install a browser driver to run tests:
* [Browser drivers](https://www.selenium.dev/selenium/docs/api/py/index.html#drivers)

## Getting started

There are user guides and tutorials available for Robot Framework and for each Library that are used in the test cases. 

* [Keyword documentation SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
* [Keyword documentation QWeb](https://help.pace.qentinel.com/qwords-reference/current/qwords/_attachments/QWeb.html#)
* [QWeb tutorial](https://github.com/qentinelqi/qweb_workshop)

To run test, use command:

```
robot testfile.robot
```

<hr />


## 1. test.robot

[test.robot](https://github.com/jummij/ohte-robot/blob/main/tests/test.robot) was the first test file I made after skimming through the guides. The test could not be finished as I did not know how to accept the cookies. The next goal was to figure out how to accept the cookies.

## 2. test2.robot

[test2.robot](https://github.com/jummij/ohte-robot/blob/main/tests/test2.robot) navigates inside a website to a contact form. It uses simple keywords such as *Click Element* and *Title Should Be*. This time I have accepted cookies successfully.

Compare the used keywords:

*test.robot*, accepting cookies **did not** work:
```
Accept Cookies
        Wait Until Page Contains     Ennen kuin jatkat
        Select Frame     //*[@id="dialog"]
        Click Button      //body/ytd-app/ytd-consent-bump-v2-lightbox/tp-yt-paper-dialog/div[4]/div[2]/div[5]/div[2]/ytd-button-renderer[2]   
```

*test2.robot*, accepting cookies **works**:
```
Accept Cookies
        Get Web Element     //body/div[1]/div[1]/div[2]/span[1]/a
        Click Element     //*[@id="cmpbntyestxt"]
```

## 3. test3.robot

The previous two test files implement SeleniumLibrary whereas [test3.robot](https://github.com/jummij/ohte-robot/blob/main/tests/test3.robot) implements QWeb library. QWeb made web testing even easier, as it did not need xpaths as locators, but instead uses string values as locators, e.g the text that we see on the website itself.

This test file goes one step further than the previous test file, and tries to fill the contact form. With the keyword *VerifyText*, the program can verify whether the expected results appear or not. Here we check for missing required fields.

## 4. test4.robot

[test4.robot](https://github.com/jummij/ohte-robot/blob/main/tests/test4.robot) tests register, login and account delete functions. In the beginning it tries to register with a taken username, which should prompt an error message. Registering with an available username and bot check should work fine, and so should account deletion.

Let's have a look into some of the test cases in this file.

The fist test case opens the browser straight to the website, and verifies from the title that we are in the correct website:
```
*** Keywords ***
Navigate to website
        OpenBrowser         https://animixplay.to/        firefox
        VerifyTitle         AniMixPlay - Watch HD Anime for Free
```

When deleting an account, it must prompt a confirmation box before proceeding with the deletion:
```
Delete account
        ClickElement        //body/div[3]/div/a[2]/i
        ClickText           User Panel  
        ClickText           Account
        ClickText           Delete account
        VerifyText          Permanently delete your account?
        ClickText           Confirm
 ```


## 5. test5.robot

[test5.robot](https://github.com/jummij/ohte-robot/blob/main/tests/test5.robot) features the keyword *ClickUntil*. The test clicks a certain button so long until it gets the expected value anywhere on the website (or until time runs out). This test clicks a button that generates a random number between 1 and 100.


![ClickUntil](https://media3.giphy.com/media/flEKRHK7YsIQt4KqC6/giphy.gif?cid=790b7611237ad0fbaefd941ecbb130acbbeb316b62093186&rid=giphy.gif&ct=g)

## 6. test6.robot

[test6.robot](https://github.com/jummij/ohte-robot/blob/main/tests/test6.robot) uses the keywords *OpenWindow, SwitchWindow* and *CloseWindow*, which creates a new tab, switches to another tab and closes the current tab, respectively.

