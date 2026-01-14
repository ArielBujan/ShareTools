`for i in $(cat ports.txt);do nmap -p$i -n -Pn -v -T3 --open -iL hosts.txt -oA nmap$i | grep -i "Discovered open port" | cut -d " " -f 6 | sort -fu > output_nmap$i.txt; done`
