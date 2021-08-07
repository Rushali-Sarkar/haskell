-- If Then Else Statements

function :: Integer -> Integer -> Integer
function x y = if (x > y) then (x + 10) else y

-- This word function is not a keyword or built-in Haskell; we are using this generic
-- name because this is a throwaway function (many Haskell tutorials would simply 
-- call this f, the traditional abbreviation for function).

-- The if-then-else pattern in Haskell corresponds to conditonal patterns in other
-- languages. It is worth pointing out that the else is not optional in Haskell; if
-- you have an if you must always define a then and an else. This is because the
-- expression that follows the if keyword evaluates to a value of type Bool, and we
-- want to make sure we are handling both possible cases: True and False.

-------------------------------------------------------------------------------------

-- Case Statements

-- case is a keyword in Haskell that must always be paired with the keyword of.
-- The Bool type has only two values also known as its constructors - True and False.

-- Functions that do not handle all possible cases are called partial functions and
-- the ones that handle all possible cases are known as total functions

function2 :: Integer -> Integer -> Integer
function2 x y = 
    case (x > y) of
        -- when False, return y
        False -> y
        -- when True, return x + 10
        True -> x + 10


-- Bool has two constructors seperated by a pipe. In this case pipe represents a
-- exclusive or. A value of type bool can either be True or False but never both
-- Data types like this having more than one constructor, are called sum types.