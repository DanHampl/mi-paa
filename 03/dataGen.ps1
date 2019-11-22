$vals = @("22","25","27","30") #@("4","10","15","20")

foreach($val in $vals)
{

    python .\main.py ./data/source/balanced/$val 5 > ./data/result/balanced/$val
    python .\main.py ./data/source/light/$val 5 > ./data/result/light/$val
    python .\main.py ./data/source/heavy/$val 5 > ./data/result/heavy/$val

    python .\main.py ./data/source/correlationWeak/$val 5 > ./data/result/correlationWeak/$val
    python .\main.py ./data/source/correlationStrong/$val 5 > ./data/result/correlationStrong/$val

    python .\main.py ./data/source/bigKnapsack/$val 5 > ./data/result/bigKnapsack/$val
    python .\main.py ./data/source/smallKnapsack/$val 5 > ./data/result/smallKnapsack/$val

    python .\main.py ./data/source/smallItems/$val 5 > ./data/result/smallItems/$val
    python .\main.py ./data/source/smallItemsSmallKnapsack/$val 5 > ./data/result/smallItemsSmallKnapsack/$val
}
