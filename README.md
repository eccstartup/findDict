findDict
========

Find words in UNIX/Linux systems

----
install

```
git clone https://github.com/eccstartup/findDict
cd findDict
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
some other words
`/usr/share/dict/words` holds all the words for `GNU aspell` in UNIX/Linux systems.

----
FOR THOSE WHO PLAY WORD PUZZLES!
