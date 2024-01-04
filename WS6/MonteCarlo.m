clear all; clc;

num_weeks = 1000000; % Number of weeks simulated

rain_streak = 0; % initialize rainy streaks

for i = 1:num_weeks
    p = [0.4 0.3 0.3]; % probabilities [sunny, rainy, cloudy]
    edges = [0, cumsum(p)];
    x = rand(1, 7);
    weather = discretize(x, edges); % 1=sunny 2=rainy 3=cloudy
    streak = 0; % initialize streak
    for j = 1:7 % iterate over the weekly weather

        if weather(j) == 2 % check if rainy
            streak = streak + 1; % if rainy add to counter
        else
            streak = 0; % if not rainy reset to 0
        end
        
        if streak >= 3 % if streak is at 3 we succeeded
            rain_streak = rain_streak + 1; % store results of each simulation
            streak = 0; % reset streak            
        end
    end
end

% Probability of at least three consecutive days of rain in one week
probability = rain_streak / num_weeks



