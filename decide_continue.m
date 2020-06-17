function [ again ] = decide_continue( gray )
%   ¿é¤J¡Geight_connected «İ¤À³Î°Ï¶ôªº¤À¸sÃş§Oª¬ªp
%   ¿é¥X¡Gagain ¨M©w«İ¤À³Î°Ï¶ô¬O§_¤Á³Î»P¬ö¿ı¤è¦¡
%         again=1 Ä~Äò¤Á³Î
%         again=0 °±¤î¤Á³Î¨Ã¶î¶Â¬ö¿ı
%         again=-1 °±¤î¤Á³Î¨Ã°O¿ıªÅ­È

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

