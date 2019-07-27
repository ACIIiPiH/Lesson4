-module(bs02).
-export([word/1]).

%Разделить строку на слова

word(Bin) -> word([],Bin,<<>>).

word(List, <<" ", Rest/binary>>, <<>>) -> word(List, Rest, <<>>);
word(List, <<" ", Rest/binary>>, Acc) -> word([Acc|List], Rest, <<>>);
word(List, <<C/utf8, Rest/binary>>, Acc) -> word (List, Rest, <<Acc/binary, C/utf8>>);
word(List, <<>>, Acc) -> lists:reverse ([Acc|List]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

bs02_test_() -> [
    ?_assert(word(<<>>) =:= [<<>>]),
    ?_assert(word(<<" ">>) =:= [<<>>]),
    ?_assert(word(<<" Text">>) =:= [<<"Text">>]),
    ?_assert(word(<<" Some text">>) =:= [<<"Some">> ,<<"text">>]),
    ?_assert(word(<<"Some text">>) =:= [<<"Some">>,<<"text">>])
].
-endif.
