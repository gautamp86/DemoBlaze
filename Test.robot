*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${Url}              https://www.demoblaze.com/index.html
${SignUp}           xpath://*[@id="signin2"]
${SignupUsername}   xpath://*[@id="sign-username"]
${SignupPassword}   xpath://*[@id="sign-password"]
${SignupButton}     xpath://*[@id="signInModal"]/div/div/div[3]/button[2]
${Login}            xpath://*[@id="login2"]
${LoginUsername}    xpath://*[@id="loginusername"]
${LoginPassword}    xpath://*[@id="loginpassword"]
${LoginButton}      xpath://*[@id="logInModal"]/div/div/div[3]/button[2]
${Logout}           xpath://*[@id="logout2"]
${Contact}          xpath://*[@id="navbarExample"]/ul/li[2]/a
${ContactEmail}     xpath://*[@id="recipient-email"]
${ContactName}      xpath://*[@id="recipient-name"]
${Message}          xpath://*[@id="message-text"]
${SendMessage}      xpath://*[@id="exampleModal"]/div/div/div[3]/button[2]
${Phones}           xpath://*[text()="Phones"]
${Laptops}          xpath://*[text()="Laptops"]
${Monitors}         xpath://*[text()="Monitors"]
${SamsungGalaxys6}  xpath://*[@id="tbodyid"]/div[1]/div/div/h4/a
${SamsungGalaxys6Details}   xpath://*[@id="more-information"]/p
${Home}             xpath://*[@id="navbarExample"]/ul/li[1]/a
${Iphone632gb}      xpath://*[@id="tbodyid"]/div[5]/div/div/h4/a
${Iphone632gbDetails}   xpath://*[@id="more-information"]/p
${AddtoCartButton}  xpath://*[text()="Add to cart"]
${Cart}             xpath://*[@id="navbarExample"]/ul/li[4]/a
${CartProductTitle}  xpath://*[text()="Samsung galaxy s6"]
${CartPrice}        xpath://*[@id="tbodyid"]/tr/td[3]
${PlaceOrder}       xpath://*[@id="page-wrapper"]/div/div[2]/button
${PlaceOrderName}   xpath://*[@id="name"]
${PlaceOrderCountry}    xpath://*[@id="country"]
${PlaceOrderCity}   xpath://*[@id="city"]
${PlaceOrderCC}     xpath://*[@id="card"]
${PlaceOrderMonth}      xpath://*[@id="month"]
${PlaceOrderYear}   xpath://*[@id="year"]
${PurchaseButton}   xpath://*[@id="orderModal"]/div/div/div[3]/button[2]
${PurchaceOrderOKButton}    xpath:/html/body/div[10]/div[7]/div/button

*** Keywords ***
Launch application
    Open Browser    ${Url}  Chrome
    Maximize Browser Window

Signup
    Open Browser    ${Url}  Chrome
    Maximize Browser Window
    Click Link  ${SignUp}
    Wait Until Element Is Visible   ${SignupUsername}
    Input Text  ${SignupUsername}   test1234
    Input Text  ${SignupPassword}   test1234
    Click Button  ${SignupButton}
    Alert Should Be Present

Login
    Open Browser    ${Url}  Chrome
    Maximize Browser Window
    Click Link  ${Login}
    Wait Until Element Is Visible   ${LoginUsername}
    Input Text  ${LoginUsername}   test1234
    Input Text  ${LoginPassword}   test1234
    Click Button  ${LoginButton}
    Wait Until Element Is Visible   ${Logout}

Logout
    Wait Until Element Is Visible   ${Logout}
    Click Link  ${Logout}

Contact
    Click Link  ${Contact}
    Wait Until Element is Visible   ${ContactEmail}
    Input Text  ${ContactEmail}     abc@xyz.com
    Input Text  ${ContactName}      XYZ
    Input Text  ${Message}          All the best!
    Click Button    ${SendMessage}
    Alert Should Be Present

Categories
    Click Element   ${Phones}
    Click Element   ${Laptops}
    Click Element   ${Monitors}

Products
    Click Element   ${SamsungGalaxys6}
    Wait Until Element Is Visible   ${SamsungGalaxys6Details}
    Click Link      ${Home}
    Wait Until Element Is Visible   ${Iphone632gb}
    Click Element   ${Iphone632gb}
    Wait Until Element Is Visible   ${Iphone632gbDetails}

Add product to cart
    Click Element   ${SamsungGalaxys6}
    Wait Until Element Is Visible   ${AddtoCartButton}
    Click Element   ${AddtoCartButton}
    Alert Should Be Present

Verify cart
    Click Link  ${Cart}
    Wait Until Element Is Visible  ${CartProductTitle}
    Element Should Contain  ${CartProductTitle}     Samsung galaxy s6
    Element Should Contain  ${CartPrice}    360

Place order
    Click Button    ${PlaceOrder}
    Wait Until Element Is Visible   ${PlaceOrderName}
    Input Text  ${PlaceOrderName}   XYZ
    Input Text  ${PlaceOrderCountry}    India
    Input Text  ${PlaceOrderCity}   Pune
    Input Text  ${PlaceOrderCC}     444444444444
    Input Text  ${PlaceOrderMonth}  October
    Input Text  ${PlaceOrderYear}   2024
    Click Button    ${PurchaseButton}
    Wait Until Element Is Visible  ${PurchaceOrderOKButton}
    Click Button   ${PurchaceOrderOKButton}

Close application
    Close Browser

*** Test Cases ***
Verify Signup
    Signup
    Close application

Verify Login
    Login
    Close application

Verify Logout
    Login
    Logout
    Close application

Fill Contact Details
    Login
    Contact
    Close application

Verify Categories
    Login
    Categories
    Close application

Verify Products
    Login
    Products
    Close application

Verify Place Order
    Login
    Add product to cart
    Verify cart
    Place order
    Close application
