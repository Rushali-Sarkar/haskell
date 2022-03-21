data Month = January | February | March | April | May | June | July | August | September | October | November | December
    deriving (Eq, Show)

data Day = Monday | Tuesday | Wednesday | Thrushday | Friday | Saturday | Sunday
    deriving (Eq, Show) 

data CalendarTime = CalendarTime {
    ctYear :: Int,
    ctMonth :: Month,
    ctDay :: Int, 
    ctHour :: Int, 
    ctMin :: Int, 
    ctSec :: Int,
    ctPicosec :: Integer,
    ctWDay :: Day,
    ctYDay :: Int,
    ctTZName :: String,
    ctTZ :: Int,
    ctIsDST :: Bool
} deriving (Show)
