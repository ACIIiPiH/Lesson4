-module(p03).
-export([element_at/2]).

%Найти N-ый элемент списка

element_at([],_) -> undefined;
element_at([_|_],0) -> undefined;
element_at([H|_],1) -> H;
element_at([_|T], N) -> element_at(T, N-1).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p03_test_() -> [
    ?_assert(element_at([], 1) =:= undefined),
    ?_assert(element_at([2,3,4], 0) =:= undefined),
    ?_assert(element_at([1,2,3], 4) =:= undefined),
    ?_assert(element_at([1,2,3], 3) =:= 3),
    ?_assert(element_at([1,2,[a,b],4,5,6,7], 3) =:= [a,b])
].
-endif.
