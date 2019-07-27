-module(p05).
-export([reverse/1]).

%Перевернуть список

%Первый вариант, неэфективный, из-за применения оператора ++

%reverse([H|[]]) -> [H];
%reverse([H|T])->reverse(T)++[H].

%Оптимальный вариант исполнения

reverse(List) -> reverse(List, []).
reverse ([], Rev_list) -> Rev_list;
reverse([H|T], Rev_list) ->reverse(T, [H|Rev_list]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p05_test_() -> [
    ?_assert(reverse([]) =:= []),
    ?_assert(reverse([1]) =:= [1]),
    ?_assert(reverse([1,2,3,4,5]) =:= [5,4,3,2,1])
].
-endif.


