import XMonad

main :: IO ()
main = xmonad $ def
    { modMask = mod4Mask
    }
