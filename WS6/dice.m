function x = dice
% Fair dice below
die1 = rand(1,1); % Random number in [0,1]
if (die1 < 1/6)
    x(1) = 1;
elseif (die1 < 1/3)
    x(1) = 2;
elseif (die1 < 0.5)
    x(1) = 3;
elseif (die1 < 2/3)
    x(1) = 4;
elseif (die1 < 5/6)
    x(1) = 5;
else
    x(1) = 6;
end
die2 = rand(1,1);
if (die2 < 1/6)
    x(2) = 1;
elseif (die2 < 1/3)
    x(2) = 2;
elseif (die2 < 0.5)
    x(2) = 3;
elseif (die2 < 2/3)
    x(2) = 4;
elseif (die2 < 5/6)
    x(2) = 5;
else
    x(2) = 6;
end
end
    