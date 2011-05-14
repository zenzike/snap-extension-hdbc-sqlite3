{-|

'Snap.Extension.HDBC.Sqlite3' implements a 'MonadHDBC' by using
a connection to an Sqlite3 database.

-}

module Snap.Extension.HDBC.Sqlite3
  ( hdbcInitializer
  , module Snap.Extension.HDBC
  ) where

import Control.Monad.IO.Class ( liftIO )

import Database.HDBC         ( ConnWrapper (..) )
import Database.HDBC.Sqlite3 ( connectSqlite3 )

import Snap.Extension ( Initializer, mkInitializer )
import Snap.Extension.HDBC



-- | The Initializer for 'Connection'.
-- The 'FilePath' points the the Sqlite3 database that is to 
-- be connected to.
hdbcInitializer :: FilePath -> Initializer HDBCState
hdbcInitializer path =
  liftIO (connectSqlite3 path) >>= mkInitializer . HDBCState . ConnWrapper


