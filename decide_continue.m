function [ again ] = decide_continue( gray )
%   ��J�Geight_connected �ݤ��ΰ϶������s���O���p
%   ��X�Gagain �M�w�ݤ��ΰ϶��O�_���λP�����覡
%         again=1 �~�����
%         again=0 ������Ψö�¬���
%         again=-1 ������ΨðO���ŭ�

    array_range=size(gray);
    mean = 0;
    b=0;
    c=0;
   for i=1:(array_range(1))
        for j=1:(array_range(2))
            mean= mean+gray(i,j)/((array_range(1))*(array_range(2)));
        
        end
   end
   for i=1:(array_range(1))
        for j=1:(array_range(2))
           if gray(i,j)> mean
               c=c+1;
           else 
               b=b+1;
           end
        
        end
   end
   if (1/3 > (b/(b+c))) || ((c/(b+c)) > 1/3) 
       if (array_range(1)>10) && (array_range(2)>10)
           again = 1 ;
       else
           again = 0;
       end
   else
       again = 0 ;
   end
end

