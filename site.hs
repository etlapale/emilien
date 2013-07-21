{-# LANGUAGE OverloadedStrings #-}

import Data.Monoid (mappend)
import Hakyll
import System.IO.Unsafe


main :: IO ()
main = hakyllWith conf $ do
    match ("images/*" .||. "data/**") $ do
        route   idRoute
        compile copyFileCompiler
        
    match ".htaccess" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*.hs" $ do
        route   $ setExtension "css"
        compile $ getResourceString >>= withItemBody (unixFilter "runghc" [])

    match ("*xico*.md" .||. "projects.md" .||. "projects/*.md")$ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" xicoCtx
            >>= relativizeUrls

    match "*.md" $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" emilCtx
            >>= relativizeUrls

    match "posts/*.md" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            let archiveCtx =
                    field "posts" (\_ -> postList recentFirst) `mappend`
                    constField "title" "Archives"              `mappend`
                    emilCtx

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls


    match "index.html" $ do
        route idRoute
        compile $ do
            {-let indexCtx = field "posts" $ \_ ->
                                postList $ fmap (take 3) . recentFirst-}
            getResourceBody
                -- >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" postCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler

  where
    myIgnoreFile ".htaccess" = False
    myIgnoreFile path        = ignoreFile defaultConfiguration path
    conf = defaultConfiguration { ignoreFile = myIgnoreFile }


postCtx :: Context String
postCtx =
  dateField "date" "%B %e, %Y" `mappend`
  emilCtx

emilCtx :: Context String
emilCtx =
  constField "author" "Émilien Tlapale" `mappend`
  constField "home" "index.html" `mappend`
  listField "navigitems" navigCtx (mapM navigItem items) `mappend`
  defaultContext
  where items = [("Home", "index.html"),
                 ("Research", "research.html"),
                 ("Contact", "contact.html")]

xicoCtx :: Context String
xicoCtx =
  constField "author" "Xīcò" `mappend`
  constField "home" "projects.html" `mappend`
  listField "navigitems" navigCtx (mapM navigItem items) `mappend`
  defaultContext
  where items = [("Projects", "projects.html"),
                 ("Contact", "contact-xico.html")]

navigItem :: (String,Identifier) -> Compiler (Item String)
navigItem (t,u) = return $ Item u t

navigCtx :: Context String
navigCtx =
  field "title" (return . itemBody) `mappend`
  field "url" (return . toFilePath . itemIdentifier) `mappend`
  defaultContext

postList :: ([Item String] -> Compiler [Item String]) -> Compiler String
postList sortFilter = do
    posts   <- sortFilter =<< loadAll "posts/*"
    itemTpl <- loadBody "templates/post-item.html"
    list    <- applyTemplateList itemTpl postCtx posts
    return list
