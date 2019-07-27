-module (bs01).
-export ([first_word/1]).

%Извлечь из строки первое слово

first_word (BinText) -> first_word(BinText, <<>>).

first_word (<<" ", _/binary>>, Acc) -> Acc;
first_word (<<C/utf8, Rest/binary>>, Acc) -> first_word (Rest, <<Acc/binary, C/utf8>>);
first_word(<<>>, Acc) -> Acc.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

bs01_test_() -> [
    ?_assert(first_word(<<>>) =:= <<>>),
    ?_assert(first_word(<<" ">>) =:= <<>>),
    ?_assert(first_word(<<"Some text">>) =:= <<"Some">>)
].
-endif.

