isBachelor(andrewDougherty).

hasBachelorChores(Person) :-
	isBachelor(Person).
  
task(TaskID,maintain(Person,isClean(Room)),critical) :-
     isBachelor(Person),
     occupies(Person,Room),
     nextCounter(taskCleaning,TaskID).

isClean(Room) :-
	not((on(Item,floorFn(Room)),isa(Item,Type),or([Type = dish,Type = sock,Type = trash]))),
	not((in(Item,Room),isa(Item,Type),or([Type = openedFood]))).

monthlyChore(airDustElectronics(Room)) :-
	occupies(_,Room),
	in(Room,Item),
	isa(Item,electronics).

weeklyChores([runUpdateFrdcsaGit,cleanRoom,takeCareOfCar]).
subChores(cleanRoom,[getRidOfAllPopCans,takeOutTrash,takeUpAllDishes,cleanAreaBehindServerRack,sprayAndDust,shredAllUnnecessaryDocuments,putMoviesAway,cleanOffDesk,arrangeAllLooseItems]).
subChores(takeCareOfCar,[checkOilInCar,fillUpGasTank,emptyTrashOutOfBackSeatAndTrunk]).

weekdayChores([goToGym]).
monthlyChores([haveCarWashed]).

%% schedule this for when (change of CDT to CST and back)
miscChores([replaceSmokeCarbonMonoxidePoisonousGasAlarmBatteries]).

%% (enter chore chart into AI, make html table for it)

habitualTasks(constantly,[
			  taskFn(caretaker,'supply fresh water')
			 ]).
habitualTasks(asDirected,[
			  taskFn(patient,'take all meds')
			 ]).
habitualTasks(after,[
		     after(toileting,taskFn(patient,'wash hands'))
		    ]).
habitualTasks(threeTimesADay,[
			      taskFn(caretaker,'provide a varied meal')
			     ]).
habitualTasks(twiceADay,[
			 taskFn(caretaker,'make bed'),
			 taskFn(patient,'brush teeth'),
			 taskFn(patient,'douse with mouthwash')
			]).
habitualTasks(daily,[
		     taskFn(caretaker,'check calendar every day'),
		     taskFn(caretaker,'laundry'),
		     taskFn(caretaker,'wash the dishes'),
		     taskFn(patient,'take meds'),
		     taskFn(caretaker,'check online shipping info'),

		     implies(isChristian(caretaker),taskFn(caretaker,'study the bible')),
		    ]).
habitualTasks(everyOtherDay,[
			     taskFn(caretaker,'clean pants')
			    ]).
habitualTasks(biweekly,[
			taskFn(caretaker,'vacuum the floors'),
			taskFn(caretaker,'periodically scan medical folder chart, to keep it up to date.'),
			taskFn(caretaker,'shower'),

			implies(owns(Person,plants),taskFn(caretaker,'water plants'))
			]).
habitualTasks(weekly,[
		      taskFn(caretaker,'keep individual rooms stocked w/ food in case of emergency'),
		      taskFn(caretaker,'bath'),

		      implies(isChristian(caretaker,taskFn(caretaker,'schedule mass')))
		     ]).
habitualTasks(monthly,[
		       taskFn(caretaker,'prepare notes for family meeting')
		      ]).

fixme('have it load all chore charts in /var/lib/myfrdcsa/codebases/minor/free-life-planner/data-git/systems/chore_charts/').

:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/free-life-planner/data-git/systems/chore_charts/chore_chart_andrew.pl').

%% so for the chore chart, what you can do is the chore can increment
%% something, or satisfy something.  there can be temporal constraints
%% about when the chore should be completed.  etc.  When it is
%% permissible, when it is obligatory, etc.

%% FIXME immediately

%% If something is a weekly chore, and it isn't done for any period
%% longer than exactly two weeks, then you know that it couldn't have
%% been done on a weekly basis, under any circumstances. whereas, any
%% less, and it could be it was done near the very beginning of the
%% first week, and then again at the very end of the second week.
%% Same for days.  This provides a handy test to ensure things that
%% are daily are done on a daily basis, regardless of what exactly
%% daily means in that case, as it differs per case.

%% isResponsibleFor().  %% think in terms of like providing meals,
%% recording meals, etc.
