for($i = 4; $i -lt 20; $i++)
{
    python .\main.py .\NK\NK4_inst.dat .\NK\NK4_sol.dat $i > .\data\raw\N4.$i.txt
    python .\main.py .\NK\NK10_inst.dat .\NK\NK10_sol.dat $i > .\data\raw\N10.$i.txt
    python .\main.py .\NK\NK15_inst.dat .\NK\NK15_sol.dat $i > .\data\raw\N15.$i.txt
    python .\main.py .\NK\NK20_inst.dat .\NK\NK20_sol.dat $i > .\data\raw\N20.$i.txt
    python .\main.py .\NK\NK22_inst.dat .\NK\NK22_sol.dat $i > .\data\raw\N22.$i.txt
    python .\main.py .\NK\NK25_inst.dat .\NK\NK25_sol.dat $i > .\data\raw\N25.$i.txt
    # python .\main.py .\NK\NK27_inst.dat .\NK\NK27_sol.dat $i > .\data\raw\N27_$i.txt
    # python .\main.py .\NK\NK30_inst.dat .\NK\NK30_sol.dat $i > .\data\raw\N30_$i.txt
}
