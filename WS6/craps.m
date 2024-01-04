function y = craps(N)
% First roll is x, subsequent rolls q
for i = 1:N
    x = dice;
    totx = sum(x);
    if (or((totx==7),(totx==11)))
        w(i) = 1;
    elseif (or((totx==12),(or((totx==2),(totx==3)))))
        w(i) = -1;
    else
    test = 1;
      while (test == 1)
        q = dice;
        totq = sum(q);
        if (totq == totx)
            w(i) = 1;
            test = 0;
        elseif (totq == 7)
            w(i) = -1;
            test = 0;
        end
     end
   end
end
y = w;