findDict
========

Find words in UNIX/Linux systems

----
install

```
cabal configure
cabal build
cabal install
```

----
ussage

```
import Data.Dict.Utils
-- find exact word
findExact "apple"
-- return True

-- find substring
findSub "app"
-- return a list of strings

-- find puzzle
findPuzzle "a  le"
-- return a list of words
```

----
FOR THOSE WHO PLAY WORD PUZZLES!
