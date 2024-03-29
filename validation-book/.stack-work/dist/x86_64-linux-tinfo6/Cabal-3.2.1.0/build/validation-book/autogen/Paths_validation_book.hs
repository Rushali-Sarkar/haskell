{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_validation_book (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/mnt/c/Users/Rushi/Desktop/Haskell/validation-book/.stack-work/install/x86_64-linux-tinfo6/7c05c3e047eccd4b1427137a8466bbd54b63de41652692d1aeb62ab88eaac371/8.10.4/bin"
libdir     = "/mnt/c/Users/Rushi/Desktop/Haskell/validation-book/.stack-work/install/x86_64-linux-tinfo6/7c05c3e047eccd4b1427137a8466bbd54b63de41652692d1aeb62ab88eaac371/8.10.4/lib/x86_64-linux-ghc-8.10.4/validation-book-0.1.0.0-3Kz75VpXPuV4PufdFRCjYl-validation-book"
dynlibdir  = "/mnt/c/Users/Rushi/Desktop/Haskell/validation-book/.stack-work/install/x86_64-linux-tinfo6/7c05c3e047eccd4b1427137a8466bbd54b63de41652692d1aeb62ab88eaac371/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/mnt/c/Users/Rushi/Desktop/Haskell/validation-book/.stack-work/install/x86_64-linux-tinfo6/7c05c3e047eccd4b1427137a8466bbd54b63de41652692d1aeb62ab88eaac371/8.10.4/share/x86_64-linux-ghc-8.10.4/validation-book-0.1.0.0"
libexecdir = "/mnt/c/Users/Rushi/Desktop/Haskell/validation-book/.stack-work/install/x86_64-linux-tinfo6/7c05c3e047eccd4b1427137a8466bbd54b63de41652692d1aeb62ab88eaac371/8.10.4/libexec/x86_64-linux-ghc-8.10.4/validation-book-0.1.0.0"
sysconfdir = "/mnt/c/Users/Rushi/Desktop/Haskell/validation-book/.stack-work/install/x86_64-linux-tinfo6/7c05c3e047eccd4b1427137a8466bbd54b63de41652692d1aeb62ab88eaac371/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "validation_book_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "validation_book_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "validation_book_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "validation_book_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "validation_book_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "validation_book_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
