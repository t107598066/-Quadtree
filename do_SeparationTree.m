function [ separation_tree ] = do_SeparationTree( photo )
%   輸入  photo  待分割的圖形
%   輸出  separation_tree  存放四分數的編碼(如功能)
%         relate  
%   功能：
%       100 進入下一層
%       0~3 可繼續分割
%       10~13 不可分割必須塗黑

    array_range=size(photo);
    separation_tree=100;
%     左上角第0區塊
    for i=1:floor(array_range(1)/2)
        for j=1:floor(array_range(2)/2)
            reg(i,j)=photo(i,j);
        end
    end
    try
        dec=decide_continue(reg);
        if (dec==1)
            separation_tree=[separation_tree,0,do_SeparationTree( reg )];
        elseif (dec==0)
            separation_tree=[separation_tree,10];
        else
            separation_tree=[separation_tree,-1];
        end
    catch
        separation_tree=[separation_tree,10];
    end
    
%     右上角第1區塊
    ni=1; nj=1;
    for i=1:floor(array_range(1)/2)
        for j=floor(array_range(2)/2)+1:array_range(2)
            reg(ni,nj)=photo(i,j);
            nj=nj+1;
        end
        ni=ni+1; nj=1;
    end
    try
        dec=decide_continue(reg);
        if (dec==1)
            separation_tree=[separation_tree,1,do_SeparationTree( reg )];
        elseif (dec==0)
            separation_tree=[separation_tree,11];
        else
            separation_tree=[separation_tree,-1];
        end
    catch
        separation_tree=[separation_tree,11];
    end
        
    %     左下角第2區塊
    ni=1; nj=1;
    for i=floor(array_range(1)/2)+1:array_range(1)
        for j=1:floor(array_range(2)/2)
            reg(ni,nj)=photo(i,j);
            nj=nj+1;
        end
        ni=ni+1; nj=1;
    end
    try
        dec=decide_continue(reg);
        if (dec==1)
            separation_tree=[separation_tree,2,do_SeparationTree( reg )];
        elseif (dec==0)
            separation_tree=[separation_tree,12];
        else
            separation_tree=[separation_tree,-1];
        end
    catch
        separation_tree=[separation_tree,12];
    end
        
    
%     右下角第3區塊
    ni=1; nj=1;
    for i=floor(array_range(1)/2)+1:array_range(1)
        for j=floor(array_range(2)/2)+1:array_range(2)
            reg(ni,nj)=photo(i,j);
            nj=nj+1;
        end
        ni=ni+1; nj=1;
    end
    try
        dec=decide_continue(reg);
        if (dec==1)
            separation_tree=[separation_tree,3,do_SeparationTree( reg )];
        elseif (dec==0)
            separation_tree=[separation_tree,13];
        else
            separation_tree=[separation_tree,-1];
        end
    catch
        separation_tree=[separation_tree,13];
    end
        
end

