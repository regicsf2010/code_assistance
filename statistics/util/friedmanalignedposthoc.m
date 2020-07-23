function [p, z] = friedmanalignedposthoc(avgs, n, k)

    z = zeros(k);
    den = sqrt((k * n + k) / 6);
    
    for i = 1 : k
       z(i, :) = (avgs(i) - avgs) ./ den;
    end
    
    p = 2 * normcdf(-abs(z), 0, 1);
end