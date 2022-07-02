import pandas as pd
import numpy as np

df=pd.read_csv("final2.csv")

df1=df.get(['id','reference'])

df2 = df1.to_numpy()

y = []
for i in range(629814):
    x = str(df2[i][1]).split(",")
    for j in x:
        if(j != 'nan'):
            z = [i]
            z.append(int(j))
            y.append(z)
        else:
            z = [i]
            z.append("")
            y.append(z)

y1 = np.array(y)

pd.DataFrame(y1).to_csv("references_table.csv",header=['id','reference'],index=None)