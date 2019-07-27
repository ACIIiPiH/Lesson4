-module(p12).
-export([decode_mod/1]).

%Реализовать декодер для модифицированного алгоритма RLE

decode_mod(List) -> decode_mod(List, 1).
decode_mod([],_) -> [];
decode_mod([{Acc,H}|T], 1) -> decode_mod([H|T], Acc);
decode_mod([H|T], 1) ->[H|decode_mod(T,1)];
decode_mod([H|T], Acc) -> [H|decode_mod([H|T], Acc-1)].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p12_test_() -> [
    ?_assert(decode_mod([]) =:= []),
    ?_assert(decode_mod([a]) =:= [a]),
    ?_assert(decode_mod([{2,b}]) =:= [b,b]),
    ?_assert(decode_mod([{3,a},b,{2,c}]) =:= [a,a,a,b,c,c])
].
-endif.

