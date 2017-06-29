%% LOOSELY TRANSCRIBED FROM: Teaching Robots to Play Why Science Loves
%% Gaming [EGX 2015].mp4

%% use this as input to the planner for overall structure to plans in
%% order to make them more paletteable to people.  In addition to the
%% plan having this structure, it may be necessary to illustrate this
%% to the user somehow.



%% Frameworks for reward through structured activity - define loops of behavior that if completed and repeated successfully will reward the player through a number of means.

hasLoop(RewardFramework,BehaviorLoop).

rewardPlayerThroughMeans(ListOfMeans) :-
	successfullyRepeated(BehaviorLoops).

successfullyRepeated([]) :-
	true.
successfullyRepeated([Loop|RemainingBehaviorLoops]) :-
	completed(Loop),
	successfullyRepeated(RemainingBehaviorLoops).

%% Some rewards are mild/cosmetic, others allow a sense of progression.

possible(hasRewardType(Reward,cosmetic)) :-
	isa(Reward,reward).
possible(hasRewardType(Reward,progressive)) :-
	isa(Reward,reward).

hasReward(Interaction,Reward).

%% Interactions continue to increase in scale to help maintain players interests and momentum until in the long-term an explicit reward is achieved.

getSortedInteractionsAndScales(SortedInteractionsAndScales) :-
	findall(Interaction,isa(Interaction,interaction),Interactions),
	sortInteractions(Interactions,SortedInteractions),
	findall([Interaction,Scale],(member(Interaction,SortedInteractions),hasScale(Interaction,Scale)),SortedInteractionsAndScales).

maintains(and(hasInterestIn(Player,game),hasMomementumWith(Player,Game))) :- 
	forall((member([Interaction,Scale],SortedInteractionsAndScales),getPreviousInteraction(Interaction,PreviousInteraction),hasScale(PreviousInteraction,PreviousScale)),greaterThan(Scale,PreviousScale)).

possible(achieve(Player,longTermExplicitReward)) :-
	forall(member([Interaction,Scale],SortedInteractionsAndScales),hasCompleted(Player,Interaction)).

helps(maintains(and(hasInterestIn(Player,game),hasMomementumWith(Player,Game)),and(until(maintain(and(hasInterestIn(Player,game),hasMomementumWith(Player,Game))),achieve(Player,longTermExplicitReward)),achieve(Player,longTermExplicitReward)))).

%% Super Mario Brothers is a fine example of reward frameworks being used to drive and maintain player interests.

%% Reward interactions and the required behavior to release them are often referred to as compulsion loops, whereby we maitain a players interest by ensuring a reward within an abstract and relative timeframe.

maintain(hasInterestIn(Player,game)) :-
	hasReward(Interaction,Reward),
	occursWithinAbstractAndRelativeTimeframe(Reward).

%% FIXME: possibly more than one interaction per loop:
%% are(CompulsionLoops,compulsionLoop) :-
%% 	findall(requiresBehaviorToBeReleased(rewardInteraction(Interaction,Reward),Behavior),(requiresBehaviorToBeReleased(rewardInteraction(Interaction,Reward),Behavior)),CompulsionLoops).

%% Short term loops are often the result of simple interactions that may be largely cosmetic, but help maintain a players engagement.

%% %% FIXME: way off:
%% often(CompulsionLoop,cosmetic) :- 
%% 	isa(CompulsionLoop,shortTermLoop).

possible(isa(CompulsionLoop,shortTermLoop)) :-
	isa(CompulsionLoop,compulsionLoop).
possible(isa(CompulsionLoop,mediumTermLoop)) :-
	isa(CompulsionLoop,compulsionLoop).
possible(isa(CompulsionLoop,longTermLoop)) :-
	isa(CompulsionLoop,compulsionLoop).

%% The interaction response from the collection of coins may seem simple, but the use of counters and sound effects provide positive reinforcement to users that their actions not only make sense but also work towards their long terms goals.
%% This subseq scales to medium term compulsion loops in levels, given every level of mario games Celebrate the fact that they completed.

%% Returning back to Coin collection,- continued adoption of the short-term loop rewards you with extra lives - this medium term loop is now reinforcing a players continued adoption of the short-term loop and gives not only context but a but a real quantifiable reason to continue doing it.
%% This scales farther into long terml oops of activity as levels are grouped into worlds with the requirement to defeat a boss enemy with closure achievd through the final bowser in the eitht and final world.

%% Ultimatealy the point here is we have this confined system in which intelligence decisions can be made, we can quantify their value as well as identify their position within the road map of future actions you can take in order to win that game.
%% Conversely good games are able to quiclkly point out bad interactions you are making and thus reinforce to you that doing certain things is bad.

%% (Sonic arguably does this better, with exaggerated behavior when rings are lost, for that medium term loop but also when losing lives.)

%% The next major factor that bills a game as a valid scientific problem is that it has to be fun.
%% While fun is a subjective notion, there's evidence to suggest that the level of challenge the problem poses must meet a certain threshold in order for it to be interesting in the eyes of humans.
%% This reduces basicallyto NP-hard problems, which require some intelligent algorithmic process in order for them to be solved in a reasonable amount of time.
%% Various games present a wide range of problems that are not only sufficiently difficult, but carry a range of equally interesting decision problems in their own rights.
%% Despite this assertion of a certain level of computationally defined difficulty.

%% ...

%% Contrary to popular opinion, AI is not some black box that will work in any and all circumstances.  AI systems are typically specialist.   

%% %% Andrew - [This is exactly what we need, the black box that works in any and all circumstances]