*** Settings *** 
Documentation     Navigointi yhteystietolomakkeeseen Vattenfallin sivustolla, tässä testissä evästeiden hyväksyminen onnistuu
Library           SeleniumLibrary

** Test Cases ***
Open browser to website
        Open browser to vattenfall
Accept cookies
        Accept Cookies
Navigating on website
        Navigate to contact form


*** Keywords ***
Open browser to vattenfall
        Open Browser     https://www.vattenfall.fi/
        Wait Until Page Contains     Palvelumme
        Title Should Be      Fossiilivapaata sähköä kaikkialle Suomeen - Vattenfall

Accept Cookies
        Get Web Element     //body/div[1]/div[1]/div[2]/span[1]/a
        Click Element     //*[@id="cmpbntyestxt"]


Navigate to contact form
        Click Element     //body/header/div/div/ul[1]/li[15]/a[1]/span
        Click Element     //body/header/div/div/ul[1]/li[16]/div/ul/li/a
        Scroll Element Into View     //body/main/div[2]/div/div[3]/section/div/div/div/div[2]/div/div/div/div[1]/h2
        Click Element     //body/main/div[2]/div/div[3]/section/div/div/div/div[2]/div/div/div/div[1]/p[3]/a/span
