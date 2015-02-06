function sortedArray = QuickSort(array)

if numel(array) <= 1 %If the array has 1 element then it can't be sorted
    sortedArray = array;
    return
end

pivot = array(end);
array(end) = [];

left = array(array <= pivot);
right = array(array > pivot);
[left pivot right];
sortedArray = [QuickSort( array(array <= pivot) ) pivot QuickSort( array(array > pivot) )];

end