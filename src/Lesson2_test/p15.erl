-module(p15).
-export([replicate/2]).

%Реализовать функцию-репликатор всех элементов списка

replicate(List, N) -> replicate(List, N, N).
replicate([_|T], N, 0) -> replicate(T, N, N);
replicate([H|T], N, Acc) -> [H | replicate([H | T], N, Acc-1 )];
replicate([], _, _) ->[].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p15_test_() -> [
    ?_assert(replicate([],1) =:= []),
    ?_assert(replicate([a],2) =:= [a,a]),
    ?_assert(replicate([a,b,c,1],2) =:= [a,a,b,b,c,c,1,1])
].
-endif.

