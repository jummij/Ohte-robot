*** Settings ***
Documentation       Navigate to anime streaming website, register, try watching anime and delete account
Library             QWeb


*** Test Cases ***
Open browser to AniMixPlay
        Navigate to website
Register failure
        Register with taken username
Register a new account
        Register successfully
Login to newly created account
        Login
Play anime 
        Anime player works
Delete user account
        Delete account

        

*** Keywords ***
Navigate to website
        OpenBrowser         https://animixplay.to/        firefox
        VerifyTitle         AniMixPlay - Watch HD Anime for Free

Register with taken username
        ClickText           Register
        VerifyText          Note: we don't use email (no reset password), to avoid forgot use password manager or google sign-in
        TypeText            Username                beauty
        TypeText            password                1234
        TypeText            Confirm Password        1234 
        ClickCheckbox       En ole robotti          on
        ClickText           Register
        VerifyText          Username is taken.

Register successfully
        [Arguments]         ${USER}=testitytto      ${PASS}=KokeiluSalis
        VerifyText          Note: we don't use email (no reset password), to avoid forgot use password manager or google sign-in
        TypeText            Username                ${USER}
        TypeText            password                ${PASS}
        TypeText            Confirm Password        ${PASS}  
        ClickCheckbox       En ole robotti          on
        ClickText           Register
Login
        [Arguments]         ${USER}=testitytto      ${PASS}=KokeiluSalis
        ClickText           Login
        TypeText            Username                ${USER}
        TypeText            password                ${PASS}
        ClickText           Login
        VerifyText          testitytto

Anime player works
        SetConfig           ShadowDOM       True
        TypeText            Search                  One Piece
        ClickText           One Piece               anchor=TV Series
        ClickText           Watch                   anchor=Genres
        ClickText           1015                    anchor=1014         

Delete account
        ClickElement        //body/div[3]/div/a[2]/i
        ClickText           User Panel  
        ClickText           Account
        ClickText           Delete account
        VerifyText          Permanently delete your account?
        ClickText           Confirm
