clc;clear;
page=1;
% ============================讀入圖片並顯示彩圖===========================
file='\Iclass\grouped\';
name='2-2.bmp';
photo=imread('.\data\Iclass\下載.jpg');  %讀入圖片的相關資訊 K=imfinfo('test.jpg');
hsi=rgb2hsi(photo);
gray=double(hsi(:,:,3));
page = show_photo((gray),page);
photosize=size(gray);

% ============================將分群結果依序求出四分數======================
%     四分樹中序 do_SeparationTree
    separation_tree=do_SeparationTree(gray);
%     四分樹編碼 found_QuadtreeCode
    QuadtreeCode=found_QuadtreeCode(separation_tree);
    
    Tree=draw_QuadTree(gray,QuadtreeCode);
    page = show_photo((Tree),page);









