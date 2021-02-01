function y = myfitness1(x)
load cost.txt;
load env_imp.txt;
y(1)=(cost(x(1),1)  + cost(x(2),2)   + cost(x(3),3)    + cost(x(4),4));
y(2)=(env_imp(x(1),1)  + env_imp(x(2),2)   + env_imp(x(3),3)    + env_imp(x(4),4));
end