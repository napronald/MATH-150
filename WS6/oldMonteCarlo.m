clear all; clc;

num_weeks = 100000;

for i = 1:num_weeks
%     weather = randi(3, 1, 7);
%     weather = randi(3, 1, 7)
    prob = [4 3 3];
    p = normalize(prob, 'norm', 1);
    
    edges = [0, cumsum(p)];
    edges(end) = 1;
    
    x = rand(1, 7);
    
    weather = discretize(x, edges);

    streak = 0;
    for j = 1:7
        if weather(j) == 2 % If it's a rainy day
            streak = streak + 1;
        else
            streak = 0;
        end
        
        if streak >= 3
            break;
        end
    end
    
    rain_streak(i) = streak;
end

ConsecutiveRainDays = sum(rain_streak >= 3) / num_weeks;
fprintf('Probability of at least three consecutive days of rain in one week: %0.4f\n', ConsecutiveRainDays);
