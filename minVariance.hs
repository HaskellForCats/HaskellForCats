

minVariance prices = tv / scalar (tvu <.> tv) 
                    where   
                    rets = dropRows 1 prices / takeRows (rows prices -1) prices - 
                    (_,cov) = meanCov $ rets 
                    vu = constant 1.0 (cols cov) 
                    tvu = constant 1.0 (rows cov) 
                    tv = inv cov <> vu 
