function [finalLabels] = NN(trainingSet,trainingLabels,testSet, Nchunks, chunkSize)

distances = zeros(10000, Nchunks);
indices = zeros(10000, Nchunks);

for i = 1:Nchunks
    C = trainingSet((i-1)*chunkSize+1:i*chunkSize,:);  
    D = dist(C,testSet');  
    for j = 1:size(testSet)
        %finding the smallest ones 
        [d, index] = min(D(:,j));
        distances(j,i) = d;        
        %needs to be the correct index i training-set
        indices(j,i) = index + (i-1)*chunkSize;
    end
    fprintf("Chunk %d/10\n",i)
end


%finding which one is nearest with all chuncks:
finalLabels = zeros(10000,1);

for i = 1:10000
    [d, index] = min(distances(i,:));
    finalLabels(i) = trainingLabels(indices(i,index));
end



