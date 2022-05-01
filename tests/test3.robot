*** Settings ***
Documentation     Säästöpankin yhteydenottolomakkeen täyttö käyttäen QWeb librarya
Library     QWeb
Suite Teardown     CloseBrowser


*** Test Cases ***
Open browser to website
    OpenBrowser     https://www.saastopankki.fi/     firefox
    VerifyText      Säästöpankki     timeout=6
    VerifyText      Parempaa palvelua evästeiden avulla
    ClickText       Hyväksy kaikki

Navigate to contact form
    ClickText      Asiakaspalvelu
    VerifyText     Asiakaspalvelumme auttaa
    ClickText      Jätä yhteydenottopyyntö
    VerifyText     Yhteydenottolomake

Fill form with missing information
    ClickText      Säästöt ja sijoitukset
    VerifyText     Mistä aiheista olet kiinnostunut säästämiseen liittyen?
    ClickText      Säästämisen aloittaminen
    TypeText       Kerro tähän halutessasi     Haluaisin aloittaa sijoittamisen
    ClickText      Kyllä     anchor=Oletko jo Säästöpankin asiakas?
    TypeText       Nimi     Matti
    ClickText      Lähetä yhteydenottopyyntö
    VerifyText     Täytäthän tiedot

Fill in wrong format in Email Input
    TypeText       Sähköpostiosoite     Joulukuu.fi
    ClickText      Lähetä yhteydenottopyyntö
    VerifyText     Syötä oikea sähköpostiosoite.
    
Close Browser
    CloseBrowser







