-module(p14).
-export([duplicate/1]).

%Реализовать дубликатор всех элементов списка

duplicate([]) -> [];
duplicate([H|T]) -> [H,H | duplicate(T)].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p14_test_() -> [
    ?_assert(duplicate([]) =:= []),
    ?_assert(duplicate([a]) =:= [a,a]),
    ?_assert(duplicate([a,b,1,2]) =:= [a,a,b,b,1,1,2,2])
].
-endif.
