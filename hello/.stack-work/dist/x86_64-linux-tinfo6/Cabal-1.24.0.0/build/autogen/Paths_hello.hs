{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_hello (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
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
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/mnt/d/Haskell/hello/.stack-work/install/x86_64-linux-tinfo6/70b2e6946ca896ea4d6d67fa944074bf4f8d86260399892589f404a2ca16d8a3/8.0.1/bin"
libdir     = "/mnt/d/Haskell/hello/.stack-work/install/x86_64-linux-tinfo6/70b2e6946ca896ea4d6d67fa944074bf4f8d86260399892589f404a2ca16d8a3/8.0.1/lib/x86_64-linux-ghc-8.0.1/hello-0.1.0.0"
datadir    = "/mnt/d/Haskell/hello/.stack-work/install/x86_64-linux-tinfo6/70b2e6946ca896ea4d6d67fa944074bf4f8d86260399892589f404a2ca16d8a3/8.0.1/share/x86_64-linux-ghc-8.0.1/hello-0.1.0.0"
libexecdir = "/mnt/d/Haskell/hello/.stack-work/install/x86_64-linux-tinfo6/70b2e6946ca896ea4d6d67fa944074bf4f8d86260399892589f404a2ca16d8a3/8.0.1/libexec"
sysconfdir = "/mnt/d/Haskell/hello/.stack-work/install/x86_64-linux-tinfo6/70b2e6946ca896ea4d6d67fa944074bf4f8d86260399892589f404a2ca16d8a3/8.0.1/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hello_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hello_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hello_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hello_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hello_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
