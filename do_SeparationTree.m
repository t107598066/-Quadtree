function [ separation_tree ] = do_SeparationTree( photo )
%   ��J  photo  �ݤ��Ϊ��ϧ�
%   ��X  separation_tree  �s��|���ƪ��s�X(�p�\��)
%         relate  
%   �\��G
%       100 �i�J�U�@�h
%       0~3 �i�~�����
%       10~13 ���i���Υ������

    array_range=size(photo);
    separation_tree=100;
%     ���W����0�϶�
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
    
%     �k�W����1�϶�
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
        
    %     ���U����2�϶�
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
        
    
%     �k�U����3�϶�
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

