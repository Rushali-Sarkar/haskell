--file: ch03/BookStore.hs

data BookInfo = Book Int String [String]
    deriving (Show)

data MagazineInfo = Magazine Int String [String]
    deriving (Show)

myInfo = Book 9780135072455 "Algebra of Programming" ["Richard Bird","Oege de Moor"] 

data BookReview = BookReview BookInfo CustomerID String
    deriving (Show)

type CustomerID = Int
type ReviewBody = String

data BetterReview = BetterReview BookInfo CustomerID ReviewBody
    deriving (Show)

type BookRecord = (BookInfo, BookReview) 
type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address | CashOnDelivery | Invoice CustomerID
    deriving (Show)

bookId (Book id _ _) = id
bookTitle (Book _ title _) = title
bookAuthors (Book _ _ authors) = authors


-- data Csutomer = Customer Int String [String]
--  deriving (Show)
-- customerID :: Customer -> Int
-- customerID (Customer id _ _) = id
-- customerName :: Customer -> String
-- customerName (Customer _ name _ ) = name
-- customerAddress :: Customer -> [String]
-- customerAddress (Customer _ _ address) = address


data Customer = Customer {
    customerID :: CustomerID,
    customerName :: String,
    customerAddress :: Address
} deriving (Show)

