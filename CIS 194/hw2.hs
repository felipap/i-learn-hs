{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where
import Log

-- Exercise 1

parseMessage :: String -> LogMessage
parseMessageList :: [[Char]] -> LogMessage
parse :: String -> [LogMessage]

parseMessageList ("I":tstamp:rest) = LogMessage Info (read tstamp :: Int) (unwords rest)
parseMessageList ("W":tstamp:rest) = LogMessage Warning (read tstamp :: Int) (unwords rest)
parseMessageList ("E":severity:tstamp:rest) = LogMessage (Error (read severity :: Int)) (read tstamp :: Int) (unwords rest)
parseMessageList other = Unknown (unwords other)

parseMessage msg = parseMessageList (words msg)

parse text = map parseMessage (lines text)

-- Exercise 2

insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) mt = mt
insert alog Leaf = Node Leaf alog Leaf
insert alog@(LogMessage _ stamp _) (Node mt1 (LogMessage _ mstamp _) mt2)
	| stamp > mstamp = -- add right
		insert alog mt2
	| stamp < mstamp = -- add left
		insert alog mt1

-- Exercise 3

build :: [LogMessage] -> MessageTree
build [] = Leaf
build (msg1:rest) = insert msg1 (build rest)

-- Exercise 4
inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node mt1 lmsg mt2) = (inOrder mt1) ++ [lmsg] ++ (inOrder mt2)

-- Exercise 5
whatWentWrong :: [LogMessage] -> [String]
selectMsg :: LogMessage -> String

selectMsg (LogMessage _ _ msg) = msg
whatWentWrong msgs = map selectMsg
	(inOrder
	 (build
	  (filter (\msg -> (LogMessage )) msgs)))
