-module(p13).
-export([decode/1]).

%Реализовать декодер для стандартного алгоритма RLE

decode([]) -> [];
decode([{0,_}|T]) -> decode(T);
decode([{Acc, H}|T]) -> [H|decode([{Acc-1, H}|T])].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p13_test_() -> [
    ?_assert(decode([]) =:= []),
    ?_assert(decode([{1,a}]) =:= [a]),
    ?_assert(decode([{1,a},{2,b},{3,c}]) =:= [a,b,b,c,c,c])
].
-endif.


