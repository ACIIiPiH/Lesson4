-module(p10).
-export([encode/1]).

%Закодировать список с использованием алгоритма RLE

encode(List) -> encode(List, 1).

encode([],_) ->[];
encode([H,H|T], Acc) -> encode([H|T], Acc+1);
encode([H|T], Acc) -> [{H,Acc}|encode(T,1)].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p10_test_() -> [
    ?_assert(encode([]) =:= []),
    ?_assert(encode([a]) =:= [{a,1}]),
    ?_assert(encode([a,a,b,c,c,c,1,1,1]) =:= [{a,2}, {b,1}, {c,3},{1,3}])
].
-endif.

