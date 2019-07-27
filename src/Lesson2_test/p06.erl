-module(p06).
-export([is_palindrome/1]).

%Определить, является ли список палиндромом. Читается в обе стороны (А роза упала на лапу aзора)

is_palindrome([]) -> [];
is_palindrome(List) -> List =:= lists:reverse(List).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

p06_test_() -> [
    ?_assert(is_palindrome([]) =:= []),
    ?_assert(is_palindrome([1,2,3,2,1]) =:= true),
    ?_assert(is_palindrome([l,e,v,e,l]) =:= true),
    ?_assert(is_palindrome([1,2,3,4]) =:= false)
].
-endif.
