validateUsernamePassword :: String -> String -> String
validateUsernamePassword username password = 
    if null username
        then 
            (if null password
                then "Empty Username and Password"
                else "Empty Username")
        else
            (if null password
                then "Empty Password"
                else "Okay")

main = do
    username <- getLine
    password <- getLine
    print $ validateUsernamePassword username password