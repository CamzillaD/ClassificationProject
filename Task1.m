tic
Nclasses = 10;
chunkSize = 1000;
Nchuncks = num_train/chunkSize;

distances = zeros(num_test, Nchuncks);
indices = zeros(num_test, Nchuncks);

% finding the nearest neighbour for each set in the chunk
% dist(template,test) 

for i = 1:Nchuncks
    %finding the distances for this chunck
    C = trainv(1+(i-1)*1000 : i*1000,:); 
    D = dist(C,testv');
 
    for j = 1:num_test
        %finding the smallest ones 
        [d, index] = min(D(:,j));
        distances(j,i) = d;        
        %needs to be the correct index i training-set
        indices(j,i) = index + (i-1)*chunkSize;
    end
       fprintf("Chunk %d/10\n",i)
end

%finding which one is nearest with all chuncks:
finalLables = zeros(num_test,1);

for i = 1:num_test
    [d, index] = min(distances(i,:));
    finalLables(i) = trainlab(indices(i,index));
end
toc