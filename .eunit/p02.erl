-module(p02).
-export([but_last/1]).

%Найти два последних элемента списка

but_last([]) -> [];
but_last([H|[]]) -> H;
but_last([H,T|[]]) -> [H,T];
but_last([_|T]) ->but_last(T).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p02_test_() -> [
    ?_assert(but_last([]) =:= []),
    ?_assert(but_last([1]) =:= 1),
    ?_assert(but_last([1, 2]) =:= [1, 2]),
    ?_assert(but_last([1, 2, 3]) =:= [2, 3]),
    ?_assert(but_last([1, 2, 3, aa]) =:= [3, aa])
].
-endif.
