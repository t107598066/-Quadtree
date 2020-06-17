function [ node,separation_tree ] = end_node( node,n,separation_tree )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
	Cn=n;
    if Cn>1
        separation_tree(node(Cn,1)-1)=-2;
    end
	while node(Cn,2)>=4
        Cn=n;
        while node(Cn,2)>3
            Cn=Cn-1;
            if Cn==0
                break;
            end
        end
        if Cn==0
            break;
        end
        node(Cn,2)=node(Cn,2)+1;
        node(Cn,3)=node(Cn,3)+1; 
        if node(Cn,2)<4
            break;
        end
        if Cn>1
            separation_tree(node(Cn,1)-1)=-2;
        end
        n=n-1;
	end


end

