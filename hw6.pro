% Brayden Berglund
% HW6
%not implemented is iterating through and starting at different positions, not fully tested
%:- use_module(library(lists)). for reverse and select
%:- use_module(library(apply)). for maplist


solve:- solve().

% move list move(from, over, to)
move(from,2,to):- member([from,to], [[1,4], [4,1]]).
move(from,3,to):- member([from,to], [[1,6], [6,1]]).
move(from,4,to):- member([from,to], [[2,7], [7,2]]).
move(from,5,to):- member([from,to], [[2,9], [9,2]]).
move(from,5,to):- member([from,to], [[3,8], [8,3]]).
move(from,6,to):- member([from,to], [[3,10], [10,3]]).
move(from,5,to):- member([from,to], [[4,6], [6,4]]).
move(from,7,to):- member([from,to], [[4,11], [11,4]]).
move(from,8,to):- member([from,to], [[4,13], [13,4]]).
move(from,8,to):- member([from,to], [[5,12], [12,5]]).
move(from,8,to):- member([from,to], [[9,7], [7,9]]).
move(from,9,to):- member([from,to], [[10,8], [8,10]]).
move(from,9,to):- member([from,to], [[5,14], [14,5]]).
move(from,9,to):- member([from,to], [[6,13], [13,6]]).
move(from,10,to):- member([from,to], [[6,15], [15,6]]).
move(from,12,to):- member([from,to], [[11,13], [13,11]]).
move(from,13,to):- member([from,to], [[12,14], [14,12]]).
move(from,14,to):- member([from,to], [[15,13], [13,15]]).


% solve 
%start with position 1
solve() :-
	start([2,3,4,5,6,7,8,9,10,11,12,13,14,15], [1], [])


%will find the available moves
start(used, open, list) :-
	%go through possible moves
	select(from, used, used2),
	select(over, used2, used3),
	select(to, open, open2),
	%use moves list
	move(from, over, to),
	%create a list to use for printing
	numlist(1,15,printlist),
	%use maplist to fill printlist
	maplist(from^li^(member(from,open)) -> li = 0; li = X, printlist,[li1,li2,li3,li4,li5,li6,li7,li8,li9,li10,li11,li12,li13,li14,li15]),
	%print list
	format('    ~w        ~n',[li1]),
	format('   ~w ~w      ~n',[li2,li3]),
	format('  ~w ~w ~w    ~n',[li4,li5,li6]),
	format(' ~w ~w ~w ~w  ~n',[li7,li8,li9,li10]),
	format('~w ~w ~w ~w ~w~n',[li11,li12,li13,li14,li15]),
	start([to | used3], [from, over | open2], [move(from,over,to) | list]).
