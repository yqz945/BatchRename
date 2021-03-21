import sys
import pandas as pd

df = pd.read_csv(r'/mnt/c/Users/15871/tmp/tb.csv',names=['tname','tid'])
str = 'tname=="'+sys.argv[1]+'"'
#str = 'tname=="'+"方丹"+'"'
try:
    df.query(str, inplace=True)
    #astr = df_found['tname']+'-'+df_found['tid']
    #print('teacher name:'+df_found['tname'])
    #print('tid:'+df_found['tid'])
    fs = df.tname+'-'+df.tid
    #print(filename)
    print(fs.array[0])
except Exception:
    print("error")
    
    
