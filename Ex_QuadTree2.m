clc;clear;
page=1;
% ============================Ū�J�Ϥ�����ܱm��===========================
file='\Iclass\grouped\';
name='2-2.bmp';
photo=imread('.\data\Iclass\�U��.jpg');  %Ū�J�Ϥ���������T K=imfinfo('test.jpg');
hsi=rgb2hsi(photo);
gray=double(hsi(:,:,3));
page = show_photo((gray),page);
photosize=size(gray);

% ============================�N���s���G�̧ǨD�X�|����======================
%     �|���𤤧� do_SeparationTree
    separation_tree=do_SeparationTree(gray);
%     �|����s�X found_QuadtreeCode
    QuadtreeCode=found_QuadtreeCode(separation_tree);
    
    Tree=draw_QuadTree(gray,QuadtreeCode);
    page = show_photo((Tree),page);









