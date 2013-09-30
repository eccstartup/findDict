module Data.Dict.Utils
       (
         findPuzzle,
         findSub,
         findExact,
         findAnagrams
       ) where


import Data.List
import Data.Char

dictFile :: String
dictFile = "/usr/share/dict/words"


-- | find from Dict contains Puzzle
findPuzzle :: String -> IO ()
findPuzzle word = do
  fi <- readFile dictFile
  let lis = lines fi
  mapM_ print $ helpPuzzle (map toLower word) lis

helpPuzzle :: String -> [String] -> [String]
helpPuzzle word dic = filter (isPuzzle word) dic

isPuzzle :: String -> String -> Bool
isPuzzle word word1
  | length word /= length word1 = False
  | helpMatch word word1 = True
  | otherwise = False

helpMatch :: String -> String -> Bool
helpMatch sa sb = all match1 $ zip sa sb

match1 :: (Char, Char) -> Bool
match1 (a, b)
       | a == ' ' = True
       | otherwise = a == b

-- | find from Dict matchs substring
-- data OnlyWord = String
findSub :: String -> IO ()
findSub word = do
  fi <- readFile dictFile
  let lis = lines fi
  mapM_ print $ helpSub (map toLower word) lis


helpSub :: String -> [String] -> [String]
helpSub word dic = filter (isSub word) dic

isSub :: String -> String -> Bool
isSub word word1
  | length word > length word1 = False
  | word == take (length word) word1 = True
  | otherwise = isSub word (init word1)

-- | find from Dict the exact word 
findExact :: String -> IO ()
findExact word = do
  fi <- readFile dictFile
  let lis = lines fi
  print $ helpExact (map toLower word) lis

helpExact :: Eq a => a -> [a] -> Bool
helpExact word dic
          | elem word dic = True
          | otherwise = False


findAnagrams :: String -> IO ()
findAnagrams word = do
  fi <- readFile dictFile
  let lis = lines fi
  mapM_ print $ filter (isAnagramOf word) lis

isAnagramOf :: String -> String -> Bool
isAnagramOf word1 word2 = sort word1' == sort word2' && word1' /= word2'
                          where word1' = map toLower word1
                                word2' = map toLower word2
