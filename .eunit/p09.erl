-module(p09).
-export([pack/1]).

%Запаковать последовательно следующие дубликаты во вложенные списки

pack(List) -> pack(List,[]).
pack([],_) -> [];
pack([H,H | T],L) -> pack([H|T], [H|L]);
pack([H | T],L) -> [[H | L] | pack(T,[])].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p09_test_() -> [
    ?_assert(pack([]) =:= []),
    ?_assert(pack([a]) =:= [[a]]),
    ?_assert(pack([a,b,b]) =:= [[a],[b,b]]),
    ?_assert(pack([a,a,b,c,c,c,e,e]) =:= [[a,a],[b],[c,c,c],[e,e]])
].
-endif.
