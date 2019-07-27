-module(p07).
-export([flatten/1]).

%Выровнять структуру с вложенными списками

flatten([[H|T]|T2]) -> flatten([H,T|T2]);
flatten([[]|T]) -> flatten(T);
flatten([H|T]) -> [H|flatten(T)];
flatten([]) -> [].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p07_test_() -> [
    ?_assert(flatten([]) =:= []),
    ?_assert(flatten([1,[2,3],4,[[],5]]) =:= [1,2,3,4,5]),
    ?_assert(flatten([[],1,[2,[3,4]],5]) =:= [1,2,3,4,5])
].
-endif.





