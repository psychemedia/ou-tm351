from ipythonblocks import BlockGrid
import pandas as pd

def pBlockGrid(df):
    (y,x)=df.shape
    return BlockGrid(x,y)

def pBlockGrid2(df,fill=(123, 234, 123),*args,**kwargs):
    (y,x)=df.shape
    b=BlockGrid(x,y,fill=fill,**kwargs)
    return b
    
def pBlockGrid3(df,fill=(123, 234, 123),blocksize=10,*args,**kwargs):
    b=pBlockGrid2(df,fill=fill)
    type_colours={'int64':(255, 0, 0),'float64':(0, 0, 255),'object':(128,128,0),'int32':(64, 0, 128)}
    for i,j in enumerate(df.dtypes):
        b[:, i] = type_colours[j.name]
    b.block_size = blocksize
    return b
    
def pBlock_colourNA(df,b,color_NA=(0,0,0),*args,**kwargs):
    (y,x)=df.shape
    for i in range(x):
        for j in range(y):
            if pd.isnull(df.iloc[j,i]):
                b[j,i]=color_NA
    return b

def pBlockGrid4(df,fill=(123, 234, 123),*args,**kwargs):
    b=pBlockGrid3(df,fill=fill)
    b=pBlock_colourNA(df,b,*args,**kwargs)
    return b
    
def pBlockGrid5(df1,df2,join='outer',fill=(123, 234, 123),*args,**kwargs):
    df=pd.concat([df1,df2],join=join)
    b=pBlockGrid2(df,fill=fill)
    for block in b:
        if block.row < len(df1): block.set_colors(255,0,0)
        else: block.set_colors(0,0,255)
    b=pBlock_colourNA(df,b,*args,**kwargs)
    return (df,b)
    
def pBlockGrid6(df1,df2,fill=(123, 234, 123),*args,**kwargs):
    df=pd.merge(df1,df2,**kwargs)
    b=pBlockGrid2(df,fill=fill)
    for block in b:
        label=df.columns.tolist()[block.col]
        if 'on' in kwargs and label in kwargs['on']: block.set_colors(0,255,0)
        #This following bit assumes that the left N cols in the merged table are from the left table
        elif block.col < len(df1.columns): block.set_colors(255,0,0)
        else: block.set_colors(0,0,255)
    b=pBlock_colourNA(df,b)
    return (df,b)
