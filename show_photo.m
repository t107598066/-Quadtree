function page=show_photo(photo,page)
% 輸入 page 下一張的圖片編號
% 輸出 photo 要輸出的圖片
   % page 當前要輸出的圖片編號
   
    figure(page);   %給定輸出圖的編號
    imshow(photo);  %顯示圖片
    page=page+1;    %設定下一張圖片編號
end