%% GAMULTIOBJ with integer constraints
% constraints

%% Problem setup
fitnessFunction = @myfitness;  % Function handle to the fitness function
numberOfVariables = 4;   % Number of decision variables
populationSize = 50;
stallGenLimit = 200;
generations = 500;

% Bound Constraints
lb = [1 , 1 , 1 , 1 ];       % Lower bound
ub = [3 , 6 , 3 , 6 ];       % Upper bound
Bound = [lb; ub];


%% Solve the problem with integer constraints
%Add one of the following lines to each of the custom functions:
%IntCon = [];       - no integer constraints
%IntCon = 1;        - x(1) of the solution will be integer
%IntCon = 2;        - x(2) of the solution will be integer
%IntCon = [1, 2];   - both cordinates of the solution will be integer

options = gaoptimset('PopulationSize',populationSize,...
    'CreationFcn', @int_pop,...
    'MutationFcn', @int_mutation,...
    'CrossoverFcn',@int_crossoverarithmetic,...
    'StallGenLimit', stallGenLimit,...
    'Generations', generations,...
    'PopulationSize',populationSize,...
    'PopInitRange', Bound);

[x1, f1, exitflag1, output1, population1, score1] = gamultiobj(fitnessFunction,...
     numberOfVariables, [], [], [], [], lb, ub, options);
 
%% Plot the results

% plot the Pareto front
% constraints
fh1 = figure;

load cost.txt;
load env_imp.txt;
sz = 10;
c = [1,0,0];
for q= 1:1:3
    for w=1:1:6
        for e= 1:1:3
            for r = 1:1:6
    t(1)=(cost(q,1)  + cost(w,2)   + cost(e,3)    + cost(r,4));
    t(2)=(env_imp(q,1)  + env_imp(w,2)   + env_imp(e,3)    + env_imp(r,4));
    scatter(t(1), t(2),sz,c,'fill');
    hold all;
            end
        end
    end
end
    
scatter(f1(:, 1), f1(:, 2),10,'blue', 'fill');
xlabel('Economic factor');
ylabel('Environmental factor');
xlim([1.5, 5]);
ylim([1, 5]);
legend({'All possible solutions'});
title('Pareto front');
