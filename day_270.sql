

Question :  Write a SQL query to print the node id and the type of the node (Root, Inner, Leaf). Sort the result by the node id.
            Explanation
            To classify the nodes into Root, Inner, or Leaf:
            • ARootnodehasp_idasNULL.
            • An Inner node has a parent (p_id is not NULL) and at least one child.
            • A Leaf node has a parent (p_id is not NULL) and no children.


CREATE TABLE tree (
id INT PRIMARY KEY,
p_id INT );

INSERT INTO tree (id, p_id) VALUES
    (1, NULL),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2);


    
select id, case when p_id is null then "root"
                when id in (select DISTINCT p_id from tree where p_id is not null) then "inner"
                else "leaf" end as type
from tree
order by 1;
