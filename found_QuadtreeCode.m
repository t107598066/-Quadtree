function [ QuadtreeCode ] = found_QuadtreeCode( separation_tree )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% node=[節點旗標,使用次數,跳躍距離]
    string_size=size(separation_tree);
    QuadtreeCode=-1;
    
    for i=1:string_size(2)
        if separation_tree(i)==100
            try
                node=[node;i,0,1];
            catch
                node=[i,0,1];
            end
        end
    end
    
    
    node_array=size(node);
    n=1;
%         如果接收到的是空值，跳過
%         如果接收到的值是樹葉，加入QuadtreeCode
%         flag<i且node(flag)小於5的將separation_tree(node(flag))依序加入QuadtreeCode陣列
%         最接近i的node(flag)++
    for i=1:string_size(2)
        if separation_tree(i)==-1 %是空的區塊 
            for c=1:node_array(1)
                if node(c,1)<i
                    n=c;
                end
            end
            [node,separation_tree]=draw_null( node,n,separation_tree );
            continue;
        end
        if ~(10<=separation_tree(i) && separation_tree(i)<=13) || separation_tree(i)==-2 %不是樹葉(10 11 12 13)或節點已經走完四個枝葉
            continue;
        end
        for n=1:node_array(1)   %該節點是樹葉，並記錄路程
            break_next=0;
            if node(n,2)>3%該節點有沒有跟超過4個節點
                continue;
            end
            if node(n,1)+node(n,3)>=i  %找超過樹葉的節點
                QuadtreeCode=[QuadtreeCode,mod(separation_tree(i),10),-1];
                node(n,2)=node(n,2)+1;
                Cn=n;
                if node(Cn,2)>=4
                    [node,separation_tree]=end_node(node,n,separation_tree);
                end
                break;
            end
            while ~(0<=separation_tree(node(n,1)+node(n,3)) && separation_tree(node(n,1)+node(n,3))<=3)    %該節點不能走(不是0 1 2 3)
                node(n,3)=node(n,3)+1;
                if node(n,1)+node(n,3)>=i  %找超過樹葉的節點
                    QuadtreeCode=[QuadtreeCode,mod(separation_tree(i),10),-1];
                    node(n,2)=node(n,2)+1;
                    break_next=1;
                    Cn=n;
                    if node(Cn,2)>=4
                        [node,separation_tree]=end_node(node,n,separation_tree);
                    end
                    break;
                end
            end
            if break_next==1
                break;
            end
            if node(n,1)+node(n,3)>=i  %找超過樹葉的節點
                QuadtreeCode=[QuadtreeCode,mod(separation_tree(i),10),-1];
            end
            QuadtreeCode=[QuadtreeCode,separation_tree(node(n,1)+node(n,3))];
        end
    end

end

