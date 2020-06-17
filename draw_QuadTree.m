function [ Tree ] = draw_QuadTree(bin_photo,separation_tree)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    array_size=size(bin_photo);
    treecode_size=size(separation_tree);
    Tree(array_size(1),array_size(2))=255;
    
    for i=1:array_size(1)
        for j=1:array_size(2)
            Tree(i,j)=bin_photo(i,j);
        end
    end
    
    for i=1:treecode_size(2)
        if separation_tree(i)==-1
            try
                for ci=hx:tx
                    for cj=hy:ty
                        if ci==hx || ci==tx || cj==hy || cj==ty
%                             µe½u
                            Tree(ci,cj)=0;
                            reg(ci,cj)=bin_photo(ci,cj);
                        end
                    end
                end
                hx=1;   hy=1;
                tx=array_size(1);   ty=array_size(2);
            catch
                hx=1;   hy=1;
                tx=array_size(1);   ty=array_size(2);
            end
        elseif separation_tree(i)==0
            tx=floor((hx+tx)/2);
            ty=floor((hy+ty)/2);            
        elseif separation_tree(i)==1
            tx=floor((hx+tx)/2);
            hy=floor((hy+ty)/2); 
        elseif separation_tree(i)==2
            hx=floor((hx+tx)/2);
            ty=floor((hy+ty)/2); 
        else
            hx=floor((hx+tx)/2);
            hy=floor((hy+ty)/2); 
        end
    end
end

