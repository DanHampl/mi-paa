$vals = @("30")#, "35", "40", "45", "50", "55", "60")
foreach($val in $vals)
{

    python .\main.py ./data/source/balanced/$val 5 > ./data/result/balanced/$val-pool300
}
