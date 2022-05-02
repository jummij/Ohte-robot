*** Settings ***
Documentation       Using ClickUntil to get number 15 from number generator (1 - 100)
Library             QWeb

*** Test Cases ***
Open browser to website
        OpenBrowser         https://www.random.org/     firefox
        VerifyTitle         RANDOM.ORG - True Random Number Service
Accept Cookies  
        VerifyText          RANDOM.ORG Uses Cookies
        ClickText           Allow Selected
Generate random number
        ClickUntil          15          Generate           timeout=160s         interval=1s  anchor=result:



