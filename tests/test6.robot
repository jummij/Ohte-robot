*** Settings ***
Documentation       This test uses keywords OpenWindow, SwitchWindow and CloseWindow, including some others from earlier test files
Library             QWeb



*** Test Cases ***
Open youtube   
        OpenBrowser         https://www.youtube.com/            firefox
        VerifyTitle         YouTube

Accept Cookies
        VerifyText          Ennen kuin jatkat YouTubeen
        ClickText           HYVÄKSYN

Search Video and listen to music
        TypeText            Haku              Taeyeon imvu
        ClickElement        //body/ytd-app/div[1]/div/ytd-masthead/div[3]/div[2]/ytd-searchbox/button/yt-icon
        ClickText           TAEYEON 태연 'INVU' MV
Open new tab and switch to it
        OpenWindow         
        SwitchWindow        NEW 
        GoTo                https://www.google.fi/
        VerifyTitle         Google
        ClickElement        //body/div[1]/div[3]/form/div[1]/div[1]/div[1]/div/div[2]/input
        WriteText           Taeyeon
        ClickText           Google-haku
        ClickText           Kuvahaku
Close current tab
        CloseWindow

