-module(p04).
-export([len/1]).

%Посчитать количество элементов списка

len([])-> 0;
len([_H|T]) -> 1+len(T).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p04_test_() -> [
    ?_assert(len([]) =:= 0),
    ?_assert(len([a]) =:= 1),
    ?_assert(len([1,2,3,4,5]) =:= 5)
].
-endif.
