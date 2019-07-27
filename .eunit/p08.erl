-module(p08).
-export([compress/1]).

%Удалить последовательно следующие дубликаты

compress([]) -> [];
compress([H | []]) -> [H];
compress([H,H | T]) -> compress([H |T]);
compress([H | T]) -> [H | compress(T)].

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p08_test_() -> [
    ?_assert(compress([]) =:= []),
    ?_assert(compress([a]) =:= [a]),
    ?_assert(compress([a,a,b,b,b,c]) =:= [a,b,c])
    ].
-endif.

