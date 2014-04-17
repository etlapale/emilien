{-# LANGUAGE OverloadedStrings #-}

import Prelude hiding (div)
import Clay
import qualified Data.Text.Lazy.IO as T

-- Tango color palette
butter1 :: Color
butter1 = "#fce94f"
butter3 :: Color
butter3 = "#c4a000"
chocolate3 :: Color
chocolate3 = "#8f5902"
orange1 :: Color
orange1 = "#fcaf3e"
orange3 :: Color
orange3 = "#ce5c00"
sky1 :: Color
sky1 = "#729fcf"
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
    fontFace $ do fontFamily ["Fira Sans Regular"] []
                  fontFaceSrc [FontFaceSrcUrl "../fonts/FiraSansOT-Regular.otf" (Just OpenType)]
    body ? do background  aluminium1
              color       aluminium6
              fontFamily  ["Fira Sans Regular"] [sansSerif]
              fontSize    (pt 13)
              -- fontWeight  (weight 300)
              marginLeft  auto
              marginRight auto
              width       (pt 500)
    div # "#content" ? do backgroundColor    white
                          backgroundImage    (url "/images/woio.png")
                          backgroundRepeat   noRepeat
                          backgroundPosition (placed sideBottom sideRight)
                          paddingLeft        (pt 8)
                          paddingRight       (pt 8)
                          paddingTop         (pt 2)
                          paddingBottom      (pt 1)
                          marginTop          (pt 8)
                          marginBottom       (pt 8)
                          borderRadius       (pt 4) (pt 4) (pt 4) (pt 4)
    div # "#header" ? do
        marginBottom (pt 0)
        color aluminium4
        a # href ? color aluminium4
        div # "#logo" ? do float      floatLeft
                           fontSize   (pt 20)
                           fontWeight (weight 400)
                           a # href ? color aluminium3
        div # "#navigation" ? do textAlign (alignSide sideRight)
                                 fontVariant smallCaps
    div # "#footer" ? do fontSize  (pt 10)
                         color     aluminium4
                         textAlign (alignSide sideRight)
                         a # href ? color aluminium4
    h1 ? do fontSize   (pt 13)
            fontWeight (weight 600)
            color      orange3
    h2 ? do fontSize (pt 11)
            fontWeight (weight 600)
            color butter3
    p ? margin (pt 4) (pt 4) (pt 8) (pt 4)
    pre ? margin (pt 4) (pt 4) (pt 8) (pt 4)
    a ? textDecoration none
    a # href ? color chocolate3
    a # href # hover ? textDecoration underline
    code ? do fontFamily  ["calluna-sans", "Calluna Sans"] [sansSerif]
              fontSize    (pt 13)
              fontWeight  (weight 300)
    ul ? do "list-style" -: "none"
            paddingLeft  (pt 0)
            marginTop    (pt 5)
            marginBottom (pt 5)
            li ? do
              p # ":before" ? do color orange1
                                 content (stringContent "» ")
    ul # "#recent-posts" ? do fontSize     (pt 10)
                              marginTop    (pt 0)
                              marginBottom (pt 0)
    div # "#welcome" ? paddingRight (px 188)
    div # ".info" ? do color        aluminium3
                       fontSize     (pt 10)
                       marginTop    (pt (-8))
                       marginBottom (pt 12)
    div # ".figure" ? do textAlign (alignSide sideCenter)
    p # ".caption" ? do color     aluminium4
                        fontStyle italic
                        fontSize  (pt 10)
    ".more" ? do textAlign   (alignSide sideRight)
                 fontSize    (pt 11)
                 marginTop   (pt (-4))
    blockquote ? do fontStyle  italic
                    textAlign  (alignSide sideRight)
    --blockquote # ":before" ? do content  (stringContent "“")
    --                            color    aluminium2
    --                            fontSize (pt 38)
    --                            fontWeight bold

main :: IO ()
main = T.putStr $ render emiliano
