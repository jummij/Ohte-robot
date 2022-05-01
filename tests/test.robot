*** Settings *** 
Documentation     Youtubeen navigointi, tässä testissä en vielä osannut hyväksyä evästeitä
Library           SeleniumLibrary

** Test Cases ***
Go to Youtube
        Open Browser to Youtube
        Accept Cookies
        Search Video
        


*** Keywords ***
Open Browser to Youtube
        Open Browser     https://www.youtube.com/

Accept Cookies
        Wait Until Page Contains     Ennen kuin jatkat
        Select Frame     //*[@id="dialog"]
        Click Button      //body/ytd-app/ytd-consent-bump-v2-lightbox/tp-yt-paper-dialog/div[4]/div[2]/div[5]/div[2]/ytd-button-renderer[2]     
Search Video
        Input Text     search_field     Madonna
        Click Button     search_button