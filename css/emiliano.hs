{-# LANGUAGE OverloadedStrings #-}

import Prelude hiding (div)
import Clay
import qualified Data.Text.Lazy.IO as T

-- Tango color palette
butter3 :: Color
butter3 = "#c4a000"
chocolate3 :: Color
chocolate3 = "#8f5902"
orange1 :: Color
orange1 = "#fcaf3e"
orange3 :: Color
orange3 = "#ce5c00"
scarlet3 :: Color
scarlet3 = "#a40000"
aluminium1 :: Color
aluminium1 = "#eeeeec"
aluminium2 :: Color
aluminium2 = "#d3d7cf"
aluminium3 :: Color
aluminium3 = "#babdb6"
aluminium4 :: Color
aluminium4 = "#888a85"
aluminium5 :: Color
aluminium5 = "#555753"
aluminium6 :: Color
aluminium6 = "#2e3436"


emiliano :: Css
emiliano = do
    body ? do background  aluminium1
              color       aluminium6
              fontFamily  ["Helvetica"] [sansSerif]
              fontSize    (pt 12)
              marginLeft  auto
              marginRight auto
              width       (pt 500)
    div # "#content" ? do backgroundColor    white
                          backgroundImage    (url "file:///home/neil/projets/emiliano/_site/images/woio.png")
                          backgroundRepeat   noRepeat
                          backgroundPosition (placed sideBottom sideRight)
                          paddingLeft        (pt 8)
                          paddingRight       (pt 8)
                          paddingTop         (pt 2)
                          paddingBottom      (pt 1)
                          marginTop          (pt 8)
                          marginBottom       (pt 8)
                          borderRadius       (pt 4)
    div # "#header" ? do
        marginBottom (pt 0)
        color aluminium4
        a # href ? color aluminium4
        div # "#logo" ? do float sideLeft
                           fontSize (pt 16)
                           a # href ? color aluminium3
        div # "#navigation" ? do textAlign (alignSide sideRight)
                                 fontVariant smallCaps
    div # "#footer" ? do fontSize  (pt 8)
                         color     aluminium4
                         textAlign (alignSide sideRight)
                         a # href ? color aluminium4
    h1 ? do fontSize (pt 12)
            color orange3
    h2 ? do fontSize (pt 10)
            color butter3
    p ? do margin (pt 4) (pt 4) (pt 8) (pt 4)
    a ? do textDecoration none
    a # href ? color chocolate3
    a # href # hover ? textDecoration underline
    ul ? do "list-style" -: "none"
            paddingLeft  (pt 0)
            marginTop    (pt 5)
            marginBottom (pt 5)
            li ? ":before" ? do color orange1
                                content (stringContent "» ")
    ul # "#recent-posts" ? do fontSize     (pt 10)
                              marginTop    (pt 0)
                              marginBottom (pt 0)
    div # "#welcome" ? paddingRight (px 188)
    ".more" ? do textAlign   (alignSide sideRight)
                 fontSize    (pt 10)
                 marginTop   (pt (-4))

main :: IO ()
main = T.putStr $ render emiliano