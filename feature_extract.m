%Function which returns the feature vectors for the training images and the
%labels of the corresponding training images

function [im,labels] = feature_extract(trainimgslocation)

%'im' is the resulting matrix of size 14000X769

im = zeros(14000,769);
for i = 1:14
    % dwtmat consists the feature vector obtained by the DWT process which is of size 1X19 
    dwtmat = zeros(1,19);
    % svdmat consists the feature vector obtained by the SVD process as described resulting a vector of size 1X750 
    svdmat = zeros(1,750);
    
    fprintf(strcat('image ',' ',num2str(i)));
    
    %Reading the training images from the file location
    
    temp = imread(strcat(trainimgslocation,num2str(i),'.bmp'));
    
    %Converting the image into grayscale if the image returned is color
    if size(temp, 3) > 1
        temp = rgb2gray(temp);
    end
    
     
    %trimming the background this is done by deleting the unessesary columns and rows

    j=0;
    removeclm = [];
    for k = 1:size(temp,2)

        total = sum(temp(:,k));
        if total == (255*size(temp,1))
            j=j+1;
            removeclm(j) = k;
        end

    end
    j=0;
    
    removerow = [];
    for k = 1:size(temp,1)

        total = sum(temp(k,:));
        if total == (255*size(temp,2))
            j=j+1;
            removerow(j) = k;
        end

    end
    %deleting the unessesary rows and columns
    temp(removerow,:)=[];
    temp(:,removeclm)=[];
    
    % Resizing each image to a fixed size 750X750
    temp = imresize(temp,[750 750]);
    
    
    %preparing input for method SVD    
    temp2 = double(temp);
    
    l =1;
    %DWT process which uses the default MATLAB function dwt2() 
    %each fingerprint undergoes six levels of decomposition
    
    %resulting vector of size 1X19 is stored in dwtmat
    for j = 1:6
        
        [ca,ch,cv,cd] = dwt2(temp,'db1');
        
        if l == 1
            dwtmat(l) = sum(ca(:));
            l = l+1;
        end
        dwtmat(l) = sum(ch(:));
        l = l+1;
        dwtmat(l) = sum(cv(:));
        l = l+1;
        dwtmat(l) = sum(cd(:));
        l = l+1;
        
        temp = ca;
    end
    
    %SVD process which uses the default MATLAB function svd()  
    %to obtain matrices U, S, V
    [u,s,v] = svd(temp2);
    
    %All values of ‘S’ are summed column wise to get single vector of size 1X750 for an input image of size 750X750
    for k = 1:750
        svdmat(k) = sum(s(:,k));
    end
    %Combining feature vectors obtained from SVD and DWT 
    
    im(i,:) = horzcat(dwtmat,svdmat);
    
end

%obtaining labels from .csv file
labels = csvread(strcat(trainimgslocation,'train.csv'));
labels = labels(:,2);


end
    
    
    
    
    
    
    
    
    
        
        
        
        
        
        