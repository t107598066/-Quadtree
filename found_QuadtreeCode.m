function [ QuadtreeCode ] = found_QuadtreeCode( separation_tree )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% node=[�`�I�X��,�ϥΦ���,���D�Z��]
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
%         �p�G�����쪺�O�ŭȡA���L
%         �p�G�����쪺�ȬO�𸭡A�[�JQuadtreeCode
%         flag<i�Bnode(flag)�p��5���Nseparation_tree(node(flag))�̧ǥ[�JQuadtreeCode�}�C
%         �̱���i��node(flag)++
    for i=1:string_size(2)
        if separation_tree(i)==-1 %�O�Ū��϶� 
            for c=1:node_array(1)
                if node(c,1)<i
                    n=c;
                end
            end
            [node,separation_tree]=draw_null( node,n,separation_tree );
            continue;
        end
        if ~(10<=separation_tree(i) && separation_tree(i)<=13) || separation_tree(i)==-2 %���O��(10 11 12 13)�θ`�I�w�g�����|�ӪK��
            continue;
        end
        for n=1:node_array(1)   %�Ӹ`�I�O�𸭡A�ðO�����{
            break_next=0;
            if node(n,2)>3%�Ӹ`�I���S����W�L4�Ӹ`�I
                continue;
            end
            if node(n,1)+node(n,3)>=i  %��W�L�𸭪��`�I
                QuadtreeCode=[QuadtreeCode,mod(separation_tree(i),10),-1];
                node(n,2)=node(n,2)+1;
                Cn=n;
                if node(Cn,2)>=4
                    [node,separation_tree]=end_node(node,n,separation_tree);
                end
                break;
            end
            while ~(0<=separation_tree(node(n,1)+node(n,3)) && separation_tree(node(n,1)+node(n,3))<=3)    %�Ӹ`�I���ਫ(���O0 1 2 3)
                node(n,3)=node(n,3)+1;
                if node(n,1)+node(n,3)>=i  %��W�L�𸭪��`�I
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
            if node(n,1)+node(n,3)>=i  %��W�L�𸭪��`�I
                QuadtreeCode=[QuadtreeCode,mod(separation_tree(i),10),-1];
            end
            QuadtreeCode=[QuadtreeCode,separation_tree(node(n,1)+node(n,3))];
        end
    end

end

