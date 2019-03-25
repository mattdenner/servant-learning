{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TypeOperators   #-}
module Lib
    ( startApp
    , app
    ) where

import Network.Wai
import Network.Wai.Handler.Warp
import Servant

-- The `API` type describes the interface to the API.  It is the description of the routes
-- into the API and their associated behaviours.  Routes are handled by a verb (`Get`)
-- which returns a bunch of content in a set of mime-types.
type API = "hello"   :> Get '[PlainText] String
      :<|> "goodbye" :> QueryParam "name" String :> Get '[PlainText] String

-- Each route is managed by a function that'll return a `Handler` containing the result.
-- Notice that the `QueryParam` might not be present and therefore we have to use `Maybe`
-- as the argument.
--
-- NOTE: `return` here is a little redundant as these can be written as simple functions
sayHello :: Handler String
sayHello = return "hello"

sayGoodbye :: Maybe String -> Handler String
sayGoodbye Nothing = return "later"
sayGoodbye (Just name) = return ("goodbye " ++ name)

-- `server` is the actual code that handles the API.  It needs to be defined in the same order
-- as the `API` type because that's what `Server API` is saying!
server :: Server API
server = sayHello
    :<|> sayGoodbye

-- All of this is around serving the application.
startApp :: Int -> IO ()
startApp port = run port app

app :: Application
app = serve api server

api :: Proxy API
api = Proxy
